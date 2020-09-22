(* ::Package:: *)

(*  qmmlpack                                                           *)
(*  (c) Matthias Rupp, 2006-2015.                                      *)
(*  All rights reserved. No explicit or implicit warranty of any kind. *)
(*  http://www.mrupp.info                                              *)

(* Mathematica Package *)

BeginPackage["QMMLPack`"]


(*  **********  *)
(*  *  Loss  *  *)
(*  **********  *)

If[Not[ValueQ[Loss::usage]], Loss::usage =
"Loss[y,yhat] returns a list of loss (error) measures and related information.
Parameters:
  y - Vector of true labels.
  yhat - Vector of estimates.
Returns:
  List of rules with loss measures and related information, including number of samples (\"NumberOfSamples\"), root mean square error (\"RootMeanSquareError\"), mean absolute error (\"MeanAbsoluteError\"), \
standard deviation (\"StandardDeviation\"), maximum absolute error (\"MaximumAbsoluteError\"), correlation (\"Correlation\"), squared correlation (\"CorrelationSquared\"), 1-squared correlation (\"OneMinusCorrelationSquared\")."];

Begin["`Private`"]

Loss[y_?(VectorQ[#,NumericQ]&), yhat_?(VectorQ[#,NumericQ]&)] := Module[
    {n,residuals,rr},

    n = Length[y];
    Assert[n == Length[yhat]];

    residuals = y - yhat;
    rr = Quiet[Check[Correlation[y, yhat], $Failed, {Correlation::shlen, Correlation::zerosd}], {Correlation::shlen, Correlation::zerosd}];

    {
        "NumberOfSamples" -> n,
        "RootMeanSquareError" -> RootMeanSquare[residuals],
        "MeanAbsoluteError" -> Mean[Abs[residuals]],
        "StandardDeviation" -> StandardDeviation[residuals],
        "MedianAbsoluteError" -> Median[Abs[residuals]],
        "MaximumAbsoluteError" -> Max[Abs[residuals]],
        "Correlation" -> rr,
        "CorrelationSquared" -> If[NumericQ[rr], Power[rr, 2], rr],
        "OneMinusCorrelationSquared" -> 1-Power[rr, 2]
    }
];
   
End[]


EndPackage[]
