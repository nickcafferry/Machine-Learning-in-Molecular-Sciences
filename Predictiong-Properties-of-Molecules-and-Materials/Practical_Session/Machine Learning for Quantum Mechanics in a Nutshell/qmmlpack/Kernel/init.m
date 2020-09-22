(* ::Package:: *)

(*  qmmlpack                                                           *)
(*  (c) Matthias Rupp, 2006-2015.                                      *)
(*  All rights reserved. No explicit or implicit warranty of any kind. *)
(*  http://www.mrupp.info                                              *)

(* Mathematica Init File *)

BeginPackage["QMMLPack`"]

Begin["`Private`"]

msg = "\[Copyright] Matthias Rupp 2006\[LongDash]2015. Please cite
M. Rupp: Machine Learning for Quantum Mechanics in a Nutshell, \!\(\*StyleBox[\"Int. J. Quant. Chem.\",\nFontSlant->\"Italic\"]\), 2015.";
If[Not[$FrontEnd === Null], Print[msg]];

End[]

EndPackage[]

Get["QMMLPack`Mathematica`"]
Get["QMMLPack`Numerics`"]
Get["QMMLPack`Representation`"]
Get["QMMLPack`Formats`"]
Get["QMMLPack`Kernels`"]
Get["QMMLPack`Regression`"]
Get["QMMLPack`Validation`"]

