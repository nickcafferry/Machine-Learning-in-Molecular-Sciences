(* ::Package:: *)

(*  qmmlpack                                                           *)
(*  (c) Matthias Rupp, 2006-2015.                                      *)
(*  All rights reserved. No explicit or implicit warranty of any kind. *)
(*  http://www.mrupp.info                                              *)

(* Mathematica Package *)

BeginPackage["QMMLPack`"]


(*  ***************  *)
(*  *  Utilities  *  *)
(*  ***************  *)

Begin["`Private`"]

(* Formatting helper for integers, reals, vectors, matrices *)
exportFormat[arg_, ndigits_:Automatic] := Module[{digits, t, nr = 8, ni = 10},
    digits = If[ndigits === Automatic, Ceiling[Log[10, Floor[Max[Abs[arg]]]+1]], ndigits]; (* If arg is not numeric, ndigits is obligatory *)

    Which[
        NumericQ[arg], ToString[NumberForm[arg, {nr+digits,nr}, NumberPadding->{" ","0"}, NumberSigns->{"-"," "}, ExponentFunction->(Null&)]],
        VectorQ[arg, IntegerQ], Map[IntegerString[#, ni, digits]&, arg],
        VectorQ[arg, NumericQ], Map[ToString[NumberForm[#, {nr+digits,nr}, NumberPadding->{" ","0"}, NumberSigns->{"-"," "}, ExponentFunction->(Null&)]]&, arg],
        MatrixQ[arg, IntegerQ], Map[IntegerString[#, ni, digits]&, arg, {2}],
        MatrixQ[arg, NumericQ], Map[ToString[NumberForm[#, {nr+digits,nr}, NumberPadding->{" ","0"}, NumberSigns->{"-"," "}, ExponentFunction->(Null&)]]&, arg, {2}],
        True,
            Map[(
                t = If[StringQ[#], #, ToString[#]];
                t <> StringJoin[ConstantArray[" ", Max[0, digits-StringLength[t]]]]
            ) &, arg, {2}]
    ]
];

(* Atomic numbers to avoid calls to ElementData and associated bug (Mathematica sometimes closes the ElementData stream when exporting) *)
elementAbbreviations = {"H","He","Li","Be","B","C","N","O","F","Ne","Na","Mg","Al","Si","P","S","Cl","Ar","K","Ca","Sc","Ti","V","Cr","Mn","Fe","Co","Ni","Cu","Zn","Ga","Ge","As","Se","Br","Kr","Rb","Sr","Y","Zr","Nb","Mo","Tc","Ru","Rh","Pd","Ag","Cd","In","Sn","Sb","Te","I","Xe","Cs","Ba","La","Ce","Pr","Nd","Pm","Sm","Eu","Gd","Tb","Dy","Ho","Er","Tm","Yb","Lu","Hf","Ta","W","Re","Os","Ir","Pt","Au","Hg","Tl","Pb","Bi","Po","At","Rn","Fr","Ra","Ac","Th","Pa","U","Np","Pu","Am","Cm","Bk","Cf","Es","Fm","Md","No","Lr","Rf","Db","Sg","Bh","Hs","Mt","Ds","Rg","Cn","Uut","Fl","Uup","Lv","Uus","Uuo"};
Do[elementData[i, "Abbreviation"] = elementAbbreviations[[i]];, {i, Length[elementAbbreviations]}];

End[]


(*  *******************************  *)
(*  *  File format: extended XYZ  *  *)
(*  *******************************  *)

Begin["`Private`"]

(* See here for more information: *)
(* https://camtools.cam.ac.uk/wiki/site/5b59f819-0806-4a4d-0046-bcad6b9ac70f/extendedxyz.html *)
(* http://jrkermode.co.uk/quippy/io.html#extendedxyz *)
(* https://dirac.ruc.dk/wiki/index.php/Extended_xyz_format *)

(* Import *)

ExtendedXYZImportElements = {
    {"VertexTypes", ExtendedXYZImportVertexTypes},                   (* Atom types *)
    {"VertexCoordinates", ExtendedXYZImportVertexCoordinates},       (* Atom coordinates *)
    {"MolecularProperties", ExtendedXYZImportMolecularProperties},   (* Molecular properties *)
    {"AtomicProperties", ExtendedXYZImportAtomicProperties},         (* Atomic properties *)
    {"AdditionalProperties", ExtendedXYZImportAdditionalProperties}  (* Additional properties *)
};

(* Default importer loads and parses complete file *)

Options[ExtendedXYZImportDefault] = {"AdditionalProperties" -> False};

(* This parser can not handle numerical element specifications and is not fast. If a faster implementation is required, C might be an option (either creating ragged arrays or a string for ToExpression[]) *)

ExtendedXYZImportDefault[s_String, opts___?OptionQ] := ExtendedXYZImportDefault[StringToStream[s],opts];
ExtendedXYZImportDefault[input_InputStream, opts___?OptionQ] := Module[
    {text,blocks,nblocks,parts,start,end,i,j,block,nlpos,data,na,nap,an,xyz,mp,ap,addp,res,oaddprop},

    oaddprop = OptionValue[ExtendedXYZImportDefault, opts, "AdditionalProperties"];
    Assert[MemberQ[{False, True}, oaddprop]];

    (* Load data *)
    text = Import[input, "String"];
    text = StringTrim[text] <> "\n";

    (* Parse start and end positions of molecule blocks *)
    blocks = If[oaddprop,  
        (* Molecule blocks are separated by blank lines *)
        end = Append[StringPosition[text, "\n"~~(" "|"\t")...~~"\n"][[All,2]], StringLength[text]];
        start = Prepend[Most[end + 1], 1];
        Transpose[{start,end}],
        (* Parse atom numbers and count lines *)
        (* The only lines that can contain a single number are the first and the second lines of a molecule block *)
        start = StringPosition[text, StartOfLine~~Whitespace...~~NumberString~~(" "|"\t")...~~"\n"~~Except["\n"]...~~"\n", Overlaps -> False][[All,1]];
        end = Append[Rest[start - 1], StringLength[text]];
        Transpose[{start,end}]
    ];

    (* Number of atomic properties; assumes that this is the same for all atoms *)
    nap = Length[StringSplit[Most[StringSplit[text, "\n", 4]][[3]]]] - 4;

    (* Parse each molecule *)
    (* Profiling indicates that StringTake is abysmally slow, as in this solution:           *)
    (*     parts = Map[StringTake[text, #] &, blocks]; takes 20s for 1000 molecules          *)
    (* Using StringInsert / StringSplit is faster (5s instead of 20s):                        *)
    (*     parts = StringInsert[text, "@", blocks[[All,1]]]; parts = StringSplit[parts, "@"]; *)
    (* Using Characters / Take / StringJoin is faster again (1.5s instead of 5s):             *)
    (*     parts = Characters[text]; parts = Map[StringJoin[Take[parts, #]] &, blocks];       *)
    nblocks = Length[blocks];
    text = Characters[text];
    parts = Map[StringJoin[Take[text, #]] &, blocks];
    res = Reap[
        Do[(
            block = parts[[i]];
            nlpos = StringPosition[block, "\n", Overlaps -> False][[All,1]];  (* Positions of newlines *)
            
            (* 1: Number of atoms *)
            na = FromDigits[StringTrim[StringTake[block, nlpos[[1]]]]];

            (* 2: Name, molecular properties *)
            Sow[Map[If[StringMatchQ[#, NumberString], ToExpression[#], #] &, StringSplit[StringTake[block, {nlpos[[1]]+1, nlpos[[2]]}]]], 1];

            (* 3: Atom block *)
            data = ReadList[StringToStream[StringTake[block, {nlpos[[2]]+1, nlpos[[na+2]]}]], Join[{Word,Number,Number,Number}, ConstantArray[Word,nap]]];
            data[[All, 5;;]] = ToExpression[data[[All, 5;;]]];
            (* data = ReadList[StringToStream[StringTake[block, {nlpos[[2]]+1, nlpos[[na+2]]}]], Join[{Word,Number,Number,Number}, Table[Number,{nap}]]]; *)
            Sow[data[[All,1]], 2]; (* Atomic numbers *)
            Sow[data[[All,{2,3,4}]], 3]; (* Coordinates *)
            If[nap > 0, Sow[Transpose[data[[All,5;;nap+4]]], 4]];

            (* 4: Additional properties block *)
            If[oaddprop, Sow[StringSplit[StringTake[block, {nlpos[[na+2]], -1}], "\n"], 5]];
        )
    , {i, nblocks}]][[2]];

    mp = Transpose[res[[1]]];
    an = res[[2]];
    an = Map[If[StringMatchQ[#,DigitCharacter..], elementData[FromDigits[#], "Abbreviation"], #] &, an, {2}];
    xyz = res[[3]];
    ap = If[nap > 0, Transpose[res[[4]]], {}];
    addp = If[oaddprop, Transpose[res[[5]]], {}];

    res = {"VertexTypes" -> an, "VertexCoordinates" -> xyz, "MolecularProperties" -> mp, "AtomicProperties" -> ap};
    If[oaddprop, Append[res, "AdditionalProperties" -> addp], res]
];

(* Export *)

Options[ExtendedXYZExport] = {"Names" -> None, "MolecularProperties" -> {}, "AtomicProperties" -> {}};

(* Data is atomic numbers and coordinates *)
(* Atomic and molecular properties are given as {{p1m1,p1m2,...},{p2m1,p2m2,...},...}, i.e., first index is property, second index is molecule. 
   For atomic properties, third index is atom *)
ExtendedXYZExport[filename_, data_, opts___?OptionQ] := Module[{an,xyz,stream,name,mproperties,aproperties,sout,i,j,nmols,n,block,t},
    (* Parse data *)
    If[Not[ListQ[data]] || Length[data] != 2, Message[Import::fmterr, "extXYZ"]; Return[$Failed]];
    {an,xyz} = If[MemberQ[{Rule, RuleDelayed}, Head[First[data]]], {"VertexTypes" /. data, "VertexCoordinates" /. data}, data];

    (* Options *)
    {name,mproperties,aproperties} = OptionValue[ExtendedXYZExport, {opts}, {"Names", "MolecularProperties", "AtomicProperties"}];

    (* Treat single molecule as a special case of multiple molecules *)
    If[Depth[an] == 2, (
        nmols = 1;
        {an,xyz} = {{an},{xyz}};
        name = {name};
        mproperties = Map[{#}&, mproperties];
        aproperties = Map[{#}&, aproperties];
    ),(
        nmols = Length[an];
        If[name === None, name = ConstantArray[None, nmols];];
        If[mproperties === {}, mproperties = {ConstantArray[{}, nmols]};];
        If[aproperties === {}, aproperties = {Table[{}, {i,nmols}, {j,Length[an[[i]]]}]};];
    )];

    (* Convert atomic numbers from proton numbers to element abbreviations if necessary; no formatting yet *)
    an = Map[If[IntegerQ[#], elementData[#, "Abbreviation"], #] &, an, {2}];

    (* Create extended XYZ file *)
    sout = "";
    For[i = 1, i <= nmols, ++i, (
        (* Line 1: Number of atoms *)
        n = Length[an[[i]]];
        sout = sout <> IntegerString[n]<>"\n";

        (* Line 2: Molecular properties *)
        sout = sout <> If[name[[i]] === None, "", name[[i]] <> " "];
        (* t = Map[exportFormat[#] &, mproperties[[All,i]]]; *) (* Molecular properties are on a single line, no block alignment is necessary *)
        t = Map[ToString, mproperties[[All,i]], {-1}];
        t = Map[If[VectorQ[#], StringJoin[Riffle[#, " "]], #] &, t];
        sout = sout <> StringJoin[Riffle[t, "  "]] <> "\n";

        (* Line 3ff: molecule and atomic properties *)
        block = Join[{Transpose[{an[[i]]}], xyz[[i]]}, aproperties[[All, i]]];
        block = Map[exportFormat[#, If[MemberQ[#, _?(Not[NumericQ[#]]&), {2}], 3, Automatic]] &, block];
        block = Map[If[MatrixQ[#], #, Transpose[{#}]] &, block];
        block = Map[StringJoin[Riffle[#, " "]] &, block, {2}];
        block = ReleaseHold[Riffle[block, Hold[Transpose[{ConstantArray["   ", n]}]]]]; (* Intersperse major blocks with more spacing *)
        block = Map[StringJoin, Transpose[block]];
        block = StringJoin[Riffle[block, "\n"]];
        sout = sout <> block;

        (* No empty line if no additional properties *)
        If[i < nmols, sout = sout <> "\n"];
    )];

    stream = OpenWrite[filename];
    WriteString[stream, sout];
    Close[stream];
];

End[]

ImportExport`RegisterImport[
    "extXYZ",
    Append[MapThread[#1 :> #2 &, Transpose[QMMLPack`Private`ExtendedXYZImportElements]], QMMLPack`Private`ExtendedXYZImportDefault],
    "AvailableElements" -> QMMLPack`Private`ExtendedXYZImportElements[[All,1]],
    "FunctionChannels" -> {"Streams"}
];

ImportExport`RegisterExport[
    "extXYZ",
    QMMLPack`Private`ExtendedXYZExport,
    "Options" -> {"Name", "MolecularProperties", "AtomicProperties"}
];


EndPackage[]
