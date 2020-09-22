(* ::Package:: *)

(*  qmmlpack                                                           *)
(*  (c) Matthias Rupp, 2006-2014.                                      *)
(*  All rights reserved. No explicit or implicit warranty of any kind. *)
(*  http://www.mrupp.info                                              *)

(* Mathematica Package *)

BeginPackage["QMMLPack`"]


(*  *******************  *)
(*  *  Linear kernel  *  *)
(*  *******************  *)

If[Not[ValueQ[KernelLinear::usage]], KernelLinear::usage =
"KernelLinear[X,{}] returns the linear kernel matrix for the vectors in X.
KernelLinear[X,Z,{}] returns the linear kernel matrix between the vectors in X and Z.
KernelLinear[X,{},Diagonal] returns the diagonal of KernelLinear[X].
Parameters:
  X - Input samples (row vectors) of same dimension.
  Z - Input samples (row vectors) of same dimension as those in X.
Returns:
  K - Kernel matrix with \!\(\*SubscriptBox[\(K\), \(i, j\)]\) = Dot[\!\(\*SubscriptBox[\(X\), \(i\)]\),\!\(\*SubscriptBox[\(Z\), \(j\)]\)]."];

Begin["`Private`"]

kernelLinear1 = Compile[{{xx,_Real,2}}, Outer[Dot, xx, xx, 1]];
kernelLinear2 = Compile[{{xx,_Real,2},{zz,_Real,2}}, Outer[Dot, xx, zz, 1]];
kernelLinear3 = Compile[{{xx,_Real,2}}, Map[Dot[#,#]&, xx]];

KernelLinear[X_?MatrixQ, {}] := kernelLinear1[X];
KernelLinear[X_?MatrixQ, Z_?MatrixQ, {}] := kernelLinear2[X,Z];
KernelLinear[X_?MatrixQ, {}, Diagonal] := kernelLinear3[X];

End[]


(*  ***********************  *)
(*  *  Polynomial kernel  *  *)
(*  ***********************  *)

If[Not[ValueQ[KernelPolynomial::usage]], KernelPolynomial::usage =
"KernelPolynomial[X,{d}] returns the polynomial kernel matrix for the vectors in X.
KernelPolynomial[X,Z,{d}] returns the polynomial kernel matrix for the vectors in X and Z.
Parameters:
  X - Input samples (row vectors) of same dimension.
  Z - Input samples (row vectors) of same dimension as those in X.
  d - Degree of the kernel.
Returns:
  K - Kernel matrix with \!\(\*SubscriptBox[\(K\), \(i, j\)]\) = (<\!\(\*SubscriptBox[\(X\), \(i\)]\),\!\(\*SubscriptBox[\(X\), \(j\)]\)>\!\(\*SuperscriptBox[\()\), \(d\)]\)."];

Begin["`Private`"]

(* We allow fractional degrees (see Rossius et al, ECML 1998). *)
(* 2012-04-15: Brief literature check indicates that the most common form of the inhomogeneous polynomial kernel is (<x,y>+c)^d with C >= 0. *)
(*             See p. 1004 in B. Sch{\"o}lkopf, S. Mika, C. Burges, P. Knirsch, K.-R. M{\"u}ller, G. R{\"a}tsch, A. Smola: Input Space Versus Feature Space in Kernel-Based Methods, IEEE Trans Neural Network 10(5): 1000--1017, 1999 *)
(* 2015-01-08: Removed inhomogeneous version for light version *)
(* 2015-01-08: Removed fractional d values to avoid Mathematica bug (-1.^2. yields tiny imaginay value) *)

(* Computing the three-parameter version seems to be approximately as fast as computing the single-parameter version. *)

(* d will not be zero *)
kernelPolynomial1 = Compile[{{xx,_Real,2}, {d,_Integer,0}}, 
    Outer[Power[Dot[#1,#2], d] &, xx, xx, 1]
];

(* d will not be zero *)
kernelPolynomial2 = Compile[{{xx,_Real,2}, {zz,_Real,2}, {d,_Integer,0}}, 
    Chop[Outer[Power[Dot[#1,#2], d] &, xx, zz, 1]]
];

KernelPolynomial[X_?MatrixQ, {d_?(IntegerQ[#]&&NonNegative[#]&)}] :=      
        If[Chop[d] == 0,
            ConstantArray[1., {Length[X], Length[X]}],
            kernelPolynomial1[X, d]
        ];

KernelPolynomial[X_?MatrixQ, Z_?MatrixQ, {d_?(IntegerQ[#]&&NonNegative[#]&)}] := Module[{n, d1, m, d2},
    {n, d1} = Dimensions[X]; 
    {m, d2} = Dimensions[Z];
    Assert[d1==d2];
    
    If[Chop[d] == 0,
        ConstantArray[1., {n, m}],
        kernelPolynomial2[X, Z, d]
    ]
];

End[]


(*  *********************  *)
(*  *  Gaussian kernel  *  *)
(*  *********************  *)

If[Not[ValueQ[KernelGaussian::usage]], KernelGaussian::usage =
"KernelGaussian[X, {sigma}] returns the Gaussian kernel matrix for the vectors in X.
KernelGaussian[X, Z, {sigma}] returns the Gaussian kernel matrix for the vectors in X and Z.
KernelGaussian[X, {sigma}, Diagonal] returns the diagonal of the Gaussian kernel matrix for the vectors in X.
Parameters:
  X - Input samples (row vectors) of same dimension.
  Z - Input samples (row vectors) of same dimension as those in X.
  sigma - Length scale.
Returns:
  K - Kernel matrix with \!\(\*SubscriptBox[\(K\), \(i, j\)]\) = Exp[-\!\(\*FractionBox[\(\(||\)\(\*SubscriptBox[\(X\), \(i\)] - \*SubscriptBox[\(Z\), \(j\)]\)\*SuperscriptBox[\(||\), \(2\)]\), \(2 \*SuperscriptBox[\(\[Sigma]\), \(2\)]\)]\)]."];

Begin["`Private`"]

(* Negative \[Sigma] parameters would be possible (the square simply eradicates the sign),
but are not supported as this would bring no advantage, but possibly confusion *)

kernelGaussian1 = Compile[{{xx,_Real,2}, {ls,_Real,0}}, Exp[-SquaredEuclideanDistanceMatrix[xx]/(2*ls*ls)]];
kernelGaussian2 = Compile[{{xx,_Real,2}, {zz,_Real,2}, {ls,_Real,0}}, Exp[-SquaredEuclideanDistanceMatrix[xx,zz]/(2*ls*ls)]];
kernelGaussian3 = Compile[{{xx,_Real,2}, {ls,_Real,0}}, ConstantArray[1., Length[xx]]];

KernelGaussian[X_?MatrixQ, {sigma_?(NumericQ[#]&&NonNegative[#]&)}] := kernelGaussian1[X,sigma];  (* C function takes care of case sigma == 0 *)
KernelGaussian[X_?MatrixQ, Z_?MatrixQ, {sigma_?(NumericQ[#]&&NonNegative[#]&)}] := kernelGaussian2[X,Z,sigma];  (* C funcion takes care of case sigma == 0 *)
KernelGaussian[X_?MatrixQ, {sigma_?(NumericQ[#]&&NonNegative[#]&)}, Diagonal] := kernelGaussian3[X,sigma];

End[]


(*  **********************  *)
(*  *  Laplacian kernel  *  *)
(*  **********************  *)

If[Not[ValueQ[KernelLaplacian::usage]], KernelLaplacian::usage =
"KernelLaplacian[X, {sigma}] returns the Laplacian kernel matrix for the vectors in X.
KernelLaplacian[X, Z, {sigma}] returns the Laplacian kernel matrix for the vectors in X and Z.
KernelLaplacian[X, {sigma}, Diagonal] returns the diagonal of the Laplacian kernel matrix for the vectors in X.
Parameters:
  X - Input samples (row vectors) of same dimension.
  Z - Input samples (row vectors) of same dimension as those in X.
  sigma - Length scale.
Returns:
  K - Kernel matrix."];

Begin["`Private`"]

kernelLaplacian1 = Compile[{{xx,_Real,2}, {ls,_Real,0}}, Exp[-pNormDistanceMatrix1[xx, 1.]/ls]];
kernelLaplacian2 = Compile[{{xx,_Real,2}, {zz,_Real,2}, {ls,_Real,0}}, Exp[-pNormDistanceMatrix2[xx, zz, 1.]/ls]];
kernelLaplacian3 = Compile[{{xx,_Real,2}, {ls,_Real,0}}, ConstantArray[1., Length[xx]]];

KernelLaplacian[X_?MatrixQ, {sigma_?(NumericQ[#]&&NonNegative[#]&)}] := kernelLaplacian1[X,sigma];  (* C function takes care of case sigma == 0 *)
KernelLaplacian[X_?MatrixQ, Z_?MatrixQ, {sigma_?(NumericQ[#]&&NonNegative[#]&)}] := kernelLaplacian2[X,Z,sigma];  (* C funcion takes care of case sigma == 0 *)
KernelLaplacian[X_?MatrixQ, {sigma_?(NumericQ[#]&&NonNegative[#]&)}, Diagonal] := kernelLaplacian3[X,sigma];

End[]


EndPackage[]
