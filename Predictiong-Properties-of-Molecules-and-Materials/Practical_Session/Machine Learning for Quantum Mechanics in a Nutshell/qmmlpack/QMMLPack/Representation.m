(* ::Package:: *)

(*  qmmlpack                                                           *)
(*  (c) Matthias Rupp, 2006-2015.                                      *)
(*  All rights reserved. No explicit or implicit warranty of any kind. *)
(*  http://www.mrupp.info                                              *)

(* Mathematica Package *)

BeginPackage["QMMLPack`"]

(*  ********************  *)
(*  *  Coulomb matrix  *  *)
(*  ********************  *)

If[Not[ValueQ[CoulombMatrix::usage]], CoulombMatrix::usage =
"CoulombMatrix[an,r] computes Coulomb matrix representation of a molecule.
Parameters:
  an - atomic numbers of atoms
  r - Cartesian coordinates of atoms [pm]
Options:
  Unit [\"pm\"] - Unit of the coordinates. One of \"pm\", \"\[ARing]ngstr\[ODoubleDot]m\", \"bohr\".
  Padding [False] - Pad M with additional rows and columns of 0s for a total of kmax rows/columns, where kmax >= number of atoms.
  Vectorize [False] - \"Vectorizes\" matrix. True effectively returns Flatten[LowerTriangularPart[...]]. Passing k effectively returns Flatten[LowerTriangularPart[...,k]].
  Sort [True] - How to sort the Coulomb matrix. False does not sort, resulting in input order. True sorts by row norms.
  \"NuclearCharges\" [{1,2,3,...,118}] - Effective nuclear charges to use. Defaults to proton numbers. Use \"Slater1930\" for Slater's effective nuclear charges.
Returns:
  M - Coulomb matrix M.
Example:
  CoulombMatrix[{1,1},{{0,0,0},{74,0,0}}] returns {{0.5,0.715},{0.715,0.5}}.
  CoulombMatrix[{1,1},{{0,0,0},{0.74,0,0}},Unit->\"\[ARing]ngstr\[ODoubleDot]m\",Padding->3,Vectorize->True] returns {0.5,0.715,0.5,0.,0.,0.}.
"];

Begin["`Private`"]

(*** Auxiliary routines ***)

(* From J.C. Slater: Atomic Shielding Constants, Phys. Rev. 36(1): 57\[LongDash]64, 1930. doi: 10.1103/PhysRev.36.57 *)
slaterEffectiveNuclearCharges = 
    {1., 1.7, 1.3, 1.95, 2.6, 3.25, 3.9, 4.55, 5.2, 5.85, 2.2, 2.85, 3.5, 4.15, 4.8, 5.45, 6.1, 6.75, 2.2, 2.85,
    Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],
    5., 5.65, 6.3, 6.95, 7.6, 8.25, 2.2, 2.85,
    Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],
    5., 5.65, 6.3, 6.95, 7.6, 8.25, 2.2, 2.85, 
    Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],
    Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],
    5., 5.65, 6.3, 6.95, 7.6, 8.25, 2.2, 2.85,
    Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],
    Missing[],Missing[], 3.5, Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],Missing[],
    5., 5.65, 6.3, 6.95, 7.6, 8.25};

(*** Molecular Coulomb matrix ***)

CoulombMatrix::warn = "Warning: ``";

Options[CoulombMatrix] = {Unit -> "pm", Padding -> False, Vectorize -> False, Sort -> True, "NuclearCharges" -> Automatic};

CoulombMatrix[an_, r_, opts:OptionsPattern[]] := Module[{n,cf,padding,vect,vectk,sort,order,cm,i,j,nc,nchargef,ounit,opadding,ovectorize,osort,onuclearcharges},

    (* Parameters and options processing *)

    n = Length[an];
    Assert[ n == Length[r] ];
    Assert[ n > 0 ];
    Assert[ Dimensions[r][[2]] == 3 ];

    {ounit,opadding,ovectorize,osort,onuclearcharges} = OptionValue[{Unit,Padding,Vectorize,Sort,"NuclearCharges"}];

    (* Unit conversion factor *)
    cf = Switch[ounit,
        "pm", 0.01889726124559, (* CODATA 2010 *)
        "\[ARing]ngstr\[ODoubleDot]m" | "angstrom", 1.889726124559, (* CODATA 2010 *)
        "bohr" | "a.u.", 1.,
        _, Message[CoulombMatrix::warn, "Unknown unit."]; Return[$Failed]; 1
    ];

    (* Padding *)
    padding = Switch[opadding,
        False | None, n,
        _?(IntegerQ[#] && # >= n &), opadding,
        _, Message[CoulombMatrix::warn, "Invalid padding specification."]; Return[$Failed]; n
    ];

    (* Vectorize *)
    {vect,vectk} = Switch[ovectorize,
        False | None, {False,0},
        True, {True,0},
        _?(IntegerQ[#] && Abs[#] <= n &), {True,ovectorize},
        _, Message[CoulombMatrix::warn, "Invalid vectorization specification."]; Return[$Failed]; {False,0}
    ];

    (* Sorting *)
    sort = Switch[osort,
        False | True, osort,
        _, Message[CoulombMatrix::warn, "Invalid sorting specification."]; Return[$Failed]; True
    ];

    (* Nuclear charges *)
    (* Function accepting an atomic number and returning the corresponding charge to use *)
    nchargef = Switch[onuclearcharges,
        Automatic, Identity,
        _?(VectorQ[#, NumberQ] &), Function[i, onuclearcharges[[i]]],
        "Slater1930", Function[i, slaterEffectiveNuclearCharges[[i]]],
        _, Message[CoulombMatrix::warn, "Invalid nuclear charges specification."]; Return[$Failed];
    ]; 

    (* Calculate matrix *)

    nc = Map[nchargef, an];  (* Effective nuclear charges to use *)

    cm = EuclideanDistanceMatrix[r*cf];
    For[i = 1, i <= n, ++i, For[j = 1, j <= n, ++j,
        cm[[i,j]] = If[i == j, 0.5*nc[[i]]^2.4, nc[[i]]*nc[[j]]/cm[[i,j]]];
    ];];

    If[sort,
        order = Reverse[Ordering[Map[Norm, cm]]];
        cm = cm[[order,order]];
    ];

    cm = If[padding > n, PadRight[cm, {padding,padding}], cm];

    cm = If[vect, LowerTriangularPart[cm, vectk], cm];

    cm
];

End[]


EndPackage[]

