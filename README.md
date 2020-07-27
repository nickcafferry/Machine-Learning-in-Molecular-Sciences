[![Documentation Status](https://readthedocs.org/projects/machine-learning-on-molecular-sciences/badge/?version=latest)](https://machine-learning-on-molecular-sciences.readthedocs.io/en/latest/?badge=latest)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://choosealicense.com/licenses/mit/)
[![Mathematica](https://img.shields.io/badge/mathematica-v11.0-brightgreen)](https://www.wolfram.com/mathematica/)
[![Python version](https://img.shields.io/badge/python-3.7,3.8-blue.svg)](https://www.python.org/)
[![Wolfram Cloud](https://img.shields.io/badge/platform-wolfram%20cloud-brightgreen)](https://www.wolframcloud.com/)
[![Huawei Clodu](https://img.shields.io/badge/platform-huawei%20cloud-blue)](https://auth.huaweicloud.com/authui/login.html?service=https%3A%2F%2Fconsole.huaweicloud.com%2Fconsole%2F%3Flocale%3Dzh-cn#/login)

**[Aims](#aims)** |
**[Panel Topics](#panel-topics)** |
**[Course Schedule](#course-schedule)** |
**[Internal Links](#internal-links)** |
**[External Links](#external-links)** |

# Welcome to Machine Learning in the Molecular Sciences
---

[![UosEmd.md.jpg](https://s1.ax1x.com/2020/07/21/UosEmd.md.jpg)](https://imgchr.com/i/UosEmd)

### Aims

The NYU-ECNU Center for Computational Chemistry at [New York University Shanghai](https://shanghai.nyu.edu/) (a.k.a, NYU Shanghai) announced a summer school dedicated to machine learning and its applications in the molecular sciences to be held June, 2017 at the NYU Shanghai Pudong Campus. Using a combination of technical lectures and hands-on exercises, the school aimed to instruct attendees in both the fundamentals of modern machine learning techniques and to demonstrate how these approaches can be applied to solve complex computational problems in chemistry, biology, and materials science. In order to promote the idea of free to code, this project is built to help you understand some basic machine learning models mentioned below.

### Panel-Topics

Fundamental topics to be covered include basic machine learning models such as *kernel methods* and *neural networks optimization schemes*, *parameter learning* and *delta learning paradigms*, *clustering*, and *decision trees*.  Application areas will feature machine learning models for representing and predicting properties of individual molecules and condensed phases, learning algorithms for bypassing explicit quantum chemical and statistical mechanical calculations, and techniques applicable to biomolecular structure prediction, bioinformatics, protein-ligand binding, materials and molecular design and various others.

### Course-Schedule

- **Monday, June 12**

    8:45 - 9:00: Welcome and Introduction

    9:00 - 10:00: _Introduction to Machine Learning_ (presented by [Matthias Rupp](https://www.mrupp.info/))

    10:00 - 10:20: Coffee Break

    10:20 - 11:20: _Kernel-based Regression_ (presented by [Matthias Rupp](https://www.mrupp.info/))

    11:20 - 12:30: _Dimensional Reduction_, _Feature Selection_, and _Clustering_ techniques (presented by [Alex Rodriguez](https://www.sissa.it/sbp/members.php?ID=218))

    12:30 - 14:00: Lunch Break

    14:00 - 15:00: _Introduction to Neural Networks_ (presented by [Mark Tuckerman](https://research.shanghai.nyu.edu/centers-and-institutes/chemistry/people/mark-tuckerman))

    15:00 - 15:30: Coffee Break
    
    15:30 - 17:30: **[Practical Session](#codes)**: _Clustering with Feature Selection and Validation_ (presented by [Alex Rodriguez](https://www.sissa.it/sbp/members.php?ID=218))
    
- **Tuesday, June 13**

    9:00 - 10:00: _Random Forests_(presented by [Yingkai Zhang](https://research.shanghai.nyu.edu/centers-and-institutes/chemistry/people/yingkai-zhang))
    
    10:00 - 10:30: Coffee Break
    
    10:30 - 11:30: _Learning Curves_, _Representations_, and _Training Sets I_ (presented by [Anatole von Lilienfeld](http://www.chemie.unibas.ch/~anatole/))
    
    11:30 - 12:30: _Learning Curves_, _Representations_, and _Training Sets II_ (presented by [Anatole von Lilienfeld](http://www.chemie.unibas.ch/~anatole/))
    
    12:30 - 14:00: Lunch Break
    
    14:00 - 15:00: _Review of Electronic Structure, Atomic, Molecular, and Crystal Representations_ (presented by [Mark Tuckerman](https://research.shanghai.nyu.edu/centers-and-institutes/chemistry/people/mark-tuckerman))
    
    15:00 - 15:30: Coffee Break
    
    15:30 - 17:30: **[Practical Session](#codes)**: _Learning Curves_ (presented by [Anatole von Lilienfeld](http://www.chemie.unibas.ch/~anatole/))

- **Wednesday, June 14**
    
    9:00 - 10:00: _Predictiong Properties of Molecules and Materials_ (presented by [Matthias Rupp](https://www.mrupp.info/))
    
    10:00 - 10:30: Coffee Break
    
    10:30 - 11:30: _Parameter Learning and Delta Learning_ (presented by [Anatole von Lilienfeld](http://www.chemie.unibas.ch/~anatole/))
    
    11:30 - 12:30: _Learning Electronic Densities_ (presented by [Mark Tuckerman](https://research.shanghai.nyu.edu/centers-and-institutes/chemistry/people/mark-tuckerman)),_ML Models of Crystal Properties_ (presented by [Anatole von Lilienfeld](http://www.chemie.unibas.ch/~anatole/))
    
    12:30 - 14:00: Lunch Break
    
    14:00 - 15:30: **[Practical Session](#codes)**: _Machine Learning and Property Prediction I_  (presented by [Matthias Rupp](https://www.mrupp.info/))
    
    15:30 - 16:00: Coffee Break
    
    16:00 - 17:30: **[Practical Session](#codes)**: _Machine Learning and Property Prediction II_ (presented by [Matthias Rupp](https://www.mrupp.info/))

- **Thursday, June 15**

    9:00 - 10:00: _Machine Learning of Potential Enenery Surfaces_ (Ming Chen, California Institute Technology)
    
    10:00 - 10:30: Coffee Break
    
    10:30 - 11:30: _Machine Learning Based Enhanced Sampling_ (Ming Chen)
    
    11:30 - 12:30: _Machine Learning of Free Energy Surfaces_ (presented by [Mark Tuckerman](https://research.shanghai.nyu.edu/centers-and-institutes/chemistry/people/mark-tuckerman))
    
    12:30 - 14:00: Lunch Break
    
    14:00 - 15:00: _Cluster-based Analysis of Molecular Simulations_ (presented by [Alex Rodriguez](https://www.sissa.it/sbp/members.php?ID=218))
    
    15:00 - 15:30: Coffee Break
    
    15:30 - 17:30: **[Practical Session](#codes)**: _Neural Network Learning of Free Energy Surface_ (presented by [Mark Tuckerman](https://research.shanghai.nyu.edu/centers-and-institutes/chemistry/people/mark-tuckerman))


- **Friday, June 16**

    9:00 - 10:00: _Development of Protein-ligand Scoring Functions_ (presented by [Yingkai Zhang](https://research.shanghai.nyu.edu/centers-and-institutes/chemistry/people/yingkai-zhang))
    
    10:00 - 10:30: Coffee Break
    
    10:30 - 11:30: _Machine Learning in Structural Biology I_ (presented by [Yang Zhang](https://medicine.umich.edu/dept/dcmb/yang-zhang-phd))
    
    11:30 - 12:30：_Machine Learning in Structural Biology II_ (presented by [Yang Zhang](https://medicine.umich.edu/dept/dcmb/yang-zhang-phd))
   
    12:30 - 14:00: Lunch Break
    
    14:00 - 15:30: **[Practical Session](#codes)**: _Random Forests and Scoring Functions_ (presented by [Yingkai Zhang](https://research.shanghai.nyu.edu/centers-and-institutes/chemistry/people/yingkai-zhang))
    
    15:30 - 16:00: Coffee Break
    
    16:00 - 17:30: **[Practical Session](#codes)**: _Machine Learning for Structural Bioinformatics_ (presented by [Yang Zhang](https://medicine.umich.edu/dept/dcmb/yang-zhang-phd)) 

### Codes

- **Tuesday-June-13**
   
   For __Practical Session: Learning Curves__, please run these commands on Jupyterlab via [huawei cloud](https://www.huaweicloud.com/product/modelarts.html):
   
   ```python
   !pip install qml
   !git clone https://github.com/qmlcode/tutorial.git
   ls
   cd tutorial
   ls
   %load exercise_2_1.py
   %run exercise_2_1.py
   %load exercise_2_2.py
   %run exercise_2_2.py
   %load exercise_2_3.py
   %run exercise_2_3.py
   %load exercise_2_4.py
   %run exercise_2_4.py
   ```
- **Wednesday-June-14**

   For __Practical Session: Learning Curves__, please run these commands on [Wolfram Cloud](https://www.wolframcloud.com/):
   
   ```mathematica
   
   (*Please adjust the following path to where you unpacked the reference implementation code from the supplementary material.*)
   
   AppendTo[$Path,FileNameJoin[{"Path","to","library"}]]; (* Parent directory containing QMMLPack directory *)
   
   (*Code*)
   (**Auxiliary routines**)
   On[Assert];
   
   Clear[ScatterPlot];
   ScatterPlot[true_,pred_]:= Module[{min,max},
   {min,max}={Min[true,pred],Max[true,pred]};  (* Cover all points *)
   ListPlot[Transpose[{true,pred}],PlotRange->{{min,max},{min,max}},
   Frame->{{True,False},{True,False}},FrameStyle->12,FrameLabel->{{"predicted",None},{"reference",None}},
   Prolog->{Dashed,Black,Line[{{min,min},{max,max}}]}
   ]
  ];
  
  
  (*Plots performance as a function of the two hyperparameters \[Lambda] and \[Sigma] *)
  
  Clear[HyperparameterPlot];
  
  HyperparameterPlot::usage = "HyperparameterPlot[hpgrid,perf,stat] plots stat from performance 
  statistic evaluated at lsgrid x rsgrid.";
  
  (* Uses (1-(1-x)^p)^1/p to increase color range for colors in [0,1]. Felix Faber came up with this function. *)
  
  HyperparameterPlot[rsgrid_,lsgrid_,perf_,stat_String,dots_:{}]:= Module[{hpgrid,data,min,max,scalef,contours,opt,
  colorf,rsticks10,lsticks10,epilog,gopts,legend,p1,p2,slabels={"RootMeanSquareError"->"RMSE","MeanAbsoluteError"->"MAE",
  "CorrelationSquared"->"SuperscriptBox["R", "2"]","OneMinusCorrelationSquared"->"1-SuperscriptBox["R", "2"]"},
  colorbasef=ColorData["TemperatureMap"],colorfexp=3 (* was 2.5 *), precision=10.^-6},
  
  (* Set up data to plot *)
  hpgrid=Outer[List,lsgrid,rsgrid,1]; (* Tuples {\[Sigma],\[Lambda]} arranged as a grid *)
  data=Flatten[MapThread[Append[#1,Round[#2,precision]]&,{Log[2,hpgrid],(stat/.perf)},2],1]; 
  (* List of tuples {{\[Sigma],\[Lambda]},s}, where s is the chosen performance statistic *)
  
  min=Min[data\[LeftDoubleBracket]All,3〛];max=Max[data\[LeftDoubleBracket]All,3〛];
  scalef=((#-min)/(max-min)&); (* Range of performance statistic and function scaling to interval [0,1] *)
  
  contours=Quantile[data\[LeftDoubleBracket]All,3〛,{0.01,0.05,0.1,0.2,0.3,0.4,0.5,0.6}]; 
  (* Quantiles to use for contour lines *)
  
  
  opt=Extract[data,Position[data\[LeftDoubleBracket]All,3〛,Min[data\[LeftDoubleBracket]All,3〛],{1},
  Heads->False]];
  (* Position of optimal hyperparameters *)
  opt=First[Sort[opt,(OrderedQ[{Norm[#1],Norm[#2]}]&)]]; 
  (* If there is an optimal basin, prefer larger values for regularization *)
  
  
  (* Set up graph *)
  colorf=Function[x,colorbasef[Power[1-(1-scalef[x])^colorfexp,1/colorfexp]]];
  (* Color function *)
  
  rsticks10=Log[10,rsgrid]; (* Regularizatin strength axes ticks with base 10 *)
  rsticks10=FindDivisions[{Min[rsticks10],Max[rsticks10]},5];  (* Find "nice" values *)
  rsticks10=Map[{Log[2,Power[10,#]],#}&,rsticks10]; (* Locations with respect to base 2 used by the graph *)
  
  lsticks10=Log[10,lsgrid]; (* Length scale axis ticks with base 10 *)
  lsticks10=FindDivisions[{Min[lsticks10],Max[lsticks10]},5]; (* Find "nice" values *)
  lsticks10=Map[{Log[2,Power[10,#]],#}&,lsticks10];  (* Locations with respect to base 2 used by the graph *)
  
  epilog={Black,PointSize[Large],Point[opt\[LeftDoubleBracket]{1,2}〛],Orange,Point[Log[2,dots]]}; 
  (* Epilog plots points at location of optimal hyperparameters and any passed ones *)
  
  (* Create graph *)
  gopts={
  ColorFunction->colorf,ColorFunctionScaling->False,
  FrameLabel->{{"SubscriptBox["log", "2"](\[Lambda])","SubscriptBox["log", "10"](\[Lambda])"},{"SubscriptBox["log", 
  "2"](\[Sigma])","SubscriptBox["log", "10"](\[Sigma])"}},FrameStyle->12, FrameTicks->{{Automatic,N[rsticks10]},
  {Automatic,lsticks10}},ImageSize->Medium};
  
  legend=BarLegend[{colorf,{min,max}},Round[contours,0.1],LegendLabel->stat/.slabels,LabelStyle->12,LegendMarkerSize->Automatic];
  p1=ListDensityPlot[data,InterpolationOrder->1,gopts,PlotRange->All];
  p2=ListContourPlot[data,ContourShading->None,Contours->contours,
  ContourStyle->Map[Directive[Thick,Darker[colorf[#]]]&,contours],gopts];
  
  Legended[Show[{p1,p2},FilterRules[gopts,Options[Graphics]],Epilog->epilog],Placed[legend,After]]
  ];
  
  
  (*Predicting atomization energies*)
  (**The dataset**)
  (***Obtaining the data***)
  (* Download the dataset, set the corresponding path and filename.*)
  filename=FileNameJoin[{"path","to","dataset","dsgdb7ae2.xyz"}];
  
  (*Load the data.*)
  
  raw=Import[filename,"extXYZ"];
  an="VertexTypes"/.raw; (* Element types as string abbreviations *)
  xyz="VertexCoordinates"/.raw; (* Atom positions in \[Angstrom]ström *)
  ae=("MolecularProperties"/.raw)\[LeftDoubleBracket]2〛; 
  (* Atomization energies in kcal/mol *)\[IndentingNewLine]
  
  (* Counting element types-count number of molecules with given number of non-H atoms *)
  
  (* Bin by number of non-H atoms *)
  table4=Tally[Map[Count[#,Except["H"]]&,an]]
  TableForm[Transpose[Append[table4,{\[CapitalSigma],Total[table4[LeftDoubleBracket]All,2〛]}]]]
  
  
  (* Visualizing molecules-Plot routine expects coordinates in pm, so multiply coordinates by 100. Change inde i to visulasize other molecules. Using the mouse to rotate, hold the shift, key to pan, hold the command key to zoom.*)
  
  i=1046;
  MoleculePlot3D[an\[LeftDoubleBracket]i〛,xyz\[LeftDoubleBracket]i〛*100]
  
  
  (* Creating a training set *)
  
  nmol=Length[an]; (* Number of molecules in dataset *)
  indtrain=Flatten[Position[an,_?(Count[#,Except["H"]]<=4&),{1},Heads->False]]; 
  (* Indices of molecules with 4 or fewer non-H atoms *)
  t=Length[indtrain]; (* Number of such molecules *)
  
  ind=Complement[Range[nmol],indtrain]; (* Indices of remaining molecules *)
  ind=Sort[ind,(OrderedQ[{Length[an\[LeftDoubleBracket]#1〛],Length[an\[LeftDoubleBracket]#2〛]}]&)]; 
  (* Sort remaining molecules by number of atoms *)
  ind=ind\[LeftDoubleBracket]Round[Range[1,nmol-t,(nmol-t)/(1000-t)]]〛; 
  (* Stratified selection of 941 molecules *)
  indtrain=Join[indtrain,ind]; 
  (* Add those to the training set *)
  indpredict=Complement[Range[nmol],indtrain]; 
  (* All other molecules go into the prediction set *)
  Assert[Length[indtrain]\[Equal]1000]
  Assert[Intersection[indtrain,indpredict]==={}]
  
  
  (* Verify stratification graphically *)
  ListPlot[Map[Length,an\[LeftDoubleBracket]indtrain〛]]
  
  
  (* Creating a hold-out set *)
  
  ind=Select[indtrain,(Count[an\[LeftDoubleBracket]#〛,Except["H"]]>4&)]; 
  (* All molecules in training set with 5 or more non-H atoms *)
  ind=Sort[ind,(OrderedQ[{Length[an\[LeftDoubleBracket]#1〛],Length[an\[LeftDoubleBracket]#2〛]}]&)]; 
  (* Sort them by number of atoms *)
  ind=ind\[LeftDoubleBracket]Round[Range[1,Length[ind],Length[ind]/100]]〛; 
  (* Stratified selection of 100 molecules *)
  
  indholdout=ind;
  indproper=Complement[indtrain,indholdout]; 
  (* Remaining molecules constitute training set proper *)
  
  Assert[Length[indholdout]\[Equal]100]
  Assert[Intersection[indproper,indholdout]==={}]
  Assert[Union[indproper,indholdout]\[Equal]Sort[indtrain]]
  
  
  (*Representation*)
  (**Computing Coulomb matrices**)
  
  
  (* In preparation, convert element types from string abbreviations to atomic numbers, and, coordinates from \[Angstrom]ngström to atomic units (Bohr radii). *)
  
  (* Convert element types from strings to atomic numbers *)
  an=Map[ElementData[#,"AtomicNumber"]&,an,{2}]; (* H->1, C->6, N->7, O->8, S->16 *)
 
  (* Convert atom positions to atomic units *)
  ang2bohr=QuantityMagnitude[UnitConvert[Quantity[1,"\[Angstrom]ngström"],Quantity[1,"BohrRadius"]]] 
  (* 100/52.917720859 *);
  xyz=xyz*ang2bohr;
  
  
  (* Coulomb matrices *)
  
  cm=Table[\[IndentingNewLine]If[i\[Equal]j,0.5an\[LeftDoubleBracket]k,i〛^2.4,an\[LeftDoubleBracket]k,i〛
  an\[LeftDoubleBracket]k,j〛/EuclideanDistance[xyz\[LeftDoubleBracket]k,i〛,xyz\[LeftDoubleBracket]k,j〛]]  
  (* Equ. 26 *),
  {k,nmol},{i,Length[an\[LeftDoubleBracket]k〛]},{j,Length[an\[LeftDoubleBracket]k〛]}];
  
  
  (* Sort by row norm *)
  t=Table[Norm[cm\[LeftDoubleBracket]k,i〛],{k,nmol},{i,Length[an\[LeftDoubleBracket]k〛]}]; (* Row norms for each matrix's rows *)
  t=Map[Reverse[Ordering[#]]&,t]; (* Yields index reordering for descending order of row norms *)
  cm=MapThread[#1\[LeftDoubleBracket]#2,#2〛&,{cm,t}]; (* Simultaneously rearrange rows and columsn of each matrix *)
  
  
  (* Pad. *)
  Max[Map[Length,an]] (* Maximum number of atoms in dataset *)
  cm=Map[PadRight[#,{23,23}]&,cm];
  
  
  (* Vectorize *)
  cm=Map[LowerTriangularPart,cm];
  Dimensions[cm]
 
  
  (*Model building*)
  (**Basic model**)
  (***Choose some values for hyperparameters***)
  {\[Lambda],\[Sigma]}={2.^-22.5,2.^11.5} (* e.g., center of logarithmic grid in Equ. 27 *)
  
  
  (* Compute kernel matrix K. *)
  kk=KernelGaussian[cm\[LeftDoubleBracket]indproper〛,{\[Sigma]}];
  
  
  (* Train kernel ridge regression model. *)
  krr=KernelRidgeRegression[kk,ae\[LeftDoubleBracket]indproper〛,RegularizationStrength->\[Lambda]];
  
  
  (* Predict hold-out set. *)
  ll=KernelGaussian[cm\[LeftDoubleBracket]indproper〛,cm\[LeftDoubleBracket]indholdout〛,{\[Sigma]}];
  f=krr[ll];
  
  
  (* Performance statistic *)
  Loss[ae\[LeftDoubleBracket]indholdout〛,f]
  ScatterPlot[ae\[LeftDoubleBracket]indholdout〛,f]
  
  Clear[\[Lambda],\[Sigma]]
  
  (* Grid search *)
 
  (* Set up grid of hyperparameter values.*)
  (* Equ. 27 *)
  rsgrid=Power[2,Range[-40,-5,0.5]];
  lsgrid=Power[2,Range[5,18,0.5]];
  
  
  (* Define a function that returns performance on hold-out set given hyperparameter values.*)
  
  Clear[estperf];
  (* Parameters are regularization strength, length scale, and kernel *)
  estperf[\[Lambda]_,\[Sigma]_,k_]:= Module[{kk,ll,krr,pred,loss}, kk=k[cm\[LeftDoubleBracket]indproper〛,{\[Sigma]}];
  ll=k[cm\[LeftDoubleBracket]indproper〛,cm\[LeftDoubleBracket]indholdout〛,{\[Sigma]}];
  krr=KernelRidgeRegression[kk,ae\[LeftDoubleBracket]indproper〛,RegularizationStrength->\[Lambda]];
  pred=krr[ll,"Predictions"];
  Loss[ae\[LeftDoubleBracket]indholdout〛,pred]
  ];
  
  
  (* Evaluate the functions on the grid: *)
  Dynamic[Log[2,{\[Lambda],\[Sigma]}]]
  perfG=Table[estperf[\[Lambda],\[Sigma],KernelGaussian],{\[Sigma],lsgrid},{\[Lambda],rsgrid}];
  
  (* 
  filename=FileNameJoin[{"path","filename.txt.bz2"}]; 
  Export[filename,ToString[perfG,InputForm],{"BZIP2","String"}];  (* Use this line to store results *)
  perfG=ToExpression[Import[filename,{"BZIP2","String"}]]; (* Use this line to retrieve previously stored results *)
  *)
  
  GraphicsRow[Table[HyperparameterPlot[rsgrid,lsgrid,perfG,stat],{stat,{"RootMeanSquareError","MeanAbsoluteError",
  "OneMinusCorrelationSquared"}}],ImageSize->18.5*72]
  
  
  
  (* Results *)
  
  (* Optimal hyperparameters for each statistic:*)
  
  Table[t=Position[stat/.perfG,Min[stat/.perfG],{2},Heads->False];
  Join[Log[2,{rsgrid\[LeftDoubleBracket]t\[LeftDoubleBracket]1,2〛〛,lsgrid\[LeftDoubleBracket]t\[LeftDoubleBracket]1,1〛〛}],
  Log[10,{rsgrid\[LeftDoubleBracket]t\[LeftDoubleBracket]1,2〛〛,lsgrid\[LeftDoubleBracket]t\[LeftDoubleBracket]1,1〛〛}],
  Extract[stat/.perfG,t]],{stat,{"RootMeanSquareError","MeanAbsoluteError","OneMinusCorrelationSquared"}}]//TraditionalForm
  
  estperf[2.^-22,2.^9.5,KernelGaussian]
  
  
  (* Performance on prediction set *)
  {\[Lambda],\[Sigma]}=Power[2.,{-22,9.5}];
  kk=KernelGaussian[cm\[LeftDoubleBracket]indtrain〛,{\[Sigma]}];
  ll=KernelGaussian[cm\[LeftDoubleBracket]indtrain〛,cm\[LeftDoubleBracket]indpredict〛,{\[Sigma]}];
  krr=KernelRidgeRegression[kk,ae\[LeftDoubleBracket]indtrain〛,RegularizationStrength->\[Lambda]];
  Loss[ae\[LeftDoubleBracket]indpredict〛,krr[ll]]
  
  
  (* Laplacian kernel *)
  Dynamic[Log[2,{\[Lambda],\[Sigma]}]]
  perfL=Table[estperf[\[Lambda],\[Sigma],KernelLaplacian],{\[Sigma],lsgrid},{\[Lambda],rsgrid}];
  
  (* 
  filename=FileNameJoin[{"path","to","file.txt.bz2"}];
  Export[filename,ToString[perfL,InputForm],{"BZIP2","String"}];  (* Use this line to store results *)
  perfL=ToExpression[Import[filename,{"BZIP2","String"}]]; (* Use this line to retrieve previously stored results *)
  *)
  
  GraphicsRow[Table[HyperparameterPlot[rsgrid,lsgrid,perfL,stat],{stat,{"RootMeanSquareError","MeanAbsoluteError",
  "OneMinusCorrelationSquared"}}],ImageSize->18.5*72]
  
  
  (* Optimal hyperparameters for each statistic: *)
  Table[t=Position[stat/.perfL,Min[stat/.perfL],{2},Heads->False];\[IndentingNewLine]Join[Log[2,{rsgrid\[LeftDoubleBracket]t\[LeftDoubleBracket]1,2〛〛,
  lsgrid\[LeftDoubleBracket]t\[LeftDoubleBracket]1,1〛〛}],Log[10,{rsgrid\[LeftDoubleBracket]t\[LeftDoubleBracket]1,2〛〛,lsgrid\[LeftDoubleBracket]t\[LeftDoubleBracket]1,1〛〛}],Extract[stat/.perfL,t]],{stat,{"RootMeanSquareError","MeanAbsoluteError","OneMinusCorrelationSquared"}}]//TraditionalForm
  
  estperf[2.^-40,2.^12,KernelLaplacian]
  
  
  (* Performance on prediction set *)
  {\[Lambda],\[Sigma]}=Power[2.,{-40,12}];
  kk=KernelLaplacian[cm\[LeftDoubleBracket]indtrain〛,{\[Sigma]}];
  ll=KernelLaplacian[cm\[LeftDoubleBracket]indtrain〛,cm\[LeftDoubleBracket]indpredict〛,{\[Sigma]}];
  krr=KernelRidgeRegression[kk,ae\[LeftDoubleBracket]indtrain〛,RegularizationStrength->\[Lambda]];
  Loss[ae\[LeftDoubleBracket]indpredict〛,krr[ll]]
  
  
  (* Scatter plot *)
  kk=KernelLaplacian[cm\[LeftDoubleBracket]indproper〛,{\[Sigma]}];
  ll=KernelLaplacian[cm\[LeftDoubleBracket]indproper〛,cm\[LeftDoubleBracket]indholdout〛,{\[Sigma]}];
  krr=KernelRidgeRegression[kk,ae\[LeftDoubleBracket]indproper〛,RegularizationStrength->\[Lambda]];
  ScatterPlot[ae\[LeftDoubleBracket]indholdout〛,krr[ll]]
  
   ```
### Internal-Links
    
   * Annual Conference on Neural Information Processing Systems ([NIPS](https://nips.cc/))
    
   * International Conference on Machine Learning ([ICML](https://icml.cc/))
    
   * Conference on Learning Theory ([COLT](https://www.learningtheory.org/))
    
### External-Links

One of the exciting aspects of Machine-Learning (ML) techniques is their possible to democratize molecular and materials modelling with 
relatively economical computational calculations and low level entry for common folks. (Pople's Gassian software makes quantum chemistry 
calculations really approachable). 

The success of machine-learning technology relies on three contributing factors: open data, open software and open education. 

#### Open data: 

##### Publicly accessible structure and property databases for molecules and solid materials.

**Computed structures and properties**:

[AFLOWLIB](http://afowlib.org)  (Structure and property repository from high-throughput ab initio calculations of inorganic materials)

[Computational Materials Repository](https://cmr.fysik.dtu.dk) (Infrastructure to enable collection, storage, retrieval and analysis of data from electronic-structure codes) 

[GDB](http://gdb.unibe.ch/downloads) (Databases of hypothetical small organic molecules)

[Harvard Clean Energy Project](https://cepdb.molecularspace.org) (Computed properties of candidate organic solar absorber materials)

[Materials Project](https://materialsproject.org) (Computed properties of known and hypothetical materials carried out using a standard calculation scheme) 

[NOMAD](https://nomad-repository.eu) (Input and output files from calculations using a wide variety of electronicstructure codes) 

[Open Quantum Materials Database](http://oqmd.org) (Computed properties of mostly hypothetical structures carried out using a standard calculation scheme) 

[NREL Materials Database](https://materials.nrel.gov) (Computed properties of materials for renewable-energy applications) 

[TEDesignLab](http://tedesignlab.org) (Experimental and computed properties to aid the design of new thermoelectric materials) 

[ZINC](https://zinc15.docking.org) (Commercially available organic molecules in 2D and 3D formats) 


**Experimental structures and properties**:

[ChEMBL](https://www.ebi.ac.uk/chembl) (Bioactive molecules with drug-like properties)

[ChemSpider](https://chemspider.com) (Royal Society of Chemistry’s structure database, featuring calculated and experimental properties from a range of sources) 

[Citrination](https://citrination.com) (Computed and experimental properties of materials) 

[Crystallography Open Database](http://crystallography.net) (Structures of organic, inorganic, metal–organic compounds and minerals ) 

[CSD](https://www.ccdc.cam.ac.uk) (Repository for small-molecule organic and metal–organic crystal structures)

[ICSD](https://icsd.fz-karlsruhe.de) (Inorganic Crystal Structure Database) 

[MatNavi](http://mits.nims.go.jp) (Multiple databases targeting properties such as superconductivity and thermal conductance) 

[MatWeb](http://matweb.com) (Datasheets for various engineering materials, including thermoplastics, semiconductors and fibres) 

[NIST Chemistry WebBook](https://webbook.nist.gov/chemistry) (High-accuracy gas-phase thermochemistry and spectroscopic data) 

[NIST Materials Data Repository](https://materialsdata.nist.gov) (Repository to upload materials data associated with specifc publications) 

[PubChem]() (Biological activities of small molecules) 



#### Open Software: 

##### Publicly accessible learning resources and tools related to machine learning

**General-purpose machine-learning frameworks**:

[Caret](https://topepo.github.io/caret) (Package for machine learning in R) 

[Deeplearning4j](https://deeplearning4j.org) (Distributed deep learning for Java)

[H2O.ai](https://h2o.ai) (Machine-learning platform written in Java that can be imported as a Python or R library) 

[Keras](https://keras.io) (High-level neural-network API written in Python) 

[Mlpack](https://mlpack.org) (Scalable machine-learning library written in C++) 

[Scikit-learn](http://scikit-learn.org) (Machine-learning and data-mining member of the scikit family of toolboxes built around the SciPy Python library) 

[Weka](https://cs.waikato.ac.nz/ml/weka) (Collection of machine-learning algorithms and tasks written in Java) 


**Machine-learning tools for molecules and materials**:

[Amp](https://bitbucket.org/andrewpeterson/amp) (Package to facilitate machine learning for atomistic calculations) 

[ANI](https://github.com/isayev/ASE_ANI) (Neural-network potentials for organic molecules with Python interface)

[COMBO](https://github.com/tsudalab/combo) (Python library with emphasis on scalability and eficiency)

[DeepChem](https://deepchem.io) (Python library for deep learning of chemical systems) 

[GAP](http://libatoms.org/Home/Software) (Gaussian approximation potentials) 

[MatMiner](https://hackingmaterials.github.io/matminer) (Python library for assisting machine learning in materials science) 

[NOMAD](https://analytics-toolkit.nomad-coe.eu) (Collection of tools to explore correlations in materials datasets) 

[PROPhet](https://github.com/biklooost/PROPhet) (Code to integrate machine-learning techniques with quantum-chemistry approaches) 

[TensorMol](https://github.com/jparkhill/TensorMol) (Neural-network chemistry package) 


#### Open education: 

* [fast.ai](http://www.fast.ai) is a course that is “making neural nets uncool again” by making them accessible to a wider community of researchers. 
One of the advantages of this course is that users start to build working machine-learning models almost immediately. However, it is not for absolute
beginners, requiring a working knowledge of computer programming and high-school-level mathematics.

* [DataCamp](https://www.datacamp.com) ofers an excellent introduction to coding for data-driven science and covers many practical analysis tools 
relevant to chemical datasets. This course features interactive environments for developing and testing code and is suitable for non-coders because it
teaches Python at the same time as machine learning.

* Academic MOOCs are useful courses for those wishing to get more involved with the theory and principles of artifcial intelligence and machine learning,
as well as the practice. The [Stanford MOOC](https://www.coursera.org/learn/machine-learning) is popular, with excellent alternatives available from 
sources such as [edx](https://www.edx.org) (see, for example, ‘Learning from data (introductory machine learning)’) and [udemy](https://www.udemy.com)
(search for ‘Machine learning A–Z’). The underlying mathematics is the topic of a course from Imperial College London [coursera](https://www.coursera.org/specializations/mathematics-machine-learning).

* Many machine-learning professionals run informative blogs and podcasts that deal with specifc aspects of machine-learning practice. These are useful 
resources for general interest as well as for broadening and deepening knowledge. There are too many to provide an exhaustive list here, but we recommend
[machinelearningmastery](https://machinelearningmastery.com) and [lineardigression](http://lineardigressions.com) as a starting point.

[About](https://www.computational-chemistry-workshop.org/homepage-2017) |
[Committee](https://www.computational-chemistry-workshop.org/committee-2017) |
[Speaks](https://www.computational-chemistry-workshop.org/speakers-2017) |
[Schedule](https://www.computational-chemistry-workshop.org/schedule-2017) |
[Location](https://www.computational-chemistry-workshop.org/location-2017) |
[Sponsor](https://www.computational-chemistry-workshop.org/sponsor-2017) |
   
