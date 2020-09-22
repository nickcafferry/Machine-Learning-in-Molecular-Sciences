(* ::Package:: *)

(*  qmmlpack                                                           *)
(*  (c) Matthias Rupp, 2006-2015.                                      *)
(*  All rights reserved. No explicit or implicit warranty of any kind. *)
(*  http://www.mrupp.info                                              *)
 
(* Mathematica Package *)
 
BeginPackage["QMMLPack`"]

(*  ***************************************  *)
(*  *  Forward and backward substitution  *  *)
(*  ***************************************  *)

If[Not[ValueQ[BackwardForwardSubstitution::usage]], BackwardForwardSubstitution::usage =
"BackwardForwardSubstitution[U,rhs] solves for x such that U\[Transpose] U x = rhs.
Parameters:
  U - Upper triangular matrix.
  rhs - Vector of compatible dimensions.
Returns:
  Solution vector x to the linear system of equations L L\[Transpose] x = rhs, or, U\[Transpose] U x = rhs, respectively.
Example:
  If U is the Cholesky decomposition of M, then BackwardForwardSubstitution[U,b] solves the linear system of equations M x = b."];

Begin["`Private`"] 

backwardForwardSubstitutionUpper = Compile[{{uu,_Real,2}, {rhs,_Real,1}}, Module[{n = Length[rhs], res, i, j, val},
    res = ConstantArray[0., n];

    (* Forward substitution of Transpose[uu] and rhs *)
    For[i = 1, i <= n, ++i, 
        val = rhs[[i]];
        For[j = 1, j < i, ++j, val -= uu[[j,i]]*res[[j]];];
        res[[i]] = val / uu[[i,i]];
    ];
    
    (* Backward substitution of uu and t *)
    For[i = n, i >= 1, --i, 
        val = res[[i]];
        For[j = n, j > i, --j, val -= uu[[i,j]]*res[[j]];];
        res[[i]] = val / uu[[i,i]];
    ];

    res
]];

BackwardForwardSubstitution[{{}},{}] = {};
BackwardForwardSubstitution[U_?MatrixQ,rhs_?VectorQ] := backwardForwardSubstitutionUpper[U,rhs];

End[]


(*  *************************  *)
(*  *  MatrixAddToDiagonal  *  *)
(*  *************************  *)

If[Not[ValueQ[MatrixAddToDiagonal::usage]], MatrixAddToDiagonal::usage =
"MatrixAddToDiagonal[M,c] adds constant c to diagonal of square matrix M
MatrixAddToDiagonal[M,v] adds a vector v to diagonal of square matrix M"];

Begin["`Private`"]

(*matrixAddToDiagonal1 = LibraryFunctionLoad[libQMMLPack, "qmml_mathematica_matrix_add_diagonal1", {{Real, 2, "Constant"}, Real}, {Real, 2}];
matrixAddToDiagonal2 = LibraryFunctionLoad[libQMMLPack, "qmml_mathematica_matrix_add_diagonal2", {{Real, 2, "Constant"}, {Real, 1, "Constant"}}, {Real, 2}];*)

matrixAddToDiagonal1 = Compile[{{mm,_Real,2}, {c,_Real,0}}, Module[{n = Length[mm], res = mm, i},
    For[i = 1, i <= n, ++i, res[[i,i]] += c;];
    res
]];

matrixAddToDiagonal2 = Compile[{{mm,_Real,2}, {v,_Real,1}}, Module[{n = Length[mm], res = mm, i},
    For[i = 1, i <= n, ++i, res[[i,i]] += v[[i]];];
    res
]];

MatrixAddToDiagonal[m_?(MatrixQ[#,NumericQ]&), c_?NumericQ] := matrixAddToDiagonal1[m, c];
MatrixAddToDiagonal[m_?(MatrixQ[#,NumericQ]&), v_?(VectorQ[#,NumericQ]&)] := matrixAddToDiagonal2[m, v];

End[]


(*  *************************  *)
(*  *  LowerTriangularPart  *  *)
(*  *************************  *)

If[Not[ValueQ[LowerTriangularPart::usage]], LowerTriangularPart::usage =
"LowerTriangularPart[m] returns the lower triangular part of the quadratic matrix m.
LowerTriangularPart[m, k] uses only elements on and below the k-th main diagonal of m.
Examples:
  LowerTriangularPart[{{a,b},{c,d}}] returns {a,c,d}.
  LowerTriangularPart[m] includes the main diagonal, LowerTriangularPart[m,-1] does not."];

Begin["`Private`"]

lowerTriangularPart = Compile[{{mm,_Real,2}, {k,_Integer,0}}, Module[{n,m,res,len=0,t,i,j},
    (* Determine number of elements *)
    {n,m} = Dimensions[mm];
    len = IntegerPart[Which[
        k <= -n, 0,
        k <= 0, If[n+k<=m, ((n+k)*(n+k+1))/2,(m*(1-m+2*n+2*k))/2],
        k < m, If[n+k<=m, (n*(2*k+n+1))/2,((m-k)*(k+1-m))/2+m*n],
        True, n*m
    ]];

    (* Extract elements *)
    res = ConstantArray[0., len];
    Which[
        (* k\[LessEqual]-n, , (* Zero length, no action *) *)
        k<=0,
        If[n+k<=m,
            For[t = 0; i = -k, i < n, ++i, For[j = 0, j <= i+k, ++j, res[[t+++1]] = mm[[i+1,j+1]];]];
            ,
            For[t = 0; i = -k, i < m-k, ++i, For[j = 0, j <= i+k, ++j, res[[t+++1]] = mm[[i+1,j+1]];]];
            res[[t+1;;len]] = Flatten[mm[[m-k+1;;n]]];
        ],
        k<m,
        If[n+k<=m,
            For[t = 0; i = 0, i < n, ++i, For[j = 0, j <= i+k, ++j, res[[t+++1]] = mm[[i+1,j+1]];]];
            ,
            For[t = 0; i = 0, i < m-k, ++i, For[j = 0,j <= i+k, ++j, res[[t+++1]] = mm[[i+1,j+1]];]];
            res[[t+1;;len]] = Flatten[mm[[m-k+1;;n]]];
        ],
        True, res = Flatten[mm]
    ];

    res
]];

(* If the necessity for results of the form {{a},{b,c},{d,e,f,},...} should come up,
   add an option Flatten with default value True. Using UpValues (Flatten[LowerTr...[...]])
   seems difficult because the more specific LowerTriang...[...] would be evaluated first. *)

LowerTriangularPart[m_?(MatrixQ[#,NumericQ]&)] := lowerTriangularPart[m, 0];
LowerTriangularPart[m_?(MatrixQ[#,NumericQ]&), k_Integer] := lowerTriangularPart[m, k];

End[]


(*  *****************************  *)
(*  *  EuclideanDistanceMatrix  *  *)
(*  *****************************  *)

If[Not[ValueQ[EuclideanDistanceMatrix::usage]], EuclideanDistanceMatrix::usage =
"EuclideanDistanceMatrix[X,Z] returns matrix of Euclidean distances between rows of X and Z.
EuclideanDistanceMatrix[X] is equivalent to EuclideanDistanceMatrix[X,X].
Parameters:
  X - Numeric n x d matrix.
  Z - Numeric m x d matrix.
Returns:
  n x m matrix of Euclidean distances between rows of X and Z."];

Begin["`Private`"]

euclideanDistanceMatrix1 = Compile[{{x,_Real,2}}, Outer[Norm[#1-#2]&, x, x, 1]];
euclideanDistanceMatrix2 = Compile[{{x,_Real,2}, {z,_Real,2}}, Outer[Norm[#1-#2]&, x, z, 1]];

EuclideanDistanceMatrix[X_?(MatrixQ[#,NumericQ]&)] := euclideanDistanceMatrix1[X];
EuclideanDistanceMatrix[X_?(MatrixQ[#,NumericQ]&), Z_?(MatrixQ[#,NumericQ]&)] := euclideanDistanceMatrix2[X,Z];

End[]


(*  ************************************  *)
(*  *  SquaredEuclideanDistanceMatrix  *  *)
(*  ************************************  *)

If[Not[ValueQ[SquaredEuclideanDistanceMatrix::usage]], SquaredEuclideanDistanceMatrix::usage =
"SquaredEuclideanDistanceMatrix[X,Z] returns matrix of squared Euclidean distances between rows of X and Z.
SquaredEuclideanDistanceMatrix[X] is equivalent to SquaredEuclideanDistanceMatrix[X,X].
Parameters:
  X - Numeric n x d matrix.
  Z - Numeric m x d matrix.
Returns:
  n x m matrix of squared Euclidean distances between rows of X and Z."];
  
Begin["`Private`"]

squaredEuclideanDistanceMatrix1 = Compile[{{xx,_Real,2}}, Outer[Total[Power[#1-#2, 2]]&, xx, xx, 1]];
squaredEuclideanDistanceMatrix2 = Compile[{{xx,_Real,2}, {zz,_Real,2}}, Outer[Total[Power[#1-#2, 2]]&, xx, zz, 1]];

SquaredEuclideanDistanceMatrix[X_?(MatrixQ[#,NumericQ]&)] := squaredEuclideanDistanceMatrix1[X];
SquaredEuclideanDistanceMatrix[X_?(MatrixQ[#,NumericQ]&), Z_?(MatrixQ[#,NumericQ]&)] := squaredEuclideanDistanceMatrix2[X,Z];

End[]


(*  *************************  *)
(*  *  PNormDistanceMatrix  *  *)
(*  *************************  *)

If[Not[ValueQ[PNormDistanceMatrix::usage]], PNormDistanceMatrix::usage =
"PNormDistanceMatrix[X,Z,p] returns matrix of p-norm distances between rows of X and Z.
PNormDistanceMatrix[X,p] is equivalent to PNormDistanceMatrix[X,X,p].

Parameters:
  X - Numeric n x d matrix
  Z - Numeric m x d matrix

Returns:
  n x m matrix of p-norm distances between rows of X and Z."];

Begin["`Private`"]

pNormDistanceMatrix1 = Compile[{{xx,_Real,2}, {p,_Real,0}}, Outer[Norm[#1-#2, p] &, xx, xx, 1]];
pNormDistanceMatrix2 = Compile[{{xx,_Real,2}, {zz,_Real,2}, {p,_Real,0}}, Outer[Norm[#1-#2, p] &, xx, zz, 1]];

PNormDistanceMatrix[xx_?(MatrixQ[#,NumericQ]&), p_?(NumericQ[#]&&Positive[#]&)] := pNormDistanceMatrix1[xx,p];
PNormDistanceMatrix[xx_?(MatrixQ[#,NumericQ]&), zz_?(MatrixQ[#,NumericQ]&), p_?(NumericQ[#]&&Positive[#]&)] := pNormDistanceMatrix2[xx,zz,p];

End[]


EndPackage[]
