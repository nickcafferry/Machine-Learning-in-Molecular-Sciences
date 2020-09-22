(* ::Package:: *)

(*  qmmlpack                                                           *)
(*  (c) Matthias Rupp, 2006-2015.                                      *)
(*  All rights reserved. No explicit or implicit warranty of any kind. *)
(*  http://www.mrupp.info                                              *)

(* Mathematica Package *)

BeginPackage["QMMLPack`"]


(*  ****************************  *)
(*  *  KernelRidgeRegression  *  *)
(*  ****************************  *)

(* See Rasmussen & Williams, Gaussian Processes for Machine Learning, MIT Press, 2006. *)

If[Not[ValueQ[KernelRidgeRegression::usage]], KernelRidgeRegression::usage =
"KernelRidgeRegression[K,y] returns a Kernel ridge regression model.
Parameters:
  K - Kernel matrix of training samples.
  y - Labels of training samples.
Options:
  RegularizationStrength [1] - Regularization strength \[Lambda].
  Center [False] - If True, kernel matrix and labels are centered to have zero mean.
Returns:
  model - A model that can be used to predict new samples and queried for parameters.
  Usage of the model:
    model[L], model[L,\"Predictions\"] - Returns predictions for new samples; L is the kernel matrix between training and test samples.
    model[\"Properties\"] - Returns a list of queryable properties. These include \"Weights\", \"RegularizationStrength\", \"KernelMatrix\", \"Options\", \"Properties\".
Remarks:
  If Center is True, L and M are also centered with respect to K for predictions.
"];

Begin["`Private`"]

SetAttributes[kernelRidgeRegressionModel, HoldAll];

KernelRidgeRegression::warn = "Warning: ``";
KernelRidgeRegression::fail = "Kernel ridge regression failed (``).";

Options[KernelRidgeRegression] = {RegularizationStrength -> 1, Center -> False};

KernelRidgeRegression[kk_?(MatrixQ[#,NumericQ]&), y_?(VectorQ[#,NumericQ]&), opts:OptionsPattern[]] := Module[
    {n,uu,yc,ymean,alpha,popts,kkc,oRegularizationStrength,oCenter},

    (* Parameter and options processing *)
    n = Length[y];
    Assert[n > 0];
    Assert[Dimensions[kk] == {n,n}];

    {oRegularizationStrength,oCenter} = OptionValue[Options[KernelRidgeRegression][[All,1]]];

    Assert[NumericQ[oRegularizationStrength] || (VectorQ[oRegularizationStrength,NumericQ] && Length[oRegularizationStrength] == n)];

    Assert[MemberQ[{False,True}, oCenter]];

    (* Centering of labels *)
    ymean = If[oCenter, Chop[Mean[y]], 0];
    yc = y - ymean;

    (* Centering of kernel matrix *)
    kkc = If[oCenter, CenterKernelMatrix[kk], kk];
    oRegularizationStrength = If[VectorQ[oRegularizationStrength], oRegularizationStrength, ConstantArray[oRegularizationStrength,n]]; (* Transform noise level to vector form if scalar *)
    kkc = MatrixAddToDiagonal[kkc, oRegularizationStrength]; (* Variance, so not squared *)

    (* Kernel ridge regression *)
    uu = Quiet[Check[CholeskyDecomposition[kkc], $Failed, {CholeskyDecomposition::posdef}], {CholeskyDecomposition::posdef}];  (* U^T U = Kc + lambda I *)
    If[uu === $Failed, Message[KernelRidgeRegression::fail, StringForm["Regularization strength too low; ``-``", NumberForm[Min[oRegularizationStrength],3], NumberForm[Max[oRegularizationStrength],3]]]; Return[uu];];  (* If matrix decomposition fails, noise level is too low. Abort and leave consequences to caller (e.g., increase noise level) *)
    alpha = BackwardForwardSubstitution[uu, yc];  (* alpha = (Kc + sigma^2 I)^-1 y *)

    (* Processed option values *)
    popts = MapThread[#1[[1]] -> #2 &, {Options[KernelRidgeRegression], {oRegularizationStrength, oCenter}}];

    kernelRidgeRegressionModel[{
        "KernelMatrix" -> kk,           (* Kernel matrix (as passed, e.g., not centered; n x n matrix) *)
        "CholeskyDecomposition" -> uu,  (* Cholesky decomposition (n x n upper triangular matrix) of K + lambda I (with regularization constant) *)
        "Labels" -> yc,                 (* Centered label vector (n vector) *)
        "LabelMean" -> ymean,           (* Mean of label vector (scalar) *)
        "Weights" -> alpha,             (* Regression weights (n vector) *)
        "Options" -> popts              (* Processed options (list) *)
    }]
];

Unprotect[Properties];
    Properties[kernelRidgeRegressionModel[state_]] := {"CholeskyDecomposition", "KernelMatrix", "LabelMean", "Labels", "RegularizationStrength", "Options", "Properties", "Weights"};
Protect[Properties];

kernelRidgeRegressionModel[state_]["CholeskyDecomposition"] := "CholeskyDecomposition" /. state;
kernelRidgeRegressionModel[state_]["KernelMatrix"] := "KernelMatrix" /. state;
kernelRidgeRegressionModel[state_]["LabelMean"] := "LabelMean" /. state;
kernelRidgeRegressionModel[state_]["Labels"] := "Labels" /. state;
kernelRidgeRegressionModel[state_]["RegularizationStrength"] := "RegularizationStrength" /. ("Options" /. state);
kernelRidgeRegressionModel[state_]["Options"] := "Options" /. state;
kernelRidgeRegressionModel[state_]["Properties"] := Properties[kernelRidgeRegressionModel];
kernelRidgeRegressionModel[state_]["Weights"] := "Weights" /. state;

kernelRidgeRegressionModel[state_][ll_?(MatrixQ[#,NumericQ]&)] := kernelRidgeRegressionModel[state][ll, "Predictions"];
kernelRidgeRegressionModel[state_][ll_?(MatrixQ[#,NumericQ]&), "Predictions"] := Module[
    {n,m,kk,llc,alpha,ymean,opts,oCenter},

    (* Parameter and options processing *)
    {n,m} = Dimensions[ll];

    {opts,kk,ymean,alpha} = {"Options", "KernelMatrix", "LabelMean", "Weights"} /. state;

    oCenter = OptionValue[KernelRidgeRegression, opts, Center];

    (* Center kernel matrix if required *)
    llc = If[oCenter, CenterKernelMatrix[kk, ll], ll];

    (* Predictive mean *)
    Transpose[llc] . alpha + ymean  (* If no label centering, mean will be 0 *)
];

dotSelf = Compile[{{x,_Real,1}}, Dot[x,x], CompilationTarget->"C"];  (* Transfer to C library *)

End[]


EndPackage[]
