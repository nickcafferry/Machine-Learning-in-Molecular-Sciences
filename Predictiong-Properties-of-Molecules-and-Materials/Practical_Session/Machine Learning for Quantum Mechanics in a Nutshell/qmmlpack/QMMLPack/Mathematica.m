(* ::Package:: *)

(*  qmmlpack                                                           *)
(*  (c) Matthias Rupp, 2006-2015.                                      *)
(*  All rights reserved. No explicit or implicit warranty of any kind. *)
(*  http://www.mrupp.info                                              *)

(* Mathematica Package *)

BeginPackage["QMMLPack`"]

(*  ********************  *)
(*  *  MoleculePlot3D  *  *)
(*  ********************  *)

ImportString["1", "List"]; (* Force-load stub symbols *)

If[Not[ValueQ[MoleculePlot3D::usage]], MoleculePlot3D::usage =
   "MoleculePlot3D[an,xyz] plots a molecule with atom types an and atom coordinates (in pm) xyz in 3D."];

Begin["`Private`"]

Options[MoleculePlot3D] = Options[Graphics3D];

MoleculePlot3D[an_?ListQ, xyz_?MatrixQ, opts:OptionsPattern[]] := Module[{vt,vc},
    vt = Map[If[NumberQ[#], ElementData[#,"Abbreviation"], #] &, an];
    vc = xyz;
    ImportExport`MoleculePlot3D[{"VertexTypes" -> vt, "VertexCoordinates" -> vc}, opts]
];

End[]


EndPackage[]
