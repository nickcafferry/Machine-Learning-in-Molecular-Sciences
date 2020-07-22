(* Content-type: application/vnd.wolfram.mathematica *)

(*** Wolfram Notebook File ***)
(* http://www.wolfram.com/nb *)

(* CreatedBy='Mathematica 8.0' *)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       157,          7]
NotebookDataLength[    471693,       8748]
NotebookOptionsPosition[    464186,       8520]
NotebookOutlinePosition[    466040,       8570]
CellTagsIndexPosition[    465997,       8567]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Machine Learning for Quantum Mechanics in a Nutshell", "Title",
 CellChangeTimes->{{3.5269768869725227`*^9, 3.526976889291122*^9}, {
  3.629444302319121*^9, 3.62944431131781*^9}, {3.630844644200268*^9, 
  3.630844656599793*^9}, {3.6308447053023863`*^9, 3.630844719318479*^9}}],

Cell[TextData[{
 "Part of supplementary material for\[LineSeparator]M. Rupp, ",
 StyleBox["Int J Quant Chem",
  FontSlant->"Italic"],
 ", 2015."
}], "Subtitle",
 CellChangeTimes->{{3.6308447350437937`*^9, 3.6308447744042397`*^9}}],

Cell["\<\
Please adjust the following path to where you unpacked the reference \
implementation code from the supplementary material.\
\>", "Text",
 CellChangeTimes->{{3.630844673407405*^9, 3.63084469881439*^9}, {
  3.6315230742345753`*^9, 3.631523076882811*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"AppendTo", "[", 
    RowBox[{"$Path", ",", 
     RowBox[{"FileNameJoin", "[", 
      RowBox[{"{", 
       RowBox[{"\"\<Path\>\"", ",", "\"\<to\>\"", ",", "\"\<library\>\""}], 
       "}"}], "]"}]}], "]"}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Parent", " ", "directory", " ", "containing", " ", "QMMLPack", " ", 
    "directory"}], " ", "*)"}]}]], "Input",
 CellChangeTimes->{{3.630843708875332*^9, 3.6308437159386473`*^9}, {
  3.630843809577257*^9, 3.6308438159358463`*^9}, {3.630843943858157*^9, 
  3.630843970975485*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Needs", "[", "\"\<QMMLPack`\>\"", "]"}]], "Input",
 CellChangeTimes->{{3.629444860560169*^9, 3.629444864924829*^9}}],

Cell[BoxData["\<\"\[Copyright] Matthias Rupp 2006\[LongDash]2015. Please cite\
\\nM. Rupp: Machine Learning for Quantum Mechanics in a Nutshell, \
\\!\\(\\*StyleBox[\\\"Int. J. Quant. \
Chem.\\\",\\nFontSlant->\\\"Italic\\\"]\\), 2015.\"\>"], "Print",
 CellChangeTimes->{3.63152540256355*^9, 3.6315289449924307`*^9}]
}, Open  ]],

Cell["\<\
The following \[OpenCurlyDoubleQuote]Code\[CloseCurlyDoubleQuote] section \
contains auxiliary code and can simply be executed.\
\>", "Text",
 CellChangeTimes->{{3.631523111209729*^9, 3.631523139632956*^9}}],

Cell[CellGroupData[{

Cell["Code", "Section",
 CellChangeTimes->{{3.5269769790029383`*^9, 3.5269769982995653`*^9}, 
   3.526982441933325*^9, {3.526982501312275*^9, 3.526982501422443*^9}, {
   3.629444333293417*^9, 3.629444344367837*^9}, {3.62944446212987*^9, 
   3.629444491321467*^9}, {3.6305891022871323`*^9, 3.630589109926736*^9}, {
   3.630668792073359*^9, 3.630668792537356*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"On", "[", "Assert", "]"}], ";"}]], "Input",
 CellChangeTimes->{{3.6300596111612988`*^9, 3.6300596221530447`*^9}}],

Cell[CellGroupData[{

Cell["Auxiliary routines", "Subsection",
 CellChangeTimes->{{3.630668812063129*^9, 3.6306688220632467`*^9}}],

Cell["Plots  reference labels versus predictions", "Text",
 CellChangeTimes->{{3.6307351020052013`*^9, 3.630735111532037*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"Clear", "[", "ScatterPlot", "]"}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"ScatterPlot", "::", "usage"}], " ", "=", " ", 
    "\"\<ScatterPlot[y,f] plots true values y versus predicted values \
f.\>\""}], ";"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"ScatterPlot", "[", 
    RowBox[{"true_", ",", "pred_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"min", ",", "max"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{"min", ",", "max"}], "}"}], "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Min", "[", 
          RowBox[{"true", ",", "pred"}], "]"}], ",", 
         RowBox[{"Max", "[", 
          RowBox[{"true", ",", "pred"}], "]"}]}], "}"}]}], ";", "  ", 
      RowBox[{"(*", " ", 
       RowBox[{"Cover", " ", "all", " ", "points"}], " ", "*)"}], 
      "\[IndentingNewLine]", 
      RowBox[{"ListPlot", "[", 
       RowBox[{
        RowBox[{"Transpose", "[", 
         RowBox[{"{", 
          RowBox[{"true", ",", "pred"}], "}"}], "]"}], ",", 
        RowBox[{"PlotRange", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"min", ",", "max"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"min", ",", "max"}], "}"}]}], "}"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"Frame", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"True", ",", "False"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"True", ",", "False"}], "}"}]}], "}"}]}], ",", 
        RowBox[{"FrameStyle", "\[Rule]", "12"}], ",", 
        RowBox[{"FrameLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"\"\<predicted\>\"", ",", "None"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"\"\<reference\>\"", ",", "None"}], "}"}]}], "}"}]}], ",",
         "\[IndentingNewLine]", 
        RowBox[{"Prolog", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"Dashed", ",", "Black", ",", 
           RowBox[{"Line", "[", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"min", ",", "min"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"max", ",", "max"}], "}"}]}], "}"}], "]"}]}], 
          "}"}]}]}], "\[IndentingNewLine]", "]"}]}]}], "\[IndentingNewLine]", 
    "]"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.630668497911956*^9, 3.630668612702634*^9}, {
  3.630668643486204*^9, 3.630668726468026*^9}, {3.630668767751055*^9, 
  3.630668769284347*^9}}],

Cell["\<\
Plots performance as a function of the two hyperparameters \[Lambda] and \
\[Sigma]\
\>", "Text",
 CellChangeTimes->{{3.630735077101404*^9, 3.630735098089736*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"Clear", "[", "HyperparameterPlot", "]"}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"HyperparameterPlot", "::", "usage"}], " ", "=", " ", 
    "\"\<HyperparameterPlot[hpgrid,perf,stat] plots stat from performance \
statistic evaluated at lsgrid x rsgrid.\>\""}], ";"}], "\[IndentingNewLine]", 
  "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{"Uses", " ", 
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{"1", "-", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "-", "x"}], ")"}], "^", "p"}]}], ")"}], "^", "1"}], 
     "/", "p"}], " ", "to", " ", "increase", " ", "color", " ", "range", " ", 
    "for", " ", "colors", " ", 
    RowBox[{
     RowBox[{"in", " ", "[", 
      RowBox[{"0", ",", "1"}], "]"}], ".", " ", "Felix"}], " ", "Faber", " ", 
    "came", " ", "up", " ", "with", " ", "this", " ", 
    RowBox[{"function", "."}]}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"HyperparameterPlot", "[", 
    RowBox[{
    "rsgrid_", ",", "lsgrid_", ",", "perf_", ",", "stat_String", ",", 
     RowBox[{"dots_:", 
      RowBox[{"{", "}"}]}]}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
      "hpgrid", ",", "data", ",", "min", ",", "max", ",", "scalef", ",", 
       "contours", ",", "opt", ",", "colorf", ",", "rsticks10", ",", 
       "lsticks10", ",", "epilog", ",", "gopts", ",", "legend", ",", "p1", 
       ",", "p2", ",", "\[IndentingNewLine]", 
       RowBox[{"slabels", "=", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\"\<RootMeanSquareError\>\"", "\[Rule]", "\"\<RMSE\>\""}], 
          ",", 
          RowBox[{"\"\<MeanAbsoluteError\>\"", "\[Rule]", "\"\<MAE\>\""}], 
          ",", 
          RowBox[{
          "\"\<CorrelationSquared\>\"", "\[Rule]", 
           "\"\<\!\(\*SuperscriptBox[\(R\), \(2\)]\)\>\""}], ",", 
          RowBox[{
          "\"\<OneMinusCorrelationSquared\>\"", "\[Rule]", 
           "\"\<1-\!\(\*SuperscriptBox[\(R\), \(2\)]\)\>\""}]}], "}"}]}], ",",
        "\[IndentingNewLine]", 
       RowBox[{"colorbasef", "=", 
        RowBox[{"ColorData", "[", "\"\<TemperatureMap\>\"", "]"}]}], ",", 
       RowBox[{"colorfexp", "=", "3"}], 
       RowBox[{"(*", " ", 
        RowBox[{"was", " ", "2.5"}], " ", "*)"}], ",", 
       RowBox[{"precision", "=", 
        RowBox[{"10.", "^", 
         RowBox[{"-", "6"}]}]}]}], "}"}], ",", "\[IndentingNewLine]", 
     "\[IndentingNewLine]", 
     RowBox[{"(*", " ", 
      RowBox[{"Set", " ", "up", " ", "data", " ", "to", " ", "plot"}], " ", 
      "*)"}], "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"hpgrid", "=", 
       RowBox[{"Outer", "[", 
        RowBox[{"List", ",", "lsgrid", ",", "rsgrid", ",", "1"}], "]"}]}], 
      ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{"Tuples", " ", 
        RowBox[{"{", 
         RowBox[{"\[Sigma]", ",", "\[Lambda]"}], "}"}], " ", "arranged", " ", 
        "as", " ", "a", " ", "grid"}], " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{"data", "=", 
       RowBox[{"Flatten", "[", 
        RowBox[{
         RowBox[{"MapThread", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"Append", "[", 
             RowBox[{"#1", ",", 
              RowBox[{"Round", "[", 
               RowBox[{"#2", ",", "precision"}], "]"}]}], "]"}], "&"}], ",", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Log", "[", 
              RowBox[{"2", ",", "hpgrid"}], "]"}], ",", 
             RowBox[{"(", 
              RowBox[{"stat", "/.", "perf"}], ")"}]}], "}"}], ",", "2"}], 
          "]"}], ",", "1"}], "]"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{
        RowBox[{"List", " ", "of", " ", "tuples", " ", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"\[Sigma]", ",", "\[Lambda]"}], "}"}], ",", "s"}], 
          "}"}]}], ",", " ", 
        RowBox[{
        "where", " ", "s", " ", "is", " ", "the", " ", "chosen", " ", 
         "performance", " ", "statistic"}]}], " ", "*)"}], 
      "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"min", "=", 
       RowBox[{"Min", "[", 
        RowBox[{"data", "\[LeftDoubleBracket]", 
         RowBox[{"All", ",", "3"}], "\[RightDoubleBracket]"}], "]"}]}], ";", 
      RowBox[{"max", "=", 
       RowBox[{"Max", "[", 
        RowBox[{"data", "\[LeftDoubleBracket]", 
         RowBox[{"All", ",", "3"}], "\[RightDoubleBracket]"}], "]"}]}], ";", 
      RowBox[{"scalef", "=", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{"#", "-", "min"}], ")"}], "/", 
          RowBox[{"(", 
           RowBox[{"max", "-", "min"}], ")"}]}], "&"}], ")"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{
       "Range", " ", "of", " ", "performance", " ", "statistic", " ", "and", 
        " ", "function", " ", "scaling", " ", "to", " ", 
        RowBox[{"interval", " ", "[", 
         RowBox[{"0", ",", "1"}], "]"}]}], " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{"contours", "=", 
       RowBox[{"Quantile", "[", 
        RowBox[{
         RowBox[{"data", "\[LeftDoubleBracket]", 
          RowBox[{"All", ",", "3"}], "\[RightDoubleBracket]"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "0.01", ",", "0.05", ",", "0.1", ",", "0.2", ",", "0.3", ",", "0.4",
            ",", "0.5", ",", "0.6"}], "}"}]}], "]"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{
       "Quantiles", " ", "to", " ", "use", " ", "for", " ", "contour", " ", 
        "lines"}], " ", "*)"}], "\[IndentingNewLine]", "\[IndentingNewLine]", 
      
      RowBox[{"opt", "=", 
       RowBox[{"Extract", "[", 
        RowBox[{"data", ",", 
         RowBox[{"Position", "[", 
          RowBox[{
           RowBox[{"data", "\[LeftDoubleBracket]", 
            RowBox[{"All", ",", "3"}], "\[RightDoubleBracket]"}], ",", 
           RowBox[{"Min", "[", 
            RowBox[{"data", "\[LeftDoubleBracket]", 
             RowBox[{"All", ",", "3"}], "\[RightDoubleBracket]"}], "]"}], ",", 
           RowBox[{"{", "1", "}"}], ",", 
           RowBox[{"Heads", "\[Rule]", "False"}]}], "]"}]}], "]"}]}], ";", 
      RowBox[{"(*", " ", 
       RowBox[{
       "Position", " ", "of", " ", "optimal", " ", "hyperparameters"}], " ", 
       "*)"}], "\[IndentingNewLine]", 
      RowBox[{"opt", "=", 
       RowBox[{"First", "[", 
        RowBox[{"Sort", "[", 
         RowBox[{"opt", ",", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"OrderedQ", "[", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"Norm", "[", "#1", "]"}], ",", 
               RowBox[{"Norm", "[", "#2", "]"}]}], "}"}], "]"}], "&"}], 
           ")"}]}], "]"}], "]"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{
        RowBox[{
        "If", " ", "there", " ", "is", " ", "an", " ", "optimal", " ", 
         "basin"}], ",", " ", 
        RowBox[{
        "prefer", " ", "larger", " ", "values", " ", "for", " ", 
         "regularization"}]}], " ", "*)"}], "\[IndentingNewLine]", 
      "\[IndentingNewLine]", 
      RowBox[{"(*", " ", 
       RowBox[{"Set", " ", "up", " ", "graph"}], " ", "*)"}], 
      "\[IndentingNewLine]", 
      RowBox[{"colorf", "=", 
       RowBox[{"Function", "[", 
        RowBox[{"x", ",", 
         RowBox[{"colorbasef", "[", 
          RowBox[{"Power", "[", 
           RowBox[{
            RowBox[{"1", "-", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{"1", "-", 
                RowBox[{"scalef", "[", "x", "]"}]}], ")"}], "^", 
              "colorfexp"}]}], ",", 
            RowBox[{"1", "/", "colorfexp"}]}], "]"}], "]"}]}], "]"}]}], ";", 
      " ", 
      RowBox[{"(*", " ", 
       RowBox[{"Color", " ", "function"}], " ", "*)"}], "\[IndentingNewLine]",
       "\[IndentingNewLine]", 
      RowBox[{"rsticks10", "=", 
       RowBox[{"Log", "[", 
        RowBox[{"10", ",", "rsgrid"}], "]"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{
       "Regularizatin", " ", "strength", " ", "axes", " ", "ticks", " ", 
        "with", " ", "base", " ", "10"}], " ", "*)"}], "\[IndentingNewLine]", 
      
      RowBox[{"rsticks10", "=", 
       RowBox[{"FindDivisions", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Min", "[", "rsticks10", "]"}], ",", 
           RowBox[{"Max", "[", "rsticks10", "]"}]}], "}"}], ",", "5"}], 
        "]"}]}], ";", "  ", 
      RowBox[{"(*", " ", 
       RowBox[{"Find", " ", "\"\<nice\>\"", " ", "values"}], " ", "*)"}], 
      "\[IndentingNewLine]", 
      RowBox[{"rsticks10", "=", 
       RowBox[{"Map", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Log", "[", 
             RowBox[{"2", ",", 
              RowBox[{"Power", "[", 
               RowBox[{"10", ",", "#"}], "]"}]}], "]"}], ",", "#"}], "}"}], 
          "&"}], ",", "rsticks10"}], "]"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{
       "Locations", " ", "with", " ", "respect", " ", "to", " ", "base", " ", 
        "2", " ", "used", " ", "by", " ", "the", " ", "graph"}], " ", "*)"}], 
      "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"lsticks10", "=", 
       RowBox[{"Log", "[", 
        RowBox[{"10", ",", "lsgrid"}], "]"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{
       "Length", " ", "scale", " ", "axis", " ", "ticks", " ", "with", " ", 
        "base", " ", "10"}], " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{"lsticks10", "=", 
       RowBox[{"FindDivisions", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Min", "[", "lsticks10", "]"}], ",", 
           RowBox[{"Max", "[", "lsticks10", "]"}]}], "}"}], ",", "5"}], 
        "]"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{"Find", " ", "\"\<nice\>\"", " ", "values"}], " ", "*)"}], 
      "\[IndentingNewLine]", 
      RowBox[{"lsticks10", "=", 
       RowBox[{"Map", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Log", "[", 
             RowBox[{"2", ",", 
              RowBox[{"Power", "[", 
               RowBox[{"10", ",", "#"}], "]"}]}], "]"}], ",", "#"}], "}"}], 
          "&"}], ",", "lsticks10"}], "]"}]}], ";", "  ", 
      RowBox[{"(*", " ", 
       RowBox[{
       "Locations", " ", "with", " ", "respect", " ", "to", " ", "base", " ", 
        "2", " ", "used", " ", "by", " ", "the", " ", "graph"}], " ", "*)"}], 
      "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"epilog", "=", 
       RowBox[{"{", 
        RowBox[{"Black", ",", 
         RowBox[{"PointSize", "[", "Large", "]"}], ",", 
         RowBox[{"Point", "[", 
          RowBox[{"opt", "\[LeftDoubleBracket]", 
           RowBox[{"{", 
            RowBox[{"1", ",", "2"}], "}"}], "\[RightDoubleBracket]"}], "]"}], 
         ",", "Orange", ",", 
         RowBox[{"Point", "[", 
          RowBox[{"Log", "[", 
           RowBox[{"2", ",", "dots"}], "]"}], "]"}]}], "}"}]}], ";", " ", 
      RowBox[{"(*", " ", 
       RowBox[{
       "Epilog", " ", "plots", " ", "points", " ", "at", " ", "location", " ",
         "of", " ", "optimal", " ", "hyperparameters", " ", "and", " ", "any",
         " ", "passed", " ", "ones"}], " ", "*)"}], "\[IndentingNewLine]", 
      "\[IndentingNewLine]", 
      RowBox[{"(*", " ", 
       RowBox[{"Create", " ", "graph"}], " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{"gopts", "=", 
       RowBox[{"{", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"ColorFunction", "\[Rule]", "colorf"}], ",", 
         RowBox[{"ColorFunctionScaling", "\[Rule]", "False"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"FrameLabel", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{
             "\"\<\!\(\*SubscriptBox[\(log\), \(2\)]\)(\[Lambda])\>\"", ",", 
              "\"\<\!\(\*SubscriptBox[\(log\), \(10\)]\)(\[Lambda])\>\""}], 
             "}"}], ",", 
            RowBox[{"{", 
             RowBox[{
             "\"\<\!\(\*SubscriptBox[\(log\), \(2\)]\)(\[Sigma])\>\"", ",", 
              "\"\<\!\(\*SubscriptBox[\(log\), \(10\)]\)(\[Sigma])\>\""}], 
             "}"}]}], "}"}]}], ",", 
         RowBox[{"FrameStyle", "\[Rule]", "12"}], ",", "\[IndentingNewLine]", 
         
         RowBox[{"FrameTicks", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"Automatic", ",", 
              RowBox[{"N", "[", "rsticks10", "]"}]}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"Automatic", ",", "lsticks10"}], "}"}]}], "}"}]}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"ImageSize", "\[Rule]", "Medium"}]}], "\[IndentingNewLine]", 
        "}"}]}], ";", "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"legend", "=", 
       RowBox[{"BarLegend", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"colorf", ",", 
           RowBox[{"{", 
            RowBox[{"min", ",", "max"}], "}"}]}], "}"}], ",", 
         RowBox[{"Round", "[", 
          RowBox[{"contours", ",", "0.1"}], "]"}], ",", 
         RowBox[{
          RowBox[{"LegendLabel", "\[Rule]", "stat"}], "/.", "slabels"}], ",", 
         
         RowBox[{"LabelStyle", "\[Rule]", "12"}], ",", 
         RowBox[{"LegendMarkerSize", "\[Rule]", "Automatic"}]}], "]"}]}], ";",
       "\[IndentingNewLine]", 
      RowBox[{"p1", "=", 
       RowBox[{"ListDensityPlot", "[", 
        RowBox[{"data", ",", 
         RowBox[{"InterpolationOrder", "\[Rule]", "1"}], ",", "gopts", ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"p2", "=", 
       RowBox[{"ListContourPlot", "[", 
        RowBox[{"data", ",", 
         RowBox[{"ContourShading", "\[Rule]", "None"}], ",", 
         RowBox[{"Contours", "\[Rule]", "contours"}], ",", 
         RowBox[{"ContourStyle", "\[Rule]", 
          RowBox[{"Map", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"Directive", "[", 
              RowBox[{"Thick", ",", 
               RowBox[{"Darker", "[", 
                RowBox[{"colorf", "[", "#", "]"}], "]"}]}], "]"}], "&"}], ",",
             "contours"}], "]"}]}], ",", "gopts"}], "]"}]}], ";", 
      "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"Legended", "[", 
       RowBox[{
        RowBox[{"Show", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"p1", ",", "p2"}], "}"}], ",", 
          RowBox[{"FilterRules", "[", 
           RowBox[{"gopts", ",", 
            RowBox[{"Options", "[", "Graphics", "]"}]}], "]"}], ",", 
          RowBox[{"Epilog", "\[Rule]", "epilog"}]}], "]"}], ",", 
        RowBox[{"Placed", "[", 
         RowBox[{"legend", ",", "After"}], "]"}]}], "]"}]}]}], 
    "\[IndentingNewLine]", "]"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.6248839044626503`*^9, 3.6248839674507723`*^9}, {
   3.624884008498505*^9, 3.624884020627775*^9}, {3.624885950290648*^9, 
   3.6248860818894367`*^9}, {3.624886119910151*^9, 3.624886123694278*^9}, {
   3.624886253033523*^9, 3.624886286187016*^9}, {3.624886421869115*^9, 
   3.6248864507406073`*^9}, {3.624886520483202*^9, 3.62488658899047*^9}, {
   3.624886658008231*^9, 3.624886710007482*^9}, {3.624886746095228*^9, 
   3.624886782948497*^9}, {3.6248869943230467`*^9, 3.624886994606982*^9}, {
   3.6248870453937817`*^9, 3.624887111815338*^9}, {3.6248874453618593`*^9, 
   3.624887465465262*^9}, {3.624887633044438*^9, 3.6248876492260647`*^9}, {
   3.624890319013462*^9, 3.624890394956214*^9}, {3.624890437143532*^9, 
   3.624890720871777*^9}, {3.62489079175627*^9, 3.624890833096835*^9}, {
   3.624890879918632*^9, 3.624890911804785*^9}, {3.624890944105962*^9, 
   3.624891036801921*^9}, {3.624891112004942*^9, 3.624891125782357*^9}, {
   3.6248912640516148`*^9, 3.624891272483831*^9}, {3.624900402096538*^9, 
   3.624900427352038*^9}, {3.6249005742507887`*^9, 3.624900609501268*^9}, {
   3.6249006470579987`*^9, 3.624900695731721*^9}, {3.624900807133737*^9, 
   3.624901048612694*^9}, {3.624901091253953*^9, 3.6249011634425707`*^9}, {
   3.624908408865089*^9, 3.624908478196534*^9}, {3.6249085748189783`*^9, 
   3.624908744645083*^9}, {3.624908775917144*^9, 3.624908777499679*^9}, {
   3.624908808325409*^9, 3.624908812710722*^9}, {3.6249088448373003`*^9, 
   3.624908941215452*^9}, {3.624908989624558*^9, 3.624909106739027*^9}, {
   3.6249091724161263`*^9, 3.624909257594371*^9}, {3.624909297437787*^9, 
   3.62490931570708*^9}, {3.624909352219439*^9, 3.6249093974829283`*^9}, {
   3.624957479225597*^9, 3.624957490328381*^9}, {3.624957736956112*^9, 
   3.624957752215146*^9}, {3.624957882640996*^9, 3.624958028563039*^9}, {
   3.624958101669834*^9, 3.624958191404158*^9}, {3.624958239744609*^9, 
   3.624958364292029*^9}, {3.624958396536425*^9, 3.624958483061942*^9}, {
   3.624958594668571*^9, 3.624958597851981*^9}, {3.624958688826456*^9, 
   3.6249587415388117`*^9}, {3.6249591938667*^9, 3.6249592557210007`*^9}, {
   3.624959334129764*^9, 3.624959485054841*^9}, {3.624959543664628*^9, 
   3.624959601363296*^9}, {3.62496054530091*^9, 3.624960712992028*^9}, {
   3.624960745993844*^9, 3.624960859608953*^9}, {3.6249609044843683`*^9, 
   3.62496090713271*^9}, {3.624960956633667*^9, 3.6249609798217583`*^9}, {
   3.624961014909069*^9, 3.624961038186008*^9}, 3.624961093788844*^9, {
   3.625051282493895*^9, 3.625051285461174*^9}, {3.625051327624415*^9, 
   3.625051337930777*^9}, {3.6250515844167137`*^9, 3.6250516243774014`*^9}, {
   3.625052988742034*^9, 3.625052989339199*^9}, {3.625144432767149*^9, 
   3.625144433645577*^9}, {3.630139835279891*^9, 3.6301398674665813`*^9}, 
   3.630139920494829*^9, {3.63014000051952*^9, 3.6301400865450487`*^9}, {
   3.630140124198317*^9, 3.630140136396509*^9}, {3.6301401693797894`*^9, 
   3.630140171265039*^9}, {3.630141806494741*^9, 3.630141858848168*^9}, {
   3.630141898646037*^9, 3.630141923680524*^9}, {3.630142011436499*^9, 
   3.630142021495254*^9}, {3.6301420540308847`*^9, 3.630142097463599*^9}, {
   3.6301421551450663`*^9, 3.6301421681632013`*^9}, {3.630673289207004*^9, 
   3.6306734342027807`*^9}, {3.6306734860237627`*^9, 3.630674086004013*^9}, {
   3.630674123331318*^9, 3.630674322828561*^9}, {3.630680372804674*^9, 
   3.6306804053234787`*^9}, {3.630735642218444*^9, 3.630735654314199*^9}, {
   3.630735714026569*^9, 3.630735768192052*^9}, {3.630735827651267*^9, 
   3.630735852549911*^9}, {3.630735890440765*^9, 3.630735919099791*^9}, {
   3.630736065374885*^9, 3.630736170149387*^9}, {3.6307363002686234`*^9, 
   3.6307363020664787`*^9}, {3.63073679649739*^9, 3.6307367988795156`*^9}, {
   3.6307385166311207`*^9, 3.63073852090267*^9}, {3.630738551022188*^9, 
   3.630738585000209*^9}, {3.6307386274989853`*^9, 3.630738629676633*^9}, {
   3.630738679325458*^9, 3.6307386911004353`*^9}, {3.630747012549493*^9, 
   3.6307470407180843`*^9}, {3.630747460237833*^9, 3.6307475186641912`*^9}, {
   3.630759081673223*^9, 3.630759087337043*^9}, {3.630759262739781*^9, 
   3.630759277107134*^9}, {3.630759337302278*^9, 3.6307593377343893`*^9}, {
   3.630759404944991*^9, 3.630759405824326*^9}, {3.630759566341836*^9, 
   3.630759687070734*^9}, {3.630760518507*^9, 3.6307605196649513`*^9}, {
   3.630760627880427*^9, 3.6307606674660683`*^9}, {3.6307607080200768`*^9, 
   3.630760727387249*^9}, {3.630760779959588*^9, 3.630760888494952*^9}, {
   3.630761460196374*^9, 3.630761460900792*^9}, {3.63076151688971*^9, 
   3.6307615173611603`*^9}, {3.63076165343079*^9, 3.630761654110034*^9}, {
   3.630763151426339*^9, 3.630763161256249*^9}, {3.630763194792544*^9, 
   3.630763199258658*^9}, {3.6307632332624283`*^9, 3.630763246166417*^9}, {
   3.6307632845788727`*^9, 3.6307632866532393`*^9}, {3.6307633722818336`*^9, 
   3.6307633737544928`*^9}}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Predicting atomization energies", "Section",
 CellChangeTimes->{{3.5269769790029383`*^9, 3.5269769982995653`*^9}, 
   3.526982441933325*^9, {3.526982501312275*^9, 3.526982501422443*^9}, {
   3.629444333293417*^9, 3.629444344367837*^9}, {3.62944446212987*^9, 
   3.629444491321467*^9}, {3.6305891022871323`*^9, 3.630589109926736*^9}}],

Cell[CellGroupData[{

Cell["The dataset", "Subsection",
 CellChangeTimes->{{3.630589121679153*^9, 3.630589123358199*^9}}],

Cell[CellGroupData[{

Cell["Obtaining the data", "Subsubsection",
 CellChangeTimes->{{3.630589137110944*^9, 3.630589139477281*^9}}],

Cell["\<\
Download the dataset, set the corresponding path and filename.\
\>", "Text",
 CellChangeTimes->{{3.630589181980072*^9, 3.630589191458605*^9}, 
   3.630589437805373*^9, {3.630589471538392*^9, 3.630589472650345*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"filename", "=", 
   RowBox[{"FileNameJoin", "[", 
    RowBox[{"{", 
     RowBox[{
     "\"\<path\>\"", ",", "\"\<to\>\"", ",", "\"\<dataset\>\"", ",", 
      "\"\<dsgdb7ae2.xyz\>\""}], "}"}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.631525442994701*^9, 3.631525450706814*^9}}],

Cell["Load the data.", "Text",
 CellChangeTimes->{{3.630589432765571*^9, 3.6305894359094667`*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"raw", "=", 
   RowBox[{"Import", "[", 
    RowBox[{"filename", ",", "\"\<extXYZ\>\""}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"an", "=", 
    RowBox[{"\"\<VertexTypes\>\"", "/.", "raw"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Element", " ", "types", " ", "as", " ", "string", " ", "abbreviations"}], 
   " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"xyz", "=", 
    RowBox[{"\"\<VertexCoordinates\>\"", "/.", "raw"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Atom", " ", "positions", " ", "in", " ", "\[Angstrom]str\[ODoubleDot]m"}],
    " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ae", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"\"\<MolecularProperties\>\"", "/.", "raw"}], ")"}], 
    "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}]}], ";", " ", 
  RowBox[{"(*", " ", 
   RowBox[{"Atomization", " ", "energies", " ", "in", " ", 
    RowBox[{"kcal", "/", "mol"}]}], " ", "*)"}], 
  "\[IndentingNewLine]"}]}], "Input",
 CellChangeTimes->{
  3.6305894945095673`*^9, {3.630589883645196*^9, 3.630589884444666*^9}, 
   3.630590132819829*^9, {3.6305901722534447`*^9, 3.630590226074751*^9}, {
   3.630648678664672*^9, 3.630648707398275*^9}, {3.630649061903398*^9, 
   3.630649076375231*^9}, {3.631533678412137*^9, 3.631533687683386*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Counting element types", "Subsubsection",
 CellChangeTimes->{{3.630590271309857*^9, 3.630590278396435*^9}}],

Cell["Count number of molecules with given number of non-H atoms", "Text",
 CellChangeTimes->{{3.63006716682259*^9, 3.630067176505072*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Bin", " ", "by", " ", "number", " ", "of", " ", "non"}], "-", 
    RowBox[{"H", " ", "atoms"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"table4", "=", 
   RowBox[{"Tally", "[", 
    RowBox[{"Map", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"Count", "[", 
        RowBox[{"#", ",", 
         RowBox[{"Except", "[", "\"\<H\>\"", "]"}]}], "]"}], "&"}], ",", 
      "an"}], "]"}], "]"}]}]}]], "Input",
 CellChangeTimes->{{3.630056870576531*^9, 3.630056874287497*^9}, {
  3.630056919272789*^9, 3.630056923360589*^9}, {3.630057021062199*^9, 
  3.630057040803529*^9}, {3.630590314907385*^9, 3.630590344873754*^9}, {
  3.6305903793596973`*^9, 3.6305903804954453`*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "12"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "43"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "157"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"6", ",", "935"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"7", ",", "5951"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.631530469877578*^9, 3.6315305330198*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"TableForm", "[", 
  RowBox[{"Transpose", "[", 
   RowBox[{"Append", "[", 
    RowBox[{"table4", ",", 
     RowBox[{"{", 
      RowBox[{"\[CapitalSigma]", ",", 
       RowBox[{"Total", "[", 
        RowBox[{"table4", "\[LeftDoubleBracket]", 
         RowBox[{"All", ",", "2"}], "\[RightDoubleBracket]"}], "]"}]}], 
      "}"}]}], "]"}], "]"}], "]"}]], "Input",
 CellChangeTimes->{{3.6301273020207243`*^9, 3.6301273209553947`*^9}, {
  3.6305903840951843`*^9, 3.630590426507132*^9}, {3.631197786285091*^9, 
  3.631197819903944*^9}}],

Cell[BoxData[
 TagBox[GridBox[{
    {"1", "2", "3", "4", "5", "6", "7", "\[CapitalSigma]"},
    {"1", "3", "12", "43", "157", "935", "5951", "7102"}
   },
   GridBoxAlignment->{
    "Columns" -> {{Left}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
     "RowsIndexed" -> {}},
   GridBoxSpacings->{"Columns" -> {
       Offset[0.27999999999999997`], {
        Offset[2.0999999999999996`]}, 
       Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
       Offset[0.2], {
        Offset[0.4]}, 
       Offset[0.2]}, "RowsIndexed" -> {}}],
  Function[BoxForm`e$, 
   TableForm[BoxForm`e$]]]], "Output",
 CellChangeTimes->{3.6315305039273767`*^9, 3.631530569999742*^9}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Visualizing molecules", "Subsubsection",
 CellChangeTimes->{{3.6305904422448387`*^9, 3.630590449955201*^9}}],

Cell[TextData[{
 "Plot routine expects coordinates in pm, so multiply coordinates by 100.\n\
Change index ",
 Cell[BoxData[
  FormBox["i", TraditionalForm]]],
 " to visualize other molecules. Use the mouse to rotate, \nhold the shift \
key to pan, hold the command key to zoom."
}], "Text",
 CellChangeTimes->{{3.630590493204638*^9, 3.630590513267543*^9}, {
  3.630590562225768*^9, 3.630590639494822*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"i", "=", "1046"}], ";", 
  RowBox[{"MoleculePlot3D", "[", 
   RowBox[{
    RowBox[{"an", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
    RowBox[{
     RowBox[{"xyz", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], 
     "*", "100"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.630589954321231*^9, 3.630589996842136*^9}, {
  3.630590472990511*^9, 3.630590484585227*^9}, {3.630590521432144*^9, 
  3.630590542198689*^9}, {3.631530603408684*^9, 3.631530707576376*^9}, {
  3.631530840662243*^9, 3.631530841235197*^9}}],

Cell[BoxData[
 GraphicsBox[
  TagBox[RasterBox[CompressedData["
1:eJzsvWVYXMnW/v288uH9+j/PsXGLuyc4BHd3CRDc3R2CJLjFEzwCJIQYEHd3
d3d3gWS/964FOx2SmcnMmZnmhLqvmr52d+/udNHz63utqlW1f3APtvD6v//n
f/4n/P/DjYVbtEZYmFus5f+LOxNjIzzd/x8cNP1f//M/WvhPPBa4uLi4uLi4
uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4
uLi4uLi4frtm1tZWLlmyaNWqhra2JWvW1Le2yvsTcXFxfapSpk4tnjt37qJF
C5YvX7p27YrNm9t27Vq/b9/mQ4e2Hjmy7ehR3K7fu1feH5OLi+tnFZeenlNa
WlpRMb++fuHKlU3r1q3etm3dnj2gePuxY7tPn9539uyB8+cPXryI271nz247
dkzeH5mLi6u7ErOysoqLyZHrmpsRUa/csmXt7t2bDh7cfvz4ntOnD1y4cOjy
5aNXrx6/fp3akStX9p8/v+XwYXl/di4urk7FpqWl5eXlzZgxvbq6srFx8erV
yzZsaNm+HaE1IupdJ0/uO3fu0KVLR69dO3Hz5qnbt0/fuYOGA9w9fPnyjuPH
5d0DLi4uITwhAaacWVhYNGfO7AULapqaGlpbl2/a1LZz58YDB8ApwmnE1XDk
EzdunLp168zdu2fv3Tt3/z4ajvEIntp58qS8+8HF1avlHxERlZyclJ2dU1JS
Mm/enIULa5cta2hrW7F585pdu7YcOoQcGaievHkTjUAGwucfPLjw8CEaDsD1
yVu34M48febikpfcfX2DoqKiU1KSc3KmlpaWzp+PZFlief3evXvPnDl/796t
V6/utLfffPnyytOnlx4/vvr06bXnzy8/eYJjwhmAI9hGQr12zx5594mLq9fJ
btIkj4AAsAxfJpZL5s+HL9eA5dZWsLz54MGT16/fe/nyhSCgPe7ouNfR8aCj
4+mbN8/fvHn0+vW1Z8+AM1kzLPvIlSu7Tp2Sd7e4uHqdHN3dwXJgZGRkUhJY
RoxdPHfu7Lq6qqVLF69evWLTJgTYl+7fb+86/60gtL99+4YdUAPOcGpYs8jy
7dvHrl3bf+7chv375dkrLq5eJksHB7A82c/PLzycxr6yi4sLZ8+eWVNT0di4
cOXK5g0bNh04cPLGjcdv3tBLRJbZraT2N29uPX8OlhFjI2UGywiztx45Ipce
cXH1Tlk7OoJlNx8fn5CQ0Li4+ClTphQU5M+cWV5ZOW/x4lo2v9y6Y8fe06ev
Pn788OnTJy9eIMAW4+32TqMG1K/evr33/DlM+fTt2ydu3Dh69SpY3nH8+Mot
W+TbOy6u3iMrR0d7V1cXT0/PwMCg6Ghxfjk3d1p5ecm8ebMQZrMabFjz2t27
d588efTixePXrp24fv3M7du3nzxp73JqZNDXX7w4c+eOCPK1a4cuX9537tz2
Y8daduyQb++4uHqJDM3MLO3t7VxcnCZPdvfzo2mp5OzsrOLiglmzpldVida8
bFl9S0vzxo1tO3duOXx429Gju06ePHjhwplbt+6/fPlSEF4LAg4QYJ+8efPI
1asAGaa858wZnNnKWebi+ksEls3t7KydnMiavYODwxBmZ2Sk5+V1WnNtbUVD
Q93y5Q2trXDn1du2waA3Hjiw+9Sp41ev3nv2DCB3sLGvS48eIU0+ePHi/nPn
APKOEyc2HTzYsn07fg3k3Usurs9f+qamptbWlg4ONs7O4giYv39g18xUVlER
suayysrZCxYg0l6wYkVjWxtwXrV1K3DecezY8StXHj57RuPYz9+8ufb0KdLk
vWfPAnOALC6h2rcP+fL8+np595KL6/OXrrGxsaWlua2tlYMDIu1JXl4+ISGw
5rj0dGTNOaWlhbNnI9Keu2hR1dKlwLmhrW0Zc+eN+/cfuXz58YsX9D5P2ttv
PH9++NKlnSdOILTefOjQhn37WnfuxMmcZS6uv0Ba+voGZmYmVlbA2drR0cHN
DdYcEBERmZSUmJmZkZ8/raysaM6c6dXVEs71ra3L1q9H8LzrxIkrjx49f/v2
ZUfH/Rcvzt+9C0feAor371+3dy+S6xWbNyMyR5Qu715ycX3+0tDRgTUbmpsD
Zws7O0TaLl5eXkFBwdHR0SkpSdnZUwoKcsvLi+fOBc5zFi6sXLIEufPi1aub
1q9fs2vXnlOnzt2+ff3x45PXrh26cAFmvXbPHtgxjBsgL127tq65uXjePHn3
kovr85fKxImwZr0unC3t7e1dXV19fHxDQ0NjY2NSU5E4TyksnFZeDncur6pC
7lzR0FCzbNmiVaua1q1r2bZt2+HDuxFXsw1GgDAS5OWbNiG0blyzBiY+b/Fi
vFbeveTi+vylqKamrq2tZWAAnBFsm1pbWzs5Obq7u/v5+YWFhcbFxaSliTgX
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
5s1TN24cv379F8Cna2bFpqXBl/NmzECMPb++Hvly84YNmw8ePHv79rOOjg5B
eCUIz968AdQvBaFdEN4IwnOg/ezZxUePwDKiboTf+N2Alcv7++TqvaIsWLJm
acpJKtSUrNnOzs7R0dHFxcXNzc3Dw4Oqr2VxhjsDVbA8e/ZsmCzo2759+86d
O+HO8FZiGSDTABdABvvwdDg7wIcdw5SRX69gAq2rmPCD0NLS0sqEX4Y1TL/a
qbdv33a8efO6o+Nle/vzV6+evnz5+MWLh8+e3X/69O6TJ7cfP+4E//597+Dg
oOjomNRUMV8uLy9FJLBoUW1zM/JlJNoX799vf/MG5L5l/HbI/hOC8OjVq3cs
37yJXwak6n/eN8XF9cuiOhCyZinSlp1opqzZwsLCxsZGirQ/ijOsGZAi4QW5
zc3NcFiAvHfvXoCJlBms0PplGp2m4WiYMh5E7I1XIQhH/Ax7RHKNmLy0tBRu
ThWhiNIRbyPqrq2tXbhw4fOXL1++ft3e0fEG0DKsfmuT5BkQEIAflKSkFCTt
paXFCOnr6qqWLq1vaVmza9fB8+dvPn4ML0Z72NHx5PXrjredrxYfEYQrT56I
w1+3bx+/cePQ5cvIx+XyJXJxQTSiRdZMkTZwlrVmyprNzMykSFtKnLvhDIel
QWnktoirgTCsGUTDc8vKysApDXbBjmk2mbbrhMKYaGaZdvKMZIpiAvV4CV6I
l8P3Ye77Tp48cPr04bNnj50/f+LSpdNXrpy9du3CjRuXbt26eufO9Xv3bj14
cPfRo/tPnjx69uzJixfPX79+2dHR/vbtG2avss3N19cP/3RCQmJWViZtYlZd
TWG2lDJfvHv34r17Z+/cufzw4YMXLwjm12/e3H7x4uLDhwAZpnz02jVk6LtO
nmzZvl3O3yhXbxXVgcCaZXGWXUMBa6YlUYi0rayspMRZFmdauQycgSQ8NzMz
c8aMGbBRKsyGq8JqMzIyyI6lmhBQHBQUhBf6MwUwBXYpiCmYKYRJAh+8IDNt
3bmzbedOuOea3bvX7t69bs+edXv3rt+3DwAiPN566ND2I0d2HTu258SJ/adP
Hzp79sj588cvXjx5+fKZq1fPXb9+8ebNy7dvi1uMBgWF4LcCwQG7+B1dYYcq
sZdv3Ih33nr48I7jx/eeOXPs6tVL9+8/fvXqNfJlQbj57NnZu3ePs6IRZN/7
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
g0YGTURT1C1BLQ07E92mXcKDeBbnAKBP/1QULUBqWlrq2trw04m6umBQS18f
DaGyjqGhjpGRLpqxMcBEIqwP6mXAN2TgG8mAL10Ir/PiWYQzc2dYNlJyhOIh
MTGIt5FcJ2Vng2jQmlNSMq2sTBokxwEYzyouRn6NNPwv+Ka4uH5VH1qz5M6y
y6kodZUlmjyaom4JauJamleSbiE8hXP+8M/fefFKNTXgqaKhAUK7gU/sA3xt
gG9oKHt9edkryIuXqWXXwkO6jXgbaXVoXByIBqpIopNzclKnTQO5NDAOwNFS
cnLA+x/eIy6u3ydQCYcFax/NnakwTIq3ZTNohNw0nSTNItEUEnGt977wCJ7F
yfLu7rtLUUvuDJxh63SlWmTcZNDufn4g2j8iIjgmJjw+HlBHp6SII+EZGeIs
GG7T06OSk+XdGy6uTsFkQSJYQxhsY2Pj5OQkmzhLQ2HdVlRJBk0zRzRN3A1q
aWqYjvE4TpN3dzvVDWfaJljP2BgBOf4KyKltXVwc3d2RQU/280MS7RsaCpsO
io6WZrtwGxIbi6fk3RUuLlGgEgzif2SEwTQ/Q9eH8vHxkSJt2aowCWdpNxKJ
aJoC/rDqA8IxHgTy8u7ue5JYVkJkPnEiAnIE4TTvDJwt7O1Fg540yWny5Ene
3vBoz4AA2YktHCMUl3cnuLg6BQbJlM3MzOiSym5ubrRQIiAgICgo6KNFnh/i
TDUe5NFUzUUC2riLB3GCvPv6Eb3DmV1EHsk1sml9U1NjS0szuDPDGQbt4Obm
5OEBj3ajyWs/P1cfHzwo74/PxdUpkAjWEAPDlNksq3jRRro2Om22GRwcHBYW
FhMTQ9NGH3Vnirel8i2pcIvQxi0ewQny7uvPShoEU2aDZhLOojtbW1vY2eHv
YsOIlqaqYdby/tRcXO8JrCGH1dfXJ1N2dnZ2d3entU60v0doaGhERERycnJB
QcGHwbasQctWZ0mVmbjtyRTLSjJoKdim3BkGbcqmqhFyA2o4NY7l/WG5uN4T
QEMOq6OjY2xsTKbs6upKpkzRNUw5PDw8NjY2KysrLy+PtvqRlmBIS55liZYK
L+kYT8m7l79NFGwrI7tnBg2idY2M9NlUNZq8Px0X18eFHJZM2dzcnC6jLGvK
AJl2s4cpFxYW5uTk4ACPII/29PT8kOhutZfy7hwXV28RAmDJlK2trekaynRZ
CjLlkJAQ2vAnOzs7Nzc3PT0dWTOe8vb2dnNzg4nTdBVBLVVd4ljePePi6l1S
VlbW1NQ0MDAgU3ZxcYEp07ZdsqackpKCTBk4JyYmgm6YMoJwnAz8DQ0N5d0J
Lq7ergkTJqirq+vq6pqYmMiasjQPJZkyQutp06bBlKOiovz9/cmU7e3t8Qsg
705wcXG9M2ULCwsy5cmTJ8uaclhYGEw5NTU1Pz8/KysrISEBgJMpI60G/p+y
OIKLi+tPlawpU8UmrPZDU46Pj5/KlJaWBq5hyl5eXrBvsG/GR3S5uHqApGUU
MGWpYhOmTJtnSqYMhGmnekCNx318fHAawLeystLW1pZ3J7i4ers+XEbRrWKT
LvSGoBppMpLllJQU3EXsLZkyXijvTnBx9Xb93DKKbqYcFRWVnp6em5s7ZcqU
uLg4MC5ryvLuBBcX168vo6CKzcTERICcnZ2dnJyMxBmmjGwapoyXIMWWdye4
uHq7fnkZhWTK0dHRGRkZCLCpYpNM2d3d3dHREVYu705wcXH90jIKWVNOSkrK
y8vLysrCAdAmUwb1SK6NjY3l3Qkurt6uX1hG0W1tI3JkKg6RKjaBPM63sLCQ
dye4uLg+aRkFrW2k4hCkzNIyChcXF5gyInN5d4KLq7fro8soZNc2UnEIsuPM
zEwqDkHWLFVsclPm4uoh+pRlFDDllJQUKg5JSEjAg3wZBRdXj9LPLaP4cG0j
QuucnJzU1FSq2OTLKLi4epQ+fRkFFYfEx8fzZRRcXD1Nn76MIpuJKjb5Mgou
rp6mT19GQcUhiLT5Mgourp6mT1lGAVNOSEhAmoxkWarY5MsouLh6jn7TMoqp
U6dKxSGSKfOKTS6unqBPX0YBkDMzM2UrNvkyCi6uHqLftIwCATYVh/BlFFxc
PU0/t4yimynDi6dNmzZlyhSq2OTLKLi4epR+eRmFZMq0jCI7Ozs1NRVZM19G
wcXV0/TLyyhkLxFF81AJCQm08TVfRsHF1XP0icsoyJSzsrJSUlJkKza5KXNx
9RB94jIKMuX09PT4+Hi+jIKLq6fpE5dR0NpGKg6hik2+jIKLq0fpV5dRSGsb
qTgkLi6OL6Pg4upp+sRlFLS2Eb5MFZt8GQUXV0/Tzy2j+HBtIxWHINLmyyi4
uHqaPrqM4udMecqUKVLFJl9GwcXVc/SJyyjIlKk4hC+j4OLqgfrVZRSyGw5k
ZGTIVmzyZRRcXD1En7iMIioqCjky7RzCl1FwcfVAfeIyCtpwgCo2+TIKLq6e
pk9cRgEjTk9Pp4pNvoyCi6sH6heWUXxoylSxScsoqGKTL6Pg4uoJ+oVlFHSJ
KGArmTIVh/BlFFxcPVCfuIwiMTExOzs7LS0tLi6OL6Pg4upp+sRlFDExMRkZ
GVQcwpdRcHH1QH3iMgogTMUhsbGxfBkFF1dP0ycuowC/U5gQZvNlFFxcPVC/
uoxC2nAgKyuLKjb5Mgourp4gOCkYhKW6u7uDx09ZRkGmTMUhfBkFV09T89DB
bcOHbhk5fNfoEbtHj9gzeuTe0SPl/aH+LME94bmUCFMdl1T+QZNNP7eMAqYc
GRkJU87MzJSt2OTLKLjkq5qB/ZcNHbRm+NDto0bsHzPy6NjRp8ePOT9h7CWF
cVcVxl9XHH9NcTwOcPf4uNHy/rB/gIyNjYEbFX50M1xACsMFp1FRUSA0humj
yyji4uIAcnp6umzFJl9GwSUvVQ3s3zh4YMuwITBi+C9RfHHCOPB7W2nCPWWF
RyqKj1UUn4pNCQcPlBXuKE24rDBO3h/898vMzAx2LFvBBUjhtmTEoBgII3gG
qvHx8eA0sUvdllHAjhFgw5r5Mgou+aqsbx/Y8dIhgxBRbx05fN+YkcfGjT47
fuwVhXE3FTspfqaq9FJN+bWacoe6yhvWOtjd56pK95UVgLy8O/HbpK+vjzRW
1pFlQSY7JpBBMeBNSkoCqmA2NTU1pUtk3DghKysrLS2NKjb5MgoueWlGvz7V
cOQhg1q7HPnY2E6QbylNAKdPVBRfqCq1qymD37fqKoKGqmx7y6AG0fBoeXfl
UwWQEfpaWFjQ6mPZHa2lbQRkQZYoBrDpMsJdmDIep+IQvoyCS44q7ftTxYB+
iwcPXDl08IYRw3aNHnF47KhTLLS+oTgejvyYgQz/7aR4Ipqa2DTVWVOju8D8
lZoyom55d+jXpaura2RkhOja2tqaBrtkLzNBpgwqu4FMFGcwTZER7qYxIQ7n
yyi45KXCPj/N7t8X0XXT+9H1uQljryqIOfJDZTG0fs0cmYEsQ7EWmoZ4S3cn
qr3VUIVBg338FMi7Zz8rLS0tAwMDMmXg1m19BJlyREQETBlsIkGG28qCDHgz
mbK6hGM8iGdxGl9GwSUX5fz4Q1m/PvMG9Fs4aMCKoYPXjxi2Y9SIg2NGnRw3
5gIb77oLU2Y5cgcC6fco1vhI68K5vQe7s7q6uo6OjqGhYbdMWRq7BsuSKQPk
D+2YKM6WUTecYeV8GQXXX6mU77/L6/Pj9H59Kgf2bxg8cPWwIZtGDtvNAuzT
48dcUhh3E5kyomuwqT3xrZ62oK8jGOgKONDVFLQndjadrgPt93BGsH1Xqcfh
rKKioqmpqaen99EAWxr1ginHxMTAjpEFA1LQmsMkyy/uTp06VfZx2mwTOCMg
h6HzZRRcf40iv/l6yg/fF/T5cUa/vtVs+Lp1+JDNI4fvGT3yiDgPNfaywrjb
MGUN1df6Om9NDAUbS8HWSrAwFXBspC8Y6opcowFwXS1BR7MbzgjIEZkjSpd3
R99pwoQJampqCLBlWUYk3C1ZDg0NhSnDkUFlbm5uaWlpeXl5WVlZYWEh7ua9
LzwiEU3uTLkzfgfwayDvHnP1CsV9903mj98jWZ7Zv29tV7K8pYvlM+PHXlGc
cFdN+YWO5hsbK8HDTQj0E8KCBT9vwdVZsLMWrMxFuq0tRLrNjESoCWdKnxGK
40eARdrHekwxiaKiIgJsiWX4JpLlD1mmqyQDScA7b968+vr6hoaGxYsXV1VV
zZo1a/r06UB75syZOAbgRUVFBQUFhLMUbEuRNmJ1eXea6zNX6NdfJX73bZbI
8o+z+vetGzSgG8vw5StKCg8mqrebGgluLkJEqJCWLExJExJihSB/EW1Pd8HH
Q0Qbt/Y2grnJeziL1qzawaz5muJ4JOAHWNs3Rqz/xD+xe/TIXaNH7Bw1Aun5
9lHDt40cvnXkcEQFCPI3jhi2YcQwZO7rRgxdO3zoH9Xl8ePHKykp/SrLQUFB
CLCBIQwXIDc1Na1fv37Dhg1tbW1LlixZsGBBRUVFbW3tIiYc4JySkpL8/HzC
WbJmBOdkzXjPP6oLXFzd5Pnlv8O+6WS5QIZlirFBGcuXGcua6h2wXR9PITlB
yJ8mFOSKRIeHCCGBQmiQEB8tZKSKdPv7CI52Is4Itt+xrPZWXeUFm3G+JdNu
Kr5rN8Q2ntp1mXZNpl1lxaJoYV0K/RmF/IyCmRBgKysrE8s0IfUhy8iXiWVg
CJYrKytbW1t37dq1e/fuLVu2rFy5EjgvXboUB0AbgK9btw6WPWfOHOCMeJus
mQbBEGZT1owPLO8vnOuzld9XX4R/83XCd99O6WK5duAA5MstbOwLdnlo7KiT
48dcUppwT1O93dL8ra+XkJIogoyWniJER4jxdlK8MC1bBLwoX0hNErwmC5Zm
gqGeLMtImV+qKcOan1JTkW1iFeiTn2mPP9ZiZRTzWxTNBJbhy8iXNTU1JZZp
7Esax/bx8UGMjcA4MTERbNbV1W3evPnIkSPHjh3buXMnWfPq1avx4IEDBw4e
PAjMgTPCb+TUFGnLpsxgGf4eGRkp7y+c67NVwFdfhn/zVfx336T/8H1+nx9n
9hMnlxuHDFo9bMgGNie1f8yo4+PGnFccfwtBsqFeh5O9CC8QRkOADZsO8BVi
IoW8HKG8RMibKpo1rBm5s7F+F8vvSkdeq6t0b2rUlKX26hMa+Er4DySxPHHi
RJqTksaxwbJs0RcsnrbQnD17NlwYtCLMXrVqFUCGCzc3N2/duvXo0aOnTp06
fPjwpk2bcM7cuXMpzO7GMt4HPyP4fZD3d871Gcr13//y/+rL0G++iv32m7Qf
vsv9SZyTqhrYv37wwBVDB68bPnQbK+AUU+YJY68oK9yHNZsYvrG3fevqLExy
EhzsBAdbwcVRhDc+RpiaJYbZsZHiXTvrzpS5a1qKfPmtlflbS7M31CxMO5u5
SWczM+5spkadDf8cNWODzmakjzaVqdvckGy1Bkm2FguiMsuxY8ciX1ZUVFRV
VSWWDQwMTE1NaUmFk5MTrWGklBkBOS2UAJ6In+HOCxcurK6uRmo8f/58pMkt
LS2w6ePHj+/du3ft2rX19fU4DT6Oj0cfQJZlBAaI8+X9tXN9hnL/4l+IsUO+
/irq26+Tv/8256cfyvr2mT+g36LBA2md8mYWZh8cM+oErFlh/HUVpUfaE58a
G7wwM34N0Iz0xTkpK3MBZu3nLUSFiwYNmwbpiLH1tEVfFktKVN9oqLarqzxX
VRJHv9GQX6Mh0UYLRgsQG1weDaaPFuAnvg8afhbQ8OZoCO9Zq2Oq7VINUzVT
FVNllyq6NL9LYHDMmDFgWUFBgVJmbW1tqvuytLS0tbWVUmapXATWDAbBIwgt
KysrLy8vLi4uLCzEAd4NOC9fvhwUI9hesWIFPs+sWbPwLM0v0w9Iamqq5Mt4
N3l/7VyfocCy75dfBH39JaXMWT9+X9z3pzls+GsJC7PXjxi2fVSnNZ8aP/ai
wvgbyor31JQfTVR7pqn+SlP9jZbGWxCNiBo2Ddwiw8RbNxfxEX0dcYqZTUi9
FWNpMVkWSgqF0qJ3DXepFRd0NmTcaIV5nY0SczQk42h5aFN3M+1i2sm0o0vb
mbZ1aSvTli5tZgLL48aNk02Z9fT0jI2NZVNmCrNpz5+goCDaJAQ8UqEXeT0i
gZKSEkTU+GFpbGwE0TBl0I18OTc3l6JrAhm2npSUhHyZWMavhLy/ea7PTYix
vb/8AikzrBlhdjorF0HKTGH28qGD14jWLG4hcmDMqGPjxInmSyLOCndUFB+o
KD5B6opEWF/nLch1nyS6aly0OLLtNVmsJDHUfQvSNcTZqHY15ReqSo9UFMXZ
KzSc4O0hNqTbsFqyXfiv6MXMl0WPZmYtejczcdHQQ8Q3jwhdxoRcFfisYFq5
ciVy2NVMCHpbmdra2tasWbOWifJcmlEaPXp0tzBbV1eXUmYKsx0dHRFmkzVL
u9bTUilauQyHBddwagTScGcEAAi8kSkjiUYMAO+Gg1PRF4GMk5Hg44UI18Ey
3lPe3zzX56ZJ//6X5xf/RpgNa4785uuU77+bxsLseQP6LRgkjmaTNW9jE82H
xoqR9lkR53HX2F4ED1SVnmmotetpv0HWDCSRMk/LFse+gB5sGomtlkY7G/IC
yE9UFO8rKzzX1WJN+7me9ot3Teel/rv2Sl/3lUFney02vdeGYmvvbPrd1jJ0
K4eWaixJlFlPmzYtlwmUjRo1SrLmbmE2La9AmE3WLG0NRIXZtPMPeETIDZMF
pPinp0+fDl+mySn8kgDqmTNnIrmmqSgJZJyPV+HlyJdh9/L+5rk+Nzn/65+T
v/g3rJlGwOK/+5aqv2b177Rmypo3sgHtvWyumXC+SDgrKz5SVwWMHY52opmm
JInR8tQsZM1vPdzemhm3a018xdLkJ2zLEeB/RZwjniA2JbFdE5uC2JQVrr9r
iojkb6i8azdVlMSmKrZbqkrRXeo23yQ7URX3vuJlNHLkSLAsWXO3Sk7JmpE1
u7m5SZF2tz2C8E+AU/ykIDuGHSMAQDCPaB/RArLyoqIisEyhNYGM8/GB8Vq8
CX4f5P3Nc31ucvjXP12ZNfuwrDn626/ZaHbnailkzY1DBq0c1hlp7xw1Yt8Y
4DxaBucJd8CptmY7YmxEywiwkermZArRkW8nu3YYG7zUVH+qqvyIOTJABv4n
x49BO/WxdvojbeyZj7WgX1PwLwosI8wma1ZQUFBRUZFGsyVrRtZMA9pSpE04
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
k5PT5MmTyZqjoqKQHSNTXrBgwdq1a2tra0tLSyVrjo2NlXcXubh6kT5q0ES0
BDWsGZmyrq6umZmZnZ3dpEmTvLy8AgIC6DoXgBeOTNvyz549Oz8/n6w5OTmZ
XyGOi+uvl6xHS1DjLm5h0MiXJ06caGhoaGVl5ejoCGv29fUNDg6OjIxMSUkp
KCioqalZs2bNwoULy8rKcnJyyJrj4+Pl3S0uLi5RoBtcw6BhzSoqKjo6Oqam
pra2trBmT09PWHNYWFhMTAxd2GLJkiVInOfOnStdMw6Y8+uqc3H1BFH4TdY8
YcIEDQ0NAwMDS0tLWLO7u7uPjw9Zc1JSEkLrysrK1tbWxYsXl5eX07VceekI
F1fPEVnz0KFDx4wZo6ysrK2tbWJiYmNj4+LiAmv29/eni73ChWk//FWrVlVU
VBQVFZE1p6amRkREyLsTXFxcndaM9HnEiBHjx49XV1fX19e3sLBwcHBwc3OD
NQcFBYHWxMREKh0Byw0NDVTVyUtHuLh6lIBz//79hwwZMnr0aCUlJS0tLWNj
Y1izs7Ozh4eHn58frDk6OjojI6OkpGThwoUtLS1VVVXFxcU0PwVrjoqKkncn
uLi4Ooe4Bw4cOHz48HHjxqmpqcGazc3Nu5WOxMfHw4vnzJmzfPlyquqUSke4
NXNx9RBJ1jxq1ChFRcWfKx1JS0uDHdfV1bW1tdXU1MhWdSKnlncnuLi43lnz
sGHDYM2qqqp6enpUOgJr9vLyImuOjY3NycmZNWtWExMOpNKRpKQkf39/efeD
i4tLoEqSwYMHw5oVFBRgzVQ6QtZMpSOw5pSUlMLCQiodgUHLVnXGxcXJuxNc
XFyiupWO6OrqSqUjVNVJpSOAF8lyY2Njc3Mz0ueCggKan0pOTg4NDZV3J7i4
uLqXjlBV54elI2AW/FZVVbW0tFBVp1Q6wqs6ubh6iLqVjujo6JiYmMCapdIR
smaQW15eXl9fv2LFinnz5slWdfLSES6unqBupSNU1fnR0pG8vLyKioqVK1dS
VSffEIyLq6eJ5qdgzVQ6IlV1UukIVXVS6UhpaemiRYuAM1V10iCYS55gk/pW
3p3g+hWl5eZOKysrnT9/7qJF1U1Ni1evXrp2bfOGDSs2b0ZrWr9e3h+Q6w8Q
zU/BmocPHy5VdVLpCKyZSkdgzUiNc3Nz586du3z5cqrqxF33EsG1UHDMkXcf
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
QUHBnj17EM/m5ubu2rULfjgrKysjIyM9PT0tLQ0DgvJokJSUBE5NmzZtxowZ
0vSXjo6Ocq6IlPfl4OCAoBuij4ECr4M/8eeJDEP+66+/jh8/HhH6pEmT8Edh
8vGCcn9TOL50/PNXm/+Z5ACb/S2TZjYDNnb2pmGbbZQnlkodVLc6Is6AtSNq
1l53U9flHpz2QiqY8n+zeMPgkmDGZfsEwWsXk05oa1YrW3cOrxDcsll6p0Rk
BLNsj4IgwS6emXM0uPTVaNsExyRhbYqwboewfqfgmi64Z7Jg3HuX4Ltb8N8j
BBYIG/cKwcVCaKmwqUzYXC5EVghRVWw6Pa5G2FonbGsQEo8IyY3C9uNCbW0t
6NzQ0HDkyJHGxsbjx483NTWdOnXq9OnTZ86caWtra21tbWlpwa+48+TJkydO
nMA1uPLo0aOHDx+ur6//4GgwefJkCplpiZnSRaQcTuWQGTabpBlqDq2HDYAl
+GtEhtsHl9euXSv3N4XjS8d//7LiXxNXfTN5LZPm6e6iNAczm627ffLCnGmL
9yqk+bgYNXfOX3OV7Ujgcp/VTHm9NBTpbLJBsIxgrPTZLSQ0MKGEaO69LMTX
s5gXUe1yJSKbBosLUkFDS4OHloYMLUMLHTILGzJH2zRkgRY+tHzzkCVaxJBV
pIC2YouwIkqwjmK5ozYxgi1arLAylgXsbEyIHx4T0By2CWuSBDhnWGh4aTAI
LheqCm2FyEIiobmZmZmQYAjx7t27octQ57179xYXF0OyIdyQb9C2srISLAaX
MSyA2iA4hgXiMqRZstk0/SWlfkk2m6QZUbO7uzsCbQTv8O1/gcgYCvB0cBkv
Jfc3heNLx3/9bAGbzaR5yjrQ+XsVT5bMqRnBErP100VpLhWj5sOzbU7OsWub
63ABTlvH+TYCZ6KzaLZZtQUo5pYhRFcL6afY0jPalio2ZwW9ZkQOExePGJEH
jf37WSqId6+hN0sLEfNDXov7/vUb+Q6I7Q1rfoNoxn5Dxv6swdIvDmDryyYb
WDPdOIQBQXlMMFOMCTR5BYtLU16BIhD2bhQBZgWLCBGB0DhMxCYRkFEEzgif
t2zZMmJMIH4pr0xJITPZbCqvIGlG1Ozo6EjZX15eXvR+/ldExnvGU4jLzs7O
cn9TOL50/GPssv/+1fpfE+wRNf97iui0Z/r8pBEqSnOKVMisal6jbtU427aZ
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
2Gw7JyePwMCQ6Oi41NSde/bklZfvq6+vb2k5d+NG7+vXsNmv3ry59ujRsM2+
du1gU5PcPeD4TJgxYwaG+nnz5hkYGCxevBju2tLS0sbGhk77paN+161b99Zd
Dy8oSzUUTbyG4lNjhro64h+dhQuNly2zWrXK2ds7cPPmqKSkFHE/gqJDh0DY
pgsXHjx7Rjb7Tk8Ps9l3757t6mrs6JD77XN8DsCz0ZTXggULjI2NJXcNUQaR
EYuByE5OTs7Ozi4uLq6uruCyokKZNuVjNRR8U75PjemqqgiB5uvpYbQ1s7Z2
dHX1CQ4Oj49PyMjIgM2urDxw9OiRs2ev3b2LiyHNT/r6JJvdfPmy3G+f45Nj
4sSJqqqqmpqa2traNOUFd21lZWVra0vuGqIMIkOU169f7yoCN97dlO8Y35Tv
MwBcVtPU1NLVXWBkZLp8+cq1a90DAoKjomJ37EjNy9u9f39pXV3d6dPt1669
7OuDNPcNDl5/8oTZ7Dt3zly/Xnv6tNw94Pi0UFFRUZ7yWrZsGblrOzs7SZSV
iQyA2uA47DdtyqdqVj1JP13ufowKzJg1CzZb28DAaOlSS3v7dV5eAeHhWxIT
k7Ozs0tKig4erD5x4nhn570nT4bEGbC7L14M2+xbt451dsr99jk+IaZMmUJT
XrSgvGTJEgsLC2nK6313DeA2lBqPQrhhxaHj03gNxecCpFldS2uenp4+Rt0V
K1a7uHgHBW2Ki9uanp5eWJhfUVF+5MiRtrYr3d1DQ0Ow2c9ev7744MGwzb5y
pbC6Wu4ecHwqSAvK0pQXuWto7gfdNRgNdkOvQXZQHpG1oaGh3J0YRQCXVWfP
1tLR0TU0NLGwsHV0dPP3D9qyJWb79h27d+eWlZXW1tY2N7devfr81StIc//Q
0M2nTyHNsNmtN240tLbK3QOOT4Jp06apq6vDXY+Y8lJ21yNEGbzG/WA6LkNY
DfpD0OXux+iCyqxZs+fNYzZ7yZLlK1c6eXr6h4VFbtuWlJ2dVVy8t7q66vjx
Y+fOdT96JIg2+/7Ll2wG7O7d9lu3Tpw/L/fb5/j4mDRpEsZ4uGvKBpQWlH9/
ygt3gua4BjE1DDnUXO5+jDpAmmfNmTNvwQI9DL9WVqucnb02bgyLjd2alpZe
ULDnwIH9hw8fbm29dPv2m8FB2Oye/v5LZLO7u09fvYpH5e4Bx0cG1VDMmzdP
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
m7dfvnw+OPhmaOi1IDwXhG5xiQqB89murqPt7XJ3hYNjtGO6qqqqhsY8PT3j
Zcss7e2dPD39wsI2JyRsy8zM2Ls3v6KirKGh5tSpY+fOnb97935/P51iSUtU
N3t66HTpM9ev1/DcTg4OuQE6q2lq6i5caGJhYePo6OrruyEiIio5OTknJ7uk
ZG919YGjR+taWk5evHjl0aNH4hLVIC1R9fcr53bub2iQuyscHKMadPr27Hnz
9BctWmZlZe/s7LlhQ0h0dOyOHTt2784tKytWLFGduXbt5vPnTwcH+xVLVMO5
nQ8etN++fZzndnJwyA3Qeaa6upaOjqGpqYWt7Ro3N5+QkE3x8VvT09MKCvLK
y/fV1R1sakJc3HHr1p3e3h5xTpstUQ0NDS9R3b/fdvMmz+3k4JAdLHCePXu+
vv4iM7MVq1Y5e3kFhIdHJiYmZmVlFhUVVFbuP3y4trn5eGfnxXv32BLVEDub
lpao3uZ2Xr1azXM7OTjkBug8a86cBUZGpsuXr1y71s3ff2NkZHRKSsquXTml
pUUHD1JuZ/Ply9eePHkyOPhazO1kS1SvXw8vUXV3I6xGiC13Vzg4RjVou1HN
+fMNFi82s7ZevX6918aNoTExcampqXl5u/fvL6mtrRKXqNpu3IC1piUqBM7P
BKFbObfz3Dm5u8LBMdrBAmcNjbkLFhgtXbp85cq1Hh6+oaHhW7ey3M7Cwj0H
DpQpcjs7u7shxy9Ep90rCJDprp4eKbezjud2cnDIDVqi0jEwWGxubu3g8MHc
zrrTp09cuHD5wYNHg4O9SktUyrmd2SUluWVlaNnFxdtzc+XuFgfHqANtBq4x
d66esfFSKyuW2xkYGBwV9X5uZ8vVqzeePaMlqgFaolLkdhYfOgQFP3D0aMWx
Y7gYP/fV10PW5e4cB8foAu0E/ja309XVOzg4LC4uPi1tZ35+Xnl5aV1dtbhE
1d7VhUj57RKVINx++RK0BX9hxevPnDnc1ob4GlfiBox3RWNjTkmJ3P3j4BhF
oCUqKbdznaenf1hYhFJu5/6Ghprm5mPnzg1vP8LiZqGwuhr3Vx0/DhMOCh/v
7Gy6cOHU5cvNYjt56RKuB8FLa2vl7h8HxygCW6LS1NQ1NDS1sLB1dHT183s/
t7O+pQUMvfr48ZPBwfzKSuh15fHjtUTk8+fB4pZr11pv3jzb1XX21q22mzfP
XL+OOyHTeK7c/ePgGC2g46eHcztXrFgl5Xampo7I7Wy9fh2/Io4uP3IE1hqh
NBQZnAVzweKO7u7OO3fO373beffuuTt3QOrTV69CoMt4/jYHx+fCcG6nrq7h
kiUjcjul7UcOnjyZuXcvbsM5I0xGUAyeNl+50nrjRvutWyDv+Xv3Lj54cOnh
QzTcAKk7bt8GnY+0t/Mdwzg4PhsocNaWcju9vaXczqyiotgdO7bn5mYXFxdU
VpaB1+KEWMvVq53d3YijL9y7d+nBgyuPH19/9uza06douA1Gg92gOfgONy53
/zg4RhFAZ3UtrQVGRkssLSm3M2jLluiUlE1xcXGi384pKaF1Z/htlhLW09PT
1/e0r+9Rb++dV6/u9/c/6O9/2Nd3s6cHpCY6w29DuKHg+w8flrt/HByjBe/n
drr6+fmFhcFsx+/cybhcWlpYXV3R2Hiis/P6kyevxI3+BsTKiz5B6BeTSd4I
wrP+/lsvXlwT80ku3L8PaUZMzaWZg+NzQjm308HV1cXXF1wOl7gMXQaXjx49
cf783Vev6ClDIn8lELsf9/WRNF+8f7+juxtRM6Q8v6JClk5xcIxOgM7s3Cl7
e+iyi48P02XRY0vx8gFwubPz5tOnfeL10OJ+/BTXnQkg+cOhoa4XL6DLFx88
AJdbrl1r7OjgNpuD43PC0NQUXF6+cqW9k5Ozl5dvSEhYbGzM9u0pOTk0j72v
vr7u9OmOrq6H/f19AwMvBgefvHnzbGDgtbhFGNA/OPigtxe6TNNfHbdvE5cP
NDbK2zUOjtEDyuc0tbAwt7GxXbPGydPTOygoJDo6Kjk5MSsrvaCA1pcrjx1r
bG8HnS/fuXP5wYOrjx93v3r1dGCgX7EZ732x0hmi3HnnztmuLnjsox0dFZzL
HByfC+CygXiAHDsPcvVqR1dXj8DAjZGRkYmJW9PTU/PysktKYLMhzdUnThxu
bT0hJn213rhx5eHDBwMDvaLT7hWER4OD154+PX/3bvutW3j01KVLR86ehTnf
lpkpdxc5OEYFNOfP1zM2Nl66dMny5bDZq5ydXf38AjZt2hQfH7tjB2x2xt69
u/fvhzQj+D3Y1FR/5gzM88lLlzq7ux++fEkme0DcWPvGs2fnurtB5NNXrhw/
f76+pQVPgbjL3EMOjtEBjblzdQ0NETJDms2srW0dHdd5efkEBzObnZS0LSMj
dc8eSHN+RUVJbS10ltG5pQXqjKD43vPn9CIDQ0PPBgdvPH3advNm85UrTRcu
HG1vP3TqVGltLcRd3g5ycIwSqGpozNfT01+0CNJsuny5pb09bLZ7YGDg5s3h
W7fGpqYm5+SwqHnfvsKqqtK6Okbnkyfhn1uvX7/1+PEbcfprYHDwQV8f4mgQ
GTQHkakKMr+ycnNCgtxd5OAYFZiupqalowNpXmhissjMDNJs5+Tk7O3tExIS
HB1NUfP23NxM0WkXVlcTnWk3ofabNx/29z8fGnrS33/p7l2w+9i5c6A5iFx1
4gSu5BXNHByfE7DZkOYFRkZw2iYWFlarVjFpDggICA8Pi42NTklhTjsvL7Oo
iNEZ6lxbW37kCMz2kba2M1evnr15s6Or6+SFC2A37DesddXx42UNDbDlO3bv
lrtzHByjCDM1NOZoa2sbGNAkGKR55Zo16zw9vTZu3BARER4fH7N9e2JmJtE5
t6ysoLKS7RTU0FB57FjNqVNQYZC6trkZ7AaLodr76uoKqqoyxQINuTvHwTGK
QLtnw2mDzgaLF5uYm9OE9nofH5/g4I2RkZu3bgWdt2VmQmczCgtzSkvzyssh
0MU1Nfvq6/cfPlx++DB+gt3w1UWHDu2pqMgqLk7Kzg6NiZG7cxwcowsqs2ap
a2mBzjoGBpQGBqft4OLi4uuLwBl0Dt+6FWY7IT09Zdeunfn50NxdIqNhpCHB
hWKDXu85cADCnbF3b3JOzpakJLm7xcEx6kB7+hGddQ0N4bSXWllZi6kjjM6i
Om+KiwM941JT4be3g9F79kCjs4qKsktKcsSWXVyMe2DFcUFUcjL8udzd4uAY
jSA6k9lG4Lxo2bJlK1aAzlBnmG3EzgHh4SHR0ZsTEqKTk8HohIwMuGjI9Pbc
XHhv/EzJyUnMysJDEdu2gftyd4iDY5SC7Z4tnvEKOs/V1ZXoDLON2Hmdl5d7
QIBvSAjUNiQmBpY7MjERrjt2xw6QFw038GtEQkJobCyuWefpKXeHODhGL4jO
09XU1DQ1ic4st1MsoVq5di389npvb4/AQETQ0Ggob3B0dGhMTFhsLPgLyQ7a
siVw82Y8CuLL3RUOjtEOorNktnUXLlxoamoipneuWLXKzskJjAZVXf38QGoY
b+/gYDQE1N5BQZ4bNrj5+69xc5O7ExwcHAwSndW1tObo6Gjr6+svWmS0dKmJ
hQUYbWlnZ+PoaL9uHeJo0HatuzvsNJqTp6ejmxvia7nfPgcHxzugvYNoZpvS
SBaamBgvWwZGL7WyMre1RRwN5to6OtquWQN2r+As5uD4UqGszvP19RcYGRks
Xmy0ZMkiMzNiNBqUGj9hwuV+sxwcHH+MmerqGnPnaunqaouMhuWGRiOOxk+5
3xoHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcH
BwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHh/z4/z6NYME=

    "], {{0, 432}, {324, 0}}, {0, 255},
    ColorFunction->RGBColor],
   BoxForm`ImageTag["Byte", ColorSpace -> "RGB", Interleaving -> True],
   Selectable->False],
  BaseStyle->"ImageGraphics",
  ImageSize->{234.9375, Automatic},
  ImageSizeRaw->{324, 432},
  PlotRange->{{0, 324}, {0, 432}}]], "Output",
 CellChangeTimes->{3.631530877882018*^9},
 ImageSize->{328, 432},
 ImageMargins->{{0, 0}, {0, 0}},
 ImageRegion->{{0, 1}, {0, 1}}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Creating a training set", "Subsubsection",
 CellChangeTimes->{{3.6305904422448387`*^9, 3.630590449955201*^9}, {
  3.630648625835211*^9, 3.630648635361813*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"nmol", "=", 
    RowBox[{"Length", "[", "an", "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"Number", " ", "of", " ", "molecules", " ", "in", " ", "dataset"}],
    " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"indtrain", "=", 
    RowBox[{"Flatten", "[", 
     RowBox[{"Position", "[", 
      RowBox[{"an", ",", 
       RowBox[{"_", "?", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"Count", "[", 
            RowBox[{"#", ",", 
             RowBox[{"Except", "[", "\"\<H\>\"", "]"}]}], "]"}], 
           "\[LessEqual]", "4"}], "&"}], ")"}]}], ",", 
       RowBox[{"{", "1", "}"}], ",", 
       RowBox[{"Heads", "\[Rule]", "False"}]}], "]"}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "Indices", " ", "of", " ", "molecules", " ", "with", " ", "4", " ", "or", 
     " ", "fewer", " ", "non"}], "-", 
    RowBox[{"H", " ", "atoms"}]}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"t", "=", 
    RowBox[{"Length", "[", "indtrain", "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"Number", " ", "of", " ", "such", " ", "molecules"}], " ", "*)"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"ind", "=", 
    RowBox[{"Complement", "[", 
     RowBox[{
      RowBox[{"Range", "[", "nmol", "]"}], ",", "indtrain"}], "]"}]}], ";"}], 
  " ", 
  RowBox[{"(*", " ", 
   RowBox[{"Indices", " ", "of", " ", "remaining", " ", "molecules"}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"ind", "=", 
    RowBox[{"Sort", "[", 
     RowBox[{"ind", ",", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"OrderedQ", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Length", "[", 
            RowBox[{
            "an", "\[LeftDoubleBracket]", "#1", "\[RightDoubleBracket]"}], 
            "]"}], ",", 
           RowBox[{"Length", "[", 
            RowBox[{
            "an", "\[LeftDoubleBracket]", "#2", "\[RightDoubleBracket]"}], 
            "]"}]}], "}"}], "]"}], "&"}], ")"}]}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Sort", " ", "remaining", " ", "molecules", " ", "by", " ", "number", " ", 
    "of", " ", "atoms"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"ind", "=", 
    RowBox[{"ind", "\[LeftDoubleBracket]", 
     RowBox[{"Round", "[", 
      RowBox[{"Range", "[", 
       RowBox[{"1", ",", 
        RowBox[{"nmol", "-", "t"}], ",", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"nmol", "-", "t"}], ")"}], "/", 
         RowBox[{"(", 
          RowBox[{"1000", "-", "t"}], ")"}]}]}], "]"}], "]"}], 
     "\[RightDoubleBracket]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Stratified", " ", "selection", " ", "of", " ", "941", " ", "molecules"}], 
   " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"indtrain", "=", 
    RowBox[{"Join", "[", 
     RowBox[{"indtrain", ",", "ind"}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Add", " ", "those", " ", "to", " ", "the", " ", "training", " ", "set"}], 
   " ", "*)"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"indpredict", "=", 
    RowBox[{"Complement", "[", 
     RowBox[{
      RowBox[{"Range", "[", "nmol", "]"}], ",", "indtrain"}], "]"}]}], ";"}], 
  " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "All", " ", "other", " ", "molecules", " ", "go", " ", "into", " ", "the", 
    " ", "prediction", " ", "set"}], " ", "*)"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{"Assert", "[", 
  RowBox[{
   RowBox[{"Length", "[", "indtrain", "]"}], "\[Equal]", "1000"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"Assert", "[", 
  RowBox[{
   RowBox[{"Intersection", "[", 
    RowBox[{"indtrain", ",", "indpredict"}], "]"}], "===", 
   RowBox[{"{", "}"}]}], "]"}]}], "Input",
 CellChangeTimes->{{3.630648641158142*^9, 3.630648657939652*^9}, {
  3.63064869775167*^9, 3.630648762022396*^9}, {3.630648831484015*^9, 
  3.630648858151574*^9}, {3.630648949973247*^9, 3.630648971298437*^9}, {
  3.630649629127654*^9, 3.630649638844945*^9}, {3.630649690945004*^9, 
  3.63064974605054*^9}}],

Cell["Verify stratification graphically", "Text",
 CellChangeTimes->{{3.630649645212389*^9, 3.630649658050766*^9}, {
  3.63064976945896*^9, 3.630649772426935*^9}}],

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{"Map", "[", 
   RowBox[{"Length", ",", 
    RowBox[{
    "an", "\[LeftDoubleBracket]", "indtrain", "\[RightDoubleBracket]"}]}], 
   "]"}], "]"}]], "Input",
 CellChangeTimes->{{3.6306496705906563`*^9, 3.630649680870925*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Creating a hold-out set", "Subsubsection",
 CellChangeTimes->{{3.6306502867795553`*^9, 3.630650289474766*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"ind", "=", 
    RowBox[{"Select", "[", 
     RowBox[{"indtrain", ",", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"Count", "[", 
          RowBox[{
           RowBox[{
           "an", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], ",", 
           
           RowBox[{"Except", "[", "\"\<H\>\"", "]"}]}], "]"}], ">", "4"}], 
        "&"}], ")"}]}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "All", " ", "molecules", " ", "in", " ", "training", " ", "set", " ", 
     "with", " ", "5", " ", "or", " ", "more", " ", "non"}], "-", 
    RowBox[{"H", " ", "atoms"}]}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"ind", "=", 
    RowBox[{"Sort", "[", 
     RowBox[{"ind", ",", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"OrderedQ", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Length", "[", 
            RowBox[{
            "an", "\[LeftDoubleBracket]", "#1", "\[RightDoubleBracket]"}], 
            "]"}], ",", 
           RowBox[{"Length", "[", 
            RowBox[{
            "an", "\[LeftDoubleBracket]", "#2", "\[RightDoubleBracket]"}], 
            "]"}]}], "}"}], "]"}], "&"}], ")"}]}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Sort", " ", "them", " ", "by", " ", "number", " ", "of", " ", "atoms"}], 
   " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"ind", "=", 
    RowBox[{"ind", "\[LeftDoubleBracket]", 
     RowBox[{"Round", "[", 
      RowBox[{"Range", "[", 
       RowBox[{"1", ",", 
        RowBox[{"Length", "[", "ind", "]"}], ",", 
        RowBox[{
         RowBox[{"Length", "[", "ind", "]"}], "/", "100"}]}], "]"}], "]"}], 
     "\[RightDoubleBracket]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Stratified", " ", "selection", " ", "of", " ", "100", " ", "molecules"}], 
   " ", "*)"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"indholdout", "=", "ind"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"indproper", "=", 
    RowBox[{"Complement", "[", 
     RowBox[{"indtrain", ",", "indholdout"}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Remaining", " ", "molecules", " ", "constitute", " ", "training", " ", 
    "set", " ", "proper"}], " ", "*)"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{"Assert", "[", 
  RowBox[{
   RowBox[{"Length", "[", "indholdout", "]"}], "\[Equal]", "100"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"Assert", "[", 
  RowBox[{
   RowBox[{"Intersection", "[", 
    RowBox[{"indproper", ",", "indholdout"}], "]"}], "===", 
   RowBox[{"{", "}"}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Assert", "[", 
  RowBox[{
   RowBox[{"Union", "[", 
    RowBox[{"indproper", ",", "indholdout"}], "]"}], "\[Equal]", 
   RowBox[{"Sort", "[", "indtrain", "]"}]}], "]"}]}], "Input",
 CellChangeTimes->{{3.630650719873796*^9, 3.630650795285151*^9}, {
  3.6306508574747267`*^9, 3.6306508985335712`*^9}}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Representation", "Subsection",
 CellChangeTimes->{{3.630589121679153*^9, 3.630589123358199*^9}, {
  3.630654482170808*^9, 3.6306544836249*^9}}],

Cell[CellGroupData[{

Cell["Computing Coulomb matrices", "Subsubsection",
 CellChangeTimes->{{3.630654489241699*^9, 3.6306545167318373`*^9}}],

Cell["\<\
In preparation, convert element types from string abbreviations to atomic \
numbers, and, coordinates from \[Angstrom]ngstr\[ODoubleDot]m to atomic units \
(Bohr radii).\
\>", "Text",
 CellChangeTimes->{{3.630654530683535*^9, 3.630654575465474*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "Convert", " ", "element", " ", "types", " ", "from", " ", "strings", " ", 
    "to", " ", "atomic", " ", "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"an", "=", 
    RowBox[{"Map", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"ElementData", "[", 
        RowBox[{"#", ",", "\"\<AtomicNumber\>\""}], "]"}], "&"}], ",", "an", 
      ",", 
      RowBox[{"{", "2", "}"}]}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"H", "\[Rule]", "1"}], ",", " ", 
    RowBox[{"C", "\[Rule]", "6"}], ",", " ", 
    RowBox[{"N", "\[Rule]", "7"}], ",", " ", 
    RowBox[{"O", "\[Rule]", "8"}], ",", " ", 
    RowBox[{"S", "\[Rule]", "16"}]}], " ", "*)"}]}]], "Input",
 CellChangeTimes->{{3.630654618166685*^9, 3.630654622286433*^9}, {
  3.630654678391139*^9, 3.6306546982222023`*^9}, {3.630654745372313*^9, 
  3.6306547527626343`*^9}, {3.6306547845387783`*^9, 3.630654814958372*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "Convert", " ", "atom", " ", "positions", " ", "to", " ", "atomic", " ", 
    "units"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"ang2bohr", "=", 
     RowBox[{"QuantityMagnitude", "[", 
      RowBox[{"UnitConvert", "[", 
       RowBox[{
        RowBox[{"Quantity", "[", 
         RowBox[{"1", ",", "\"\<\[Angstrom]ngstr\[ODoubleDot]m\>\""}], "]"}], 
        ",", 
        RowBox[{"Quantity", "[", 
         RowBox[{"1", ",", "\"\<BohrRadius\>\""}], "]"}]}], "]"}], "]"}]}], 
    " ", 
    RowBox[{"(*", " ", 
     RowBox[{"100", "/", "52.917720859"}], " ", "*)"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"xyz", "=", 
     RowBox[{"xyz", "*", "ang2bohr"}]}], ";"}]}]}]], "Input",
 CellChangeTimes->{{3.630050968578857*^9, 3.630050988592136*^9}, {
  3.630051053884602*^9, 3.630051079281948*^9}, {3.630051115506266*^9, 
  3.630051124767446*^9}, {3.630051155023984*^9, 3.6300511565731983`*^9}, {
  3.630589463092412*^9, 3.630589492623396*^9}, {3.6305898911921787`*^9, 
  3.630589892241021*^9}, {3.6306547555896807`*^9, 3.630654773282412*^9}}],

Cell["Coulomb matrices.", "Text",
 CellChangeTimes->{{3.630654854370566*^9, 3.630654858169915*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"cm", "=", 
   RowBox[{"Table", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"i", "\[Equal]", "j"}], ",", 
       RowBox[{"0.5", 
        RowBox[{
         RowBox[{"an", "\[LeftDoubleBracket]", 
          RowBox[{"k", ",", "i"}], "\[RightDoubleBracket]"}], "^", "2.4"}]}], 
       ",", 
       RowBox[{
        RowBox[{"an", "\[LeftDoubleBracket]", 
         RowBox[{"k", ",", "i"}], "\[RightDoubleBracket]"}], 
        RowBox[{
         RowBox[{"an", "\[LeftDoubleBracket]", 
          RowBox[{"k", ",", "j"}], "\[RightDoubleBracket]"}], "/", 
         RowBox[{"EuclideanDistance", "[", 
          RowBox[{
           RowBox[{"xyz", "\[LeftDoubleBracket]", 
            RowBox[{"k", ",", "i"}], "\[RightDoubleBracket]"}], ",", 
           RowBox[{"xyz", "\[LeftDoubleBracket]", 
            RowBox[{"k", ",", "j"}], "\[RightDoubleBracket]"}]}], "]"}]}]}]}],
       "]"}], "  ", 
     RowBox[{"(*", " ", 
      RowBox[{"Equ", ".", " ", "26"}], " ", "*)"}], "\[IndentingNewLine]", 
     ",", 
     RowBox[{"{", 
      RowBox[{"k", ",", "nmol"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", 
       RowBox[{"Length", "[", 
        RowBox[{"an", "\[LeftDoubleBracket]", "k", "\[RightDoubleBracket]"}], 
        "]"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"j", ",", 
       RowBox[{"Length", "[", 
        RowBox[{"an", "\[LeftDoubleBracket]", "k", "\[RightDoubleBracket]"}], 
        "]"}]}], "}"}]}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.6306549677117367`*^9, 3.630655047578993*^9}, {
  3.6306551175267076`*^9, 3.630655121933461*^9}, {3.631533366210278*^9, 
  3.63153336928975*^9}}],

Cell["Sort by row norm.", "Text",
 CellChangeTimes->{{3.630655136373436*^9, 3.630655144564466*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"t", "=", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Norm", "[", 
       RowBox[{"cm", "\[LeftDoubleBracket]", 
        RowBox[{"k", ",", "i"}], "\[RightDoubleBracket]"}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"k", ",", "nmol"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", 
        RowBox[{"Length", "[", 
         RowBox[{"an", "\[LeftDoubleBracket]", "k", "\[RightDoubleBracket]"}],
          "]"}]}], "}"}]}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"Row", " ", "norms", " ", "for", " ", "each", " ", 
    RowBox[{"matrix", "'"}], "s", " ", "rows"}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"t", "=", 
    RowBox[{"Map", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"Reverse", "[", 
        RowBox[{"Ordering", "[", "#", "]"}], "]"}], "&"}], ",", "t"}], 
     "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Yields", " ", "index", " ", "reordering", " ", "for", " ", "descending", 
    " ", "order", " ", "of", " ", "row", " ", "norms"}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"cm", "=", 
    RowBox[{"MapThread", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"#1", "\[LeftDoubleBracket]", 
        RowBox[{"#2", ",", "#2"}], "\[RightDoubleBracket]"}], "&"}], ",", 
      RowBox[{"{", 
       RowBox[{"cm", ",", "t"}], "}"}]}], "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Simultaneously", " ", "rearrange", " ", "rows", " ", "and", " ", 
    "columsn", " ", "of", " ", "each", " ", "matrix"}], " ", 
   "*)"}]}], "\[IndentingNewLine]"}], "Input",
 CellChangeTimes->{{3.63065514760664*^9, 3.630655203211018*^9}, {
  3.630655879409337*^9, 3.630655899864814*^9}, {3.630655965383789*^9, 
  3.6306559655403147`*^9}, {3.630656021743958*^9, 3.6306560228919773`*^9}}],

Cell["Pad.", "Text",
 CellChangeTimes->{{3.630656039770299*^9, 3.6306560426573687`*^9}, 
   3.630656091329053*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Max", "[", 
   RowBox[{"Map", "[", 
    RowBox[{"Length", ",", "an"}], "]"}], "]"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Maximum", " ", "number", " ", "of", " ", "atoms", " ", "in", " ", 
    "dataset"}], " ", "*)"}]}]], "Input",
 CellChangeTimes->{{3.6306560524195337`*^9, 3.630656069290037*^9}}],

Cell[BoxData["23"], "Output",
 CellChangeTimes->{3.6306560585424147`*^9, 3.6315333988559227`*^9}]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"cm", "=", 
   RowBox[{"Map", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"PadRight", "[", 
       RowBox[{"#", ",", 
        RowBox[{"{", 
         RowBox[{"23", ",", "23"}], "}"}]}], "]"}], "&"}], ",", "cm"}], 
    "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.630656044645722*^9, 3.630656084689645*^9}}],

Cell["Vectorize", "Text",
 CellChangeTimes->{{3.630656093841161*^9, 3.630656094896743*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"cm", "=", 
   RowBox[{"Map", "[", 
    RowBox[{"LowerTriangularPart", ",", "cm"}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.630656098959428*^9, 3.630656107801783*^9}, {
  3.6306561724405127`*^9, 3.630656172696191*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", "cm", "]"}]], "Input",
 CellChangeTimes->{{3.630656177398929*^9, 3.630656178720573*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"7102", ",", "276"}], "}"}]], "Output",
 CellChangeTimes->{3.6306561790137987`*^9, 3.630733271941162*^9, 
  3.631533405757971*^9}]
}, Open  ]]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Model building", "Subsection",
 CellChangeTimes->{{3.630589121679153*^9, 3.630589123358199*^9}, {
  3.630654482170808*^9, 3.6306544836249*^9}, {3.630656252842778*^9, 
  3.630656254489732*^9}}],

Cell[CellGroupData[{

Cell["Basic model", "Subsubsection",
 CellChangeTimes->{{3.630666725274178*^9, 3.630666727578381*^9}}],

Cell["Choose some values for hyperparameters.", "Text",
 CellChangeTimes->{{3.6306669117999983`*^9, 3.6306669162160873`*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"\[Lambda]", ",", "\[Sigma]"}], "}"}], "=", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"2.", "^", 
     RowBox[{"-", "22.5"}]}], ",", 
    RowBox[{"2.", "^", "11.5"}]}], "}"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"e", ".", "g", "."}], ",", " ", 
    RowBox[{
    "center", " ", "of", " ", "logarithmic", " ", "grid", " ", "in", " ", 
     RowBox[{"Equ", ".", " ", "27"}]}]}], " ", "*)"}]}]], "Input",
 CellChangeTimes->{{3.6306667350028877`*^9, 3.630666739559866*^9}, {
  3.630666884866667*^9, 3.630666906184956*^9}, {3.630667988426298*^9, 
  3.630667993761751*^9}, {3.630668377444405*^9, 3.630668434502749*^9}, {
  3.631533725273958*^9, 3.6315337305769567`*^9}, {3.631533791959277*^9, 
  3.631533792853003*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.6858739404357614`*^-7", ",", "2896.309375740099`"}], 
  "}"}]], "Output",
 CellChangeTimes->{3.631533731003584*^9}]
}, Open  ]],

Cell["Compute kernel matrix K.", "Text",
 CellChangeTimes->{{3.630667010478159*^9, 3.630667015038299*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"kk", "=", 
   RowBox[{"KernelGaussian", "[", 
    RowBox[{
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.630666943562912*^9, 3.630667006719328*^9}}],

Cell["Train kernel ridge regression model.", "Text",
 CellChangeTimes->{{3.630667040902762*^9, 3.6306670461015463`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"krr", "=", 
   RowBox[{"KernelRidgeRegression", "[", 
    RowBox[{"kk", ",", 
     RowBox[{
     "ae", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{"RegularizationStrength", "\[Rule]", "\[Lambda]"}]}], "]"}]}], 
  ";"}]], "Input",
 CellChangeTimes->{{3.630667047578886*^9, 3.630667098392152*^9}}],

Cell["Predict hold-out set.", "Text",
 CellChangeTimes->{{3.630667835209206*^9, 3.630667838624954*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"ll", "=", 
   RowBox[{"KernelGaussian", "[", 
    RowBox[{
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indholdout", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.6306678155351458`*^9, 3.630667830410933*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"f", "=", 
   RowBox[{"krr", "[", "ll", "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.6306678402651*^9, 3.630667886093258*^9}}],

Cell["Performance statistics", "Text",
 CellChangeTimes->{{3.630667889940064*^9, 3.630667892795875*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Loss", "[", 
  RowBox[{
   RowBox[{
   "ae", "\[LeftDoubleBracket]", "indholdout", "\[RightDoubleBracket]"}], ",",
    "f"}], "]"}]], "Input",
 CellChangeTimes->{{3.630667894411755*^9, 3.630667902164599*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"\<\"NumberOfSamples\"\>", "\[Rule]", "100"}], ",", 
   RowBox[{"\<\"RootMeanSquareError\"\>", "\[Rule]", "26.28271564754919`"}], 
   ",", 
   RowBox[{"\<\"MeanAbsoluteError\"\>", "\[Rule]", "21.490653861522677`"}], 
   ",", 
   RowBox[{"\<\"StandardDeviation\"\>", "\[Rule]", "26.29141132995312`"}], 
   ",", 
   RowBox[{"\<\"MedianAbsoluteError\"\>", "\[Rule]", "20.15993168354032`"}], 
   ",", 
   RowBox[{"\<\"MaximumAbsoluteError\"\>", "\[Rule]", "74.26840547084817`"}], 
   ",", 
   RowBox[{"\<\"Correlation\"\>", "\[Rule]", "0.9935409328202718`"}], ",", 
   RowBox[{"\<\"CorrelationSquared\"\>", "\[Rule]", "0.9871235851893758`"}], 
   ",", 
   RowBox[{"\<\"OneMinusCorrelationSquared\"\>", "\[Rule]", 
    "0.012876414810624182`"}]}], "}"}]], "Output",
 CellChangeTimes->{{3.631533566898941*^9, 3.631533582633773*^9}, 
   3.631533738345622*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ScatterPlot", "[", 
  RowBox[{
   RowBox[{
   "ae", "\[LeftDoubleBracket]", "indholdout", "\[RightDoubleBracket]"}], ",",
    "f"}], "]"}]], "Input",
 CellChangeTimes->{{3.6306686148389482`*^9, 3.630668636901688*^9}, {
  3.6315337580699987`*^9, 3.631533761043961*^9}}],

Cell[BoxData[
 GraphicsBox[
  TagBox[RasterBox[CompressedData["
1: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
7+o=
    "], {{0, 223}, {360, 0}}, {0, 255},
    ColorFunction->RGBColor],
   BoxForm`ImageTag["Byte", ColorSpace -> "RGB", Interleaving -> True],
   Selectable->False],
  BaseStyle->"ImageGraphics",
  ImageSize->Automatic,
  ImageSizeRaw->{360, 223},
  PlotRange->{{0, 360}, {0, 223}}]], "Output",
 CellChangeTimes->{
  3.631533608315308*^9, {3.6315337472455807`*^9, 3.6315337619805613`*^9}},
 ImageSize->{364, 223},
 ImageMargins->{{0, 0}, {0, 0}},
 ImageRegion->{{0, 1}, {0, 1}}]
}, Open  ]],

Cell[BoxData[
 RowBox[{"Clear", "[", 
  RowBox[{"\[Lambda]", ",", "\[Sigma]"}], "]"}]], "Input",
 CellChangeTimes->{{3.630669573455039*^9, 3.6306695763474817`*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Grid search", "Subsubsection",
 CellChangeTimes->{{3.6306689767203197`*^9, 3.630668978200815*^9}}],

Cell["Set up grid of hyperparameter values.", "Text",
 CellChangeTimes->{{3.630669066605967*^9, 3.6306690719338007`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"Equ", ".", " ", "27"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"rsgrid", "=", 
     RowBox[{"Power", "[", 
      RowBox[{"2", ",", 
       RowBox[{"Range", "[", 
        RowBox[{
         RowBox[{"-", "40"}], ",", 
         RowBox[{"-", "5"}], ",", "0.5"}], "]"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"lsgrid", "=", 
     RowBox[{"Power", "[", 
      RowBox[{"2", ",", 
       RowBox[{"Range", "[", 
        RowBox[{"5", ",", "18", ",", "0.5"}], "]"}]}], "]"}]}], 
    ";"}]}]}]], "Input",
 CellChangeTimes->{{3.630669004519816*^9, 3.6306690537920513`*^9}, 
   3.630674912592901*^9, {3.6306749475201283`*^9, 3.6306749515916758`*^9}, {
   3.630675004718013*^9, 3.630675019573151*^9}, {3.630736355284255*^9, 
   3.6307363730216923`*^9}, {3.6307364293607883`*^9, 3.63073644367251*^9}, 
   3.6307388886275387`*^9, {3.6307391022862053`*^9, 3.6307391046832952`*^9}, {
   3.631534014949291*^9, 3.631534015010181*^9}}],

Cell["\<\
Define a function that returns performance on hold-out set given \
hyperparameter values.\
\>", "Text",
 CellChangeTimes->{{3.630068909084544*^9, 3.630068930760585*^9}, {
  3.630068965416274*^9, 3.630068975834865*^9}, {3.630669383249435*^9, 
  3.6306693849055634`*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"Clear", "[", "estperf", "]"}], ";"}], "\[IndentingNewLine]", 
  "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "Parameters", " ", "are", " ", "regularization", " ", "strength"}], ",", 
    " ", 
    RowBox[{"length", " ", "scale"}], ",", " ", 
    RowBox[{"and", " ", "kernel"}]}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"estperf", "[", 
    RowBox[{"\[Lambda]_", ",", "\[Sigma]_", ",", "k_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"kk", ",", "ll", ",", "krr", ",", "pred", ",", "loss"}], "}"}], 
     ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"kk", "=", 
       RowBox[{"k", "[", 
        RowBox[{
         RowBox[{
         "cm", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}],
          ",", 
         RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"ll", "=", 
       RowBox[{"k", "[", 
        RowBox[{
         RowBox[{
         "cm", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}],
          ",", 
         RowBox[{
         "cm", "\[LeftDoubleBracket]", "indholdout", 
          "\[RightDoubleBracket]"}], ",", 
         RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"krr", "=", 
       RowBox[{"KernelRidgeRegression", "[", 
        RowBox[{"kk", ",", 
         RowBox[{
         "ae", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}],
          ",", 
         RowBox[{"RegularizationStrength", "\[Rule]", "\[Lambda]"}]}], 
        "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"pred", "=", 
       RowBox[{"krr", "[", 
        RowBox[{"ll", ",", "\"\<Predictions\>\""}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"Loss", "[", 
       RowBox[{
        RowBox[{
        "ae", "\[LeftDoubleBracket]", "indholdout", "\[RightDoubleBracket]"}],
         ",", "pred"}], "]"}]}]}], "\[IndentingNewLine]", "]"}]}], 
  ";"}]}], "Input",
 CellChangeTimes->{{3.6300689774882917`*^9, 3.6300690057721653`*^9}, {
  3.630069043565158*^9, 3.630069078909233*^9}, {3.630069605175264*^9, 
  3.63006962504914*^9}, {3.6300697995021477`*^9, 3.630069861934478*^9}, {
  3.630075419109586*^9, 3.630075420998878*^9}, {3.630075525510487*^9, 
  3.630075525678688*^9}, {3.630139655717593*^9, 3.630139706859192*^9}, {
  3.630669396755919*^9, 3.6306694247954073`*^9}}],

Cell["Evaluate the functions on the grid:", "Text",
 CellChangeTimes->{{3.6306694324674873`*^9, 3.630669442962912*^9}}],

Cell[BoxData[
 RowBox[{"Dynamic", "[", 
  RowBox[{"Log", "[", 
   RowBox[{"2", ",", 
    RowBox[{"{", 
     RowBox[{"\[Lambda]", ",", "\[Sigma]"}], "}"}]}], "]"}], "]"}]], "Input",
 CellChangeTimes->{{3.630669519707829*^9, 3.630669521664065*^9}, {
  3.630669560916197*^9, 3.630669568027266*^9}, {3.630669619490019*^9, 
  3.630669622721692*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"perfG", "=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"estperf", "[", 
      RowBox[{"\[Lambda]", ",", "\[Sigma]", ",", "KernelGaussian"}], "]"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{"\[Sigma]", ",", "lsgrid"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Lambda]", ",", "rsgrid"}], "}"}]}], "]"}]}], ";"}]], "Input",\

 CellChangeTimes->{{3.630669450192575*^9, 3.630669511916271*^9}, 
   3.63153409731021*^9}],

Cell[BoxData[
 RowBox[{"(*", " ", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"filename", "=", 
    RowBox[{"FileNameJoin", "[", 
     RowBox[{"{", 
      RowBox[{"\"\<path\>\"", ",", "\"\<filename.txt.bz2\>\""}], "}"}], 
     "]"}]}], ";", " ", "\[IndentingNewLine]", 
   RowBox[{"Export", "[", 
    RowBox[{"filename", ",", 
     RowBox[{"ToString", "[", 
      RowBox[{"perfG", ",", "InputForm"}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"\"\<BZIP2\>\"", ",", "\"\<String\>\""}], "}"}]}], "]"}], ";", 
   "  ", 
   RowBox[{"(*", " ", 
    RowBox[{
    "Use", " ", "this", " ", "line", " ", "to", " ", "store", " ", 
     "results"}], " ", "*)"}], " ", "\[IndentingNewLine]", 
   RowBox[{"perfG", "=", 
    RowBox[{"ToExpression", "[", 
     RowBox[{"Import", "[", 
      RowBox[{"filename", ",", 
       RowBox[{"{", 
        RowBox[{"\"\<BZIP2\>\"", ",", "\"\<String\>\""}], "}"}]}], "]"}], 
     "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Use", " ", "this", " ", "line", " ", "to", " ", "retrieve", " ", 
    "previously", " ", "stored", " ", "results"}], " ", "*)"}], 
  "\[IndentingNewLine]", "*)"}]], "Input",
 CellChangeTimes->{{3.63066986101241*^9, 3.630669924824472*^9}, {
  3.6307350297620792`*^9, 3.6307350493610992`*^9}, {3.6307392144753637`*^9, 
  3.630739214666733*^9}, {3.631534114467306*^9, 3.631534143953467*^9}, {
  3.631542406825656*^9, 3.631542439456962*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GraphicsRow", "[", 
  RowBox[{
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"HyperparameterPlot", "[", 
      RowBox[{"rsgrid", ",", "lsgrid", ",", "perfG", ",", "stat"}], "]"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{"stat", ",", 
       RowBox[{"{", 
        RowBox[{
        "\"\<RootMeanSquareError\>\"", ",", "\"\<MeanAbsoluteError\>\"", ",", 
         "\"\<OneMinusCorrelationSquared\>\""}], "}"}]}], "}"}]}], "]"}], ",", 
   RowBox[{"ImageSize", "\[Rule]", 
    RowBox[{"18.5", "*", "72"}]}]}], "]"}]], "Input",
 CellChangeTimes->{{3.630816394072554*^9, 3.630816434873212*^9}, {
   3.630820262850326*^9, 3.630820268182687*^9}, 3.6315341486813707`*^9}],

Cell[BoxData[
 GraphicsBox[
  TagBox[RasterBox[CompressedData["
1:eJzsvXeUlGWa9z/v7OzxPXvmt+fMzv7j7m/Pzu47++7sjDOOgjrBGQM5iWJk
zIogCAiKiAFFzIqICQRECY1K6hZaBCRLaujcBR2rc3dVdagcn3AX7x2e56mn
It1NQ0Hz/Zz7sEV10V3MWhfX976u63v9xyNPTpj84x/96EdP/2/6y4SHn73p
qacefu72n9Df3PzcnMce+Tv6oOB//ehHg//+Rz9ij08DAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAC5grFbrK6+80u/ftqSkpKqqKt1XKysr6Qv6
/YcCAEDWQVAFAIDzA+ItAGCAcS7CWiAQeOONN1RVTfcCRVFeffVV+rL+/bkA
AJB1EFQBAOD8gHgLABhgmMNaTU3NsmXLZs2a9cknn3i9XvFkSUnJwoUL586d
u3PnzsWLF/fke27btu377783P+NyuU6cOLF79+68vDz6I4qLi7dv375169b+
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
1uH4lpACQk4QUqyqZaparqoV/JTzU6afUkLoKaav9Pn20T9osay2WL5wODYS
Qr/DN1GyOUq+jJLVRF1B1I+I8h5R3iDyAiI/T6Sn1cgMNTxVCUySfQ9L7gek
7nsjHXeHbXeE2m4LNt8SaBjrrxvlrxrps4zwlg73FA5zFwxzHR7qPDCke8/N
XTtv6vz2xo6tNzq23GDf8Ffbl39pX/uX9s+vb1vx59Zlf2756E/N7/+xadEf
m976Q+Pr1zUsvK7+pWvrX7jG+uw1dXMG180aXDt9UO3UQTWPXV3z8NXV919V
PfGqqrt+XzXh95Xjr6wce2Xl6CtPjbzy1LDfnRryu5M3/e7kX3978vrfnvzT
by1/+K3luiss115hueYKy6ArKq6+ouKqKyp+f0XF737Dzm9/U3HFbyp+w075
r/n5n9+U/4qf/6bn1+z8X/38l+n8Mun8nxSnLPn8J04fT8IHBJkkMNOHoEr/
E6oxQXMwlZTyaGlR1VOqWqWqNapap6r1qtqoqM30eLzV9NjspaZT4vFWKWoj
f1kd/yP0D57ksbeMkBJCCnlkPuLz7bJYVlksKxyO9YTkErIhSnKi5AuifkrU
D4jyLpFeVyMvqeF5SugpJTBd8U+WvQ9Lrvsj3X+LdNwTtt0Vark92HhrwHqL
v2aMr3KUt2KEp2S4+8Qw15GhzoN6jM2/0ZF3g30jD7Brrm9bdX3r8j+3fPKn
5g/+2Cyi62vXNSy4tv7Fa63zrrHOuUYLrY8Pqpl0dc1DV1ffd1XVPVdV3fH7
qtu00Hpq1JWnhvO4eqMprv6RxtXfxsVVGlSv1IOqiKtXxMfVcx1aEV17eRLS
RURU0HP6EG+pGFm+fLk5iW2yqw3tqrVNrWtVjpXavt1dfrjYdrJBsViV8jql
rE4ureWnhp2S+EOfp6+psCqWeoX+keJKD/3j3+4p376nvKDMXt+mNtrUZofa
2qG2d6n2brXDpXZ5VKdXdfsVT0D2BSP+UCgQDgbD/lDEG5bcEdkpKV2y4lDU
dh7t63kwp/8QlBOVJszHCTlMyH5CdhGyjZBNRM0h6iqiLiXq+0R9kyg0SX5O
DT+tBGbK3qmS69FI1wNhxz2h9tuDzeMDVhqxR3rLRrhPDHcdHta9b0jXzps7
tt3o2HwDC9Srr2/7jKfBH/6p+T0epV+9ruHla63PX2N95pq62YNrZ8SH6Luv
qrqdxuffa/F5xO9Y6nuzHqL/LOIzD86DzfH5CnPSmxiZRVjOHJDPGIezHdMu
5GNfEmfuDW1+AdLd3X0sHvoMfb6lpeXIkSPiNW63e8aMGRmci6JkV5TscTjy
dGF+TBfmpTwtPGk6p/gRjy38lPOkscjh2GGx5AiF7nBs1hU6zRu/JmQtUT8j
6ics8ihvE2UhkV8k0lw1MlsJTVcCU2Tfo7LnQcl5X6TznrD9zlD7hGDzrcGG
WwJ1Y/3Vo32nRnjLR3iKh7uP89TxhyHd+27u+v6mzu9uYhGJZo+b/mr/6q+2
dXpc+vTPLR/zBJKGpnf+0PjGdQ08Ouk55GAtQFF5Pvnqmkeurn7gquq/0Rj1
e5pGVtI08pYrK8dweT5cl+c3/PbkX/Qw9YdYGmkx5PmVJnl+RSp5/ivkkBfQ
SfgQIZMEZvoQVBMjatTPby9TCHOqweusx8or9qU/e6lIV9UGVbWqaq2qVqtq
JY+35Sq7Cy3iqd0Rh2OrxfK5xfKZxbLc79vIL0K/4hehXJ6r7xDlVSLPV6Vn
aZhVQ08ogck0zEpuI8zeFWqjmd5tARZmx/irRvssI72lI9gt6LGhzkN6jN1+
Y8fWG2jWZ/+aBdi2z69vXfHn1qV/Yonf4j82vW26/KS539xr6p4aXDdzUO20
+NBquvnU5PnQpLia8tozQ1zNIM//L0Lr+T7Q5qDP9CHeJosRKp/r26kwV4Uw
z99dbghzIcmpBi+uZqeoip1Ceiq1Q39bUs0UeplJoVNpbyj042V2Kvyp/G9x
qG2dqq1bdTjVTrfa7VGcXtntl7yBiI8pc0OeeyKSU5K7JMUhK1Set/Ab1zr+
b4GFV7Vogn2EkAOE7CbkO0LyWJ6srtHLWIuI/JoqzVcjc5TQTMU/VfZMkpwP
Rjonhm13BpsnBKzj/VVjvBUjPUXDXEeHOQ8M6fr+5s5vb3Tk8loVDdSrrmdp
8Ed6lBaXqC9cy+pTT+nZryhOiRvUO/kNqkh9hTwfYpLnf4rLe7X4HC/PteCc
Up5nCMiQ53060OYXLzSUzZw50+l0EiqPc3OXLl1q/mqSNt/Nhfkai2UdF+Y0
9ysyCfNKfqpMp1o/VTz5tPCyTjEhhQ7Hd2aFTsh2HnY2EHUdvxhcxvPGd4ny
GpFfUqXn1fAzSnCW4n9C9k6WPY+wyk7XxLDjrnD7HaGWCVplp3qs79RoVtkp
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
4OVyURzv0lU5zdm6I+w4xeFPUs1O9bud/hGq6OML6HXx/e2Gf/thLs9XWizL
fb6viSpcPj6PmbfLb6iRBWr4BSX0jBIQLh+PyZ6HmDwX4+ftd2r+7fW3+GvH
+KtomB3hLWNrMliTkoixen87y/q+ir///OBPWnR9PdG/vc7s336vqTEp2dkj
g3/7VXpQPbPxJkaHzuu5NLV5higqntm9e/ftt9/+i1/8gr5YPIMo2i9QMWKO
t5S6VtWYNGfd7HVaN/uJU7LWwZ5Xtv1AG1PlZUyMU0m+v1jaV8QOfXCgmOl0
JtLLTCJdL6OzGrqh0Iu4Qtdb3LUJdJNBHPdvVz0BxRukCj0cCJn921001POL
WZvCCugNitYKJQziCrnd0w/cIO5bom4h6pd8DlTYe/IuU+lFNTxXCcyWvU9I
rsciXQ+FHX8Ltd8ZbBkfqGeWnt7ykZ7CEa4jw7r3D+3adTO7ShX+7Wt0n5AP
TQV07t9e90x89mt2COH+7dpo57C4FRsxA8/BSXuLMrWMnqlZNHMcznagu0AO
tPlAZdCgQYY2P80y8EM+396konmN3X6CKm6bvZhL8gRVbh6WtCcodL3LvdKI
OfX1W+IN4rbyAvp6LfIoNHV8h8ivEXk+keeq0pNqZJoSmqz4H2Wpo+s+zSCO
ORfdGmwax6JQrajsjPSUjnAXDncfS9qwlmwQt/zPrZ/oHZjxBnHW566xzh3M
HCyNJsyUVZ4xplvEmxPGJOML6OnkeebrxDM2YaKA3h8n4eMwIDPJBG1Oeeut
tyZMmHCaZ5V/93d/9/jjjxvuOrt27XrsscdEVhkOhy+77LJDhw6JL9GEc8+e
PfRXZJUZMN92nmbaPEjls2IUzW0lujBnRXNJU+Xd/Dh1Se6KSPphv+3mNr8d
XMtzhc5d3OusR/X+9hrjClRsyhD+7fX1XwnzdodjHWGji2aXj0VEeUOVXlEj
L6ihuZoJp+8xU5OScPkQ/u3j9TUZI73lw5nLR8FQrb99t74jY4tpgGilaX/l
O9rlZ5x/+4zBiZsrteqM4eyRKq6aG5OSDYh+mz6uJhvEwXvznJ1LU5tniKLi
mfvvv3/9+vXz5s177bXXxDOIov3CxIkTn376abM2N+zZtaJ5rdbNTpX1lwnl
cl2V7y2S9hRGdp+I7KGnUBPpTKebKulGDX3XoXbhFGceQhcFdG0C3dTf3u1R
XT7V41e85gJ6xBdi/u1CnrMCuqLQjLrJ1N9u3rC2j/e3f8OvWNcSdSVRP+Y2
Ta8ThbU/KcGnZN8MyT1F6n440nEfj9u3BRt4y5NllKd4hPvYcOfBoWzec/tN
Dt7fzu5RV+k+ITGDOH6JKnqczCNIeoiOOS8lrC4yN44OTipLZYjMZ19Az3a4
y/qBNh+oJPzTyUOB2JuWWDSncptL8lZFaePDMjaeXtr1YclO0Z+pK3SbzV6W
pNC17NHh2GkqoG/kfTtbCPmSqOb+9jeIIvrbn1bDM5Xg1BT97cK5qGEcW/0j
Cuhlpg1rB40Na/EGcWIBujmBXPQHbQH6K6YcMkN/e5J/e4r+9nSLIJONjM5D
fzuCWJqT+eMwMBDafPPmzbt3796xY8cHH3zws5/9LDc397SeVdJMcsiQIeLF
jz76KH2NkVW++uqrP/nJT4YPH07/VFNTk3iNyCpff/31D3VycnKy9be70Ejq
aQ8aRfN2W3F5OSua0+ApKQ5WENcK5TFJHmbHbTou9jwroMcUervNPIFenKa/
XaxX+4ZvP1/Jt5/TGPtVlJizOxFjn1cjc9TwkyzGBiYxiyGtSUm4fIg1GXyM
SFuAPlLrbz+qzxAlL0A/+/72EVfGbde9Xpfnve1vR2g9v+eS1eYZomggEPjn
f/5nn89XVlb2n//5n9Fo9DSiaD+RLEa0hnZRNK+NK5pTfX24XC+Xx1S5RFX5
98cju46zX+mhv2U6vTCyV9fpQqQbCp3K/B9K3MWmIXRRQN93tM7Yga5tWHOp
XW6126u4fGfsbxcb1hp0gzgLnwY1b1j7Vs+T9QK68jaRF6bqb7+brcVsvNVf
O473tw+P629n/u3aoo3E/vZXMva33xXf3z6sx/3tCQV09Lf334E2H6gkafMj
vCWyiIYFnuZVmormJbxQHqfKaa7IM0zekMlqQEKhM3cjQ6Hro+g74wvoxgT6
mvr69T5frm4Qt4anjsK56E2i8P72yLNq6CkWfPyP685Fen8738ybwiCuMNEg
Tutv3/zXWH1HJJCf6AvQzRZGPIe0ihzS3IQprhDvSkgjf5fav/2MRkZpxySR
Q56nk/njMDAQ2vx/OH//938/ePDg0tJS8SWRVcqyTFPH7u5uRVF++ctfRiIR
c8Xn+PHjM2fO/MUvfvHjH/948eLFp/WscuTIkeN1pk+fnrW/3gVGKm2uFc3L
y/dQbd5uK5dkuyTTyNkVr8oNPe7pdtmqaizNrVZuH+QWBXRJKHQ2hC4UeoUh
z5XYhjWzf3ucPO9wfKW7w+UQwx1OoTF2AVHmEXk2nyGaImaImAkn22LJb0Ht
dwiDuEDDODbMWDnaWzFKNCm5Ehegs7ZJbYDoc8N+84+x/vZXkvzbRWhNKKCP
SzU31Bv/9p4uQEdo7e9zyWrzDFF0zZo1ok+J8t///d979uw5jSjaTySLke17
tJ3mVJuLovmJSnnHD+3rvynbvKP2kN7HzoR5obRHqPKCyDf7XF991/r1d63f
7HfR39Kj6fTjsWI6/VPb9rXlpGpxP2Hx7D5UJwrohoW7ySBO6fLITi/bsOYJ
hH3BkLm/PSx1JxjEqbECeilRTyRtWNsUJXwOlBnEvacyg7iXWH97aKYSmMIy
ZBq6OyaG2u4KNt4eqL3Vd2qst2wUC9dHhnbvH5LSv53mwE2L/tj4JndIFvUp
EaKnJ9ygXhXnjZzc4NRn//beLEBHBDYOtPlAJUmbH+U3dcW6PXuV11uuF83b
RAe74SrMzItiM5JOU3EnhULXa+g77PajegG9mBfQc/QNa18z5yKtb8fs3/6a
Kr3MdjsG+XCNb7rsmSK5HpGcYgH63SFtNDJhw9pwT5HWe5naII71t5sGJM39
7XqJp948I2keP0+3AP3muDUTqX0ssQD9QjqZPw4DA3NPe3l5+T/90z8ZHYAi
q6QP7r333lWrVu3cufPBBx+MRqMiq1RVlSaQxvehf+qyyy6rqalBN2YGUmlz
VjS36UVzSbFJbNFtJ58rT63Ki0uPG6elzZpYQGfynCl0PoG+j35bfnFar8QW
oAvXX6253efbKeR5ff1qv28TmyHSzIWWauZCyitEeZ4oTxP5CTXyuDZD5H2I
FdCNW1C2JuNW7Ra0aqzPMtpbOspTOMJdMDw2Q7TjJq1DaUN8f/uHse0Y2u4e
vrwy7ejQHfzm01SdSb0APbF/8opYAf03GRag/ybt6FAPFDriauZzyWrz02mi
KH1+yJAhNOr+kvPTn/70nnvuOY2e9n4iQYy0tnd8uyfOBY4VzSuZBdz6vLL8
/W2aMC+OE+ZUlS9bX7osp5T9ys/qLTVCqn+9o3UrV+tUpNM/sp9Po6docecF
9EN6Ab2gzMZ2oMc2rCkOp9zhkro8Eac37PaHvIGgLxgIhP3BiDcUYfI8LHVE
2J1tG5XnsrYAvVYsQFfVQqIeJaohz/OjJDeqfk2U1UT+VJU+UCNvq+GFSuh5
toM48ITsf5Rtxuy4L9w2Mdh4V6D2dt+p8d6ysZ7CUa6jw1k+vPtmNov0zQ2O
jfqijeW8ifQ9fQnmy9exBFjsFxYjSJO03tG44pR5xcaNCQvQr4gtQP99kj1I
gjdIulvTjNEYQbgM2nzgkqTNjxFSqKqioV2zZy+PFc01Ya6r8i7DtsjpaqNH
ZI+pRLrd463T59B3Wq37vd6SpAL6aodjk+5LaepvV7l/u/KyKj2vhp9ho5E0
+Pgmy55HTP3td7LRyKbbAvXm0cgRsd5LwyBOTEfm6f5FxgJ00d++hF0emv3b
TTuA9A4fI4dM09+uyfM4I6Pk8fPey3OYDJ+Dk/njMDBImDdfunQpTRSFbZGR
VW7ZsmXcuHGTJ0/eunWrkVXSJwcPHmz+VvS3VKEjq8xAkjYPsaK5ohXN21jR
nGpzmoZ1RSSnIckTVHlljaXL2dHUUl8Ur9AjiQq9g/W36wZxHu8pJbYA3XD9
ZWUXn+97Yd5usazocKznlZf1UUOeqzF5rkoz1cg0lcrzwCTZJ/rbtS2WcWsy
2AL00WwBeskI94nhWozdq1t8xPrb+WDjp/pgY/r+9lhoNdyH0jUmmeV5D689
sRrjfJ1LWZunjKKtra3/8A//UFxcfJKza9euyy67zOl0Ior2CwlipLK6Ia6h
XbdnX/9NWU5e2Q+mirnoY9+pC/OlOaWrNtfQQx+IsywnTq1Tnc4U+glNoW/b
2xan0A+3swJ6nfLDCVv+9+WxAnqcQZzS6Va6PbLTJ7n9EW8gtl6NF9BdEVZA
76D/QDD/dqWZF9DrdIO4EqKa/du/I6wJakOUrGF5svIhkd9VpVfV8ItqaI4S
nCH7p8iehyXnvWHHPaHWO4MNE/w1432WMZ6Ske7jw3h/+81af7swiFvNqlSs
iVRE6Tf0BFjUp0SINjZgJvSOmjdgxslz/QY1Q3/7r9MbLqGA3oMDbT5QSdLm
BSYXONbQXh6bNLfFC3PuJywxVV5dU15Sekyclra61rZa3cXILNLpn2232Zg8
L9eM3I8ZCaRh4V5fv16EHWZeJBY7GsUd5t/+PPNvZ6ORT/DVPwmjkbyy03hL
wDpWX/0jDOKGuY/xAvqBmxMN4pL627UOzHfM/u3XaP7ts3iHT4KLUXJ/e7yJ
ZUye97C/vV/92yHPM5/MH4eBQYI2p0kjldgPPPDAaVNWGQwGf/7zn//Xf/1X
OBw2skqPx/OP//iPCxcupA9UVc3Nzf3pT3/a3d0tssqamhqnCUmSsvmXvGBI
pc21onld3TFJbo/IdpqARVihxCVUeXOrVajyIl2VB8N+mrPR3K2ppaFSF+wJ
Le5iUFFYuNfVHY8fP68zyfNSPqPEzNsdjjxeQF/hcOSIAEtYgNV3q6lcnstz
1QhfYRmaKuQ562/n/u36Lajob7+Fu3yM1lw+eJNSfH/7DUZ/e9vnbLCR2W8a
/u3G8krR3z4rNjpkdvaoNJonR+qNSRniqgiqPVyADv/2c3MuZW2eMoq+9dZb
48ePN7/+6quvXrJkCaJov5AgRry+wJFiW4qGdl40F5bsbMbcLMy5Es/Jb932
Q1g7h8KbdjvX5bfQs2pTTUyqC4V+PLVCZy3uvIBuWLhrO9DL7YZBnPBv7/bw
8XO/5GXj5/H+7RLfzcGyZRvPuhvjDOJYJBf+7Xs1gzhiMohTFhH5dVWar0aY
vafsmya7J0ndD7LGJxt39bTe4q8aw/3bh7uODHOy/nbu376FBWpmEPfZn1uX
8SZSUUB/VfdfMvrbjenO+5IdQn6XsAA9ZuCZbLuUribV+/72S9wgDtp8oJLg
Ksx7IGMN7TZ7AdXmddbDitrGB8zFHt4urYldcrW01VI9XlxaUFVTQQ99UMIO
E+lUsNOvMp1upJGyg8+qtzJPpIpd5dqetaPiVtDnPZi0YS03Sr7iBfTl7GKQ
rf5h/u2qxP3bw9OU4GOK/xHu366PRmoGcbcEGsay1FEsQC/TF6AfOcMC9Faj
v/39M/m3Tzmzfztf1JsUpuDffiGdhI/DgMwkk33aCwoKfvzjHx89etTIKik0
gbz77rtPc/FudGOWlJT85je/+clPfnLZZZf9+7//u9inJrLKBGBkJEjaoRbS
7dm1onlEdkSkTt7E6KZyW+juJFUeO0Gu0I0CukmhG3HV2LCWvF7NLM9pbD/q
cGzV5fk6ntfp+ysNec4C7HOsQyk0m20/9z8u+yZpMdbwbzdcPrRb0JHeiuGe
kmHu4+IKdIhm8bFND7Da/Wfv/Nur0vi3awvQrzfF1f5agI7RobM+l7I2P50q
iv76179OiI2LFi264oorEEX7heQdalWNyklzQ/sp+buD7Tl5Zdv2tQlX9j2F
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
V8Xx+FWq01OJ9FazPE9yhzO2nyfL84Zkee7zfS/keUP9mijJY5srmTyP362m
Unk+j5u3P6WGnmTbzwNT2Xo17yOS7t8edtwTbuf+7U23Bep1//ZTI7zlwz3F
Kf3bmb9Hu7j/XGFyBtb623lvkphtnKU3TxrmwIbxplFAN7brmt2HTI1Jcf7A
CXG1t84e8N5Mdc5y3hxBFfSKiRMnLuIYz2javJpp8x0/tK/XjeD2iIb27ayh
PSd+0lwUzancFqp8nVmVfxv6dHP3O59VLclp/iCnmf6WPk+/unaHJtJFGZ0q
dKPLPWWL+4btsQ1rJTXy8QrP94fqqDz/bm+Fpc5D5XlLh9h+rnS4lC6PMG83
tp+HtO3nMf/2bs1LmRnENSpsXqlamwNlBnGigL6XkO+ImkfUr4m6JjYHqr5G
5PlqeJ4SeEr2TpdcUyJdD4cd94ba7wq13MoS4+rRrGhVNIK5hewf2rXr5s78
m2gmzAK1SIM/TTaIM3l4JmwvusM02pmygJ7OwDNTyygWoGvnLOfNEW8vWJJ6
2plJu6KestmEEVyRpGnzDprptbTVJkyai/SyvqlF6HF7p8vW6aYhRTt+xTjW
OIUeV0NvbmkwFDovoHeJAjpV6IaFu9fLmu0ddm29Wn39ej5+nkeICDsruH8R
txeWxfYfKs9nKKGpSmCy7i1s7m+n8nx8sGEc728f3c/97WaTYWEQl66/PUMf
ZspCT4Y0EvK8TyfzxyEDhw4dorGLxjHzkw6HY+3atcFgkBCSn5///vvvn81n
E1yMmP8TCgR8FZaCuroCSYlba240tGvCPBCpOFUrmtjrGtvdXJi7fOxweU74
YY9tHV4q0ql4pzrdLM/9KeW51t/exfvb+fZzNn6+z1Q9rzLNnlN5vtti+cLC
qudfpqmeLyTKS0R5nsjP8AD7pBqazvrb2Xo1zb9dMvrb2QJ03t/OFqDzLZYV
Izwlw9wnhvaov/39WH97fUJ/e/Lmygmmm8/M/e0Z54ZSdFH2RwH9kpLnZ6PN
EVRBb0kWI+YFaoZJuxg231mg7TTftNup2bPzovlH66qovqZC26zKv6CqfBNT
5a9+XLzw4yJ66AN6zCJ9DRfpS79uNkbRhULP3W9atabL861722LyvJptP2fy
nPe3W+q8TXbDHY7J824mz+k/BHL89vNYf7s+uETleTvvbzc3RGnLOAg5oC1A
J8YCdL7niPl8LlClecy/3T9D9kyRnA9HOu9jcbt1QrBhvL9mDM2KWU9pgdHf
fpPR367J849N/e2vmPvb46c7jf72lKOd5g2YKfcWJXsuQZ6bztloc8TbC5mE
fzrFAjVFrYxpc7mFr+UV2jzW0B4rmge1ornXJMndsaPqJ5NCN+9Zq64pd7pb
9YZMm5Dn5Uyes357n+9QfX1uqvFzLs/VRUR9Q1/OK8bPpyuBx/l6tYe11T8d
vL+97fZgs5461ozRUkfu3+4+NtR1aIgz3r89rr892b9dWBiZc0jDZPjRuC29
cWOSw/UmnxtSr5lIu6g3tTyHyXCvD/1vftGiRZN1Lr/8cvFBaGxsXBMPfcb4
mBw8eHDOnDnJHhpm/H7/tGnTfD5f/39owQVMkk97hDW0K6kb2rWKeWObEObt
HW6aj/GjOr30EKePuPRjFul1vIwuWtxNrY8m8/bWFObtHk9Dkjzn1nDMdbOI
kAIuzz+3WFY6HOv5uCKbPY+T58x7cwFRXuDj50+r0kw18gRbr8b82x+J+bd3
TYxtsWQuH1SeMxNOb8UofYZoaIJ/O2ubZP3tf2n77PpYdDWWV+r97XVPx4dW
cfN5T3x1JsF400j/kuU5/Nv7+1Btvm3bNiOiDho0yPgsIKiCfieTNtdN2ncd
dWva/JimzY2G9k17mTc7ldVUXCcIc6rBDVX+3pqmxWua3lpZqYt0rtM/KaYi
/UOq03klXauh63PoxhA6c3E3y/PcNPK81tsYk+dqp1vt1raf8/HzFOvVtPFz
SYyfM4O4RjVWQC8lqiHPd7MCukiVyVqt0VR+V5VeUyMvMhfl4AzZ/7jseURy
3hd23BNqvTPYMMFfc4vv5Bhv6QjmFnJoKI3Vnby/3bH5BtuXfxX3qC2f6FGa
L8HUPDx5j1MsRCePII1O5bxkNkZO496ZNNHZH/7t2Q6YZ3moNq+pqTHi7dix
Y42PA+LtRU2SNhcm7YY2L5bkVk2bS07dBc5utmcXRfP6pnYuzBWPSZKL0o+e
W8YUOn2ltaktXqGzxLLL6YhNoLM16NrFoCHPbcwdrpy7w+3Qt59vZOPn6kaT
O9x7TJ6rL+vbz59Wgk8q/idk3xTm3+56UOrm/e32lP7tI5l/e/Ew93Fe3Dlo
7m+/Ibm/vdXc325YGJlnJPUmzOqHknZMmH2GRRqZbs1EZoO4RP92LEDvxUn3
ceju7j4WD31GfOno0aM0prW3tyd/mlpaWo4cOSIeu93uGTNmwEnjUiNZm/MF
lIna3CiaU3GdIMydPrXbSw+hp8Xua7X7Uor09g6vkOeWylpdnjPvoE5nB/3+
yebtYvu5x9sYL89r4uX5cd7cvkpzblc383HF1bo13GI+sShWn8/n95/P8O3n
T6iRx3WLD32GyPBvZwZxtwYbxnP/9rE+y2ju3z6CW3wM1f3bb0rp396c0r9d
5H4itKY0iEtonrzBPN742z76t591b9IlElcz1M0RVEG/0xNtvvOoe28RM4IT
Du0538Ya2jfuDa/YpDW0r93B6uAJwpxK8uV5QeOs+CbIdPraJiHSF5pEOhX1
WgGdK3SxEp0q9DVMnpfQn7uBbViT6Jsx5Dl9k2Vcngt3uAoqz7l5O5fnpNNN
ujyaO5yx/dwfCpjGz118vVoHTdElpY35tyuNegFd929XhX/7HkJ2ELKNuX3S
kK58TuRlRHpfjbyphhcooXlsBzEbUHpEcj0Q6bg31HZPsPGOQM1tvpO3eEvH
uE+M5P7tPFZ/q3c6rdP92z/8kxg/b0zwb58xWB8/vyqxOGVOfWnem1yZio2f
p0l6e+Xf/sszxeFsh80+nwx1c8Tbi5p02rzOSvO3nR5vpa7NOw1tHt/QrhXN
WSu7XisXdZ9Y6YdnmKb0UhUvsybNoWst7noBXV+D3sUbMkt1eX7UtP1cyPNN
fPxcbD//TC/xvMn9i14gzB3uaSX0pBJ4gq1X806S3A/x1FFUdozRyPGBWr76
59RI3nvJvYV72N/+kam//VXNvpLtf9QCVPz4+b1pYpT5FjGpz8eURqa/Szxj
vII8TzqZPw7JdHV10WBVU1MT0BHP02f8fj8NZTNnznQ6nYSQ3NzcpUuX9uNH
FVwUpNLmdknpiMisob3b1W4Mm9Mw6g1KJmEuM2HupYdp88MFloRTUlFfbXXU
WB1MrfNYSuV5xak6Ic8dXS6zebvYrSbM28Px8rzddlLI8zrrkaTqeTGvnpvl
+SbeDGnI8/d1ec772+XneH/7bFWaoUaM9Wpaf7tmwikWoLfeFmziTUrVY30n
R3vLRnmKRrgLhp+pv51PD2mXn39I8G/XZhsTVmOI6ozRmDQklfFmimvPRONN
La72fDVGDwrol0Jc7UNPe8qgKiLqaZ4fIqiCdKTQ5lamzYuqYwvUDJN2oc0N
h3ZzQzuV1WvTCPNPc4PL6NnCDn1Mj9DpH3/dRXX6WysqtUp6GoX+2eaW1bo8
//TL0vyDrp1H3Otyy9bnlX21tWz3kfaU5u1st5qTdLjULg/950Bx6vLcGzQW
Hvni16s5JLZerVVRmnT/9iqx54ioBYQcImQfIbsI+ZbbiXCnJmU5kT9QpbfV
yEI1/LwSeloJ0iT5Mcn9AHMOsd0TbL4zYJ3gr7rFWzHGUzyS+7cPYf3tNBn+
5gbHRt0gbnnC+Pl1or/d+nT8io374pcLm0J0rMHJuEG9Nr09SEIBPV1TU8Zo
PGCCcB962hFvLwrSaPOqOusBkza308++09VKxbIYNg9Qbc6L5o4uJ1fWZZ5A
TJjT9JLXfdQWm7ekwmrkljSxjFfoTKTbOj0VlbVCodeLFvcUE+hssWO7TVuv
Vmfd5/UW0bcaL8/NMzXLiLqEqG+zDkyZJpDzVOlpNfykab3aQ3H97aKy03hL
wMpX/6Tqb6cRqYv3t6fwb8/c3x5rwtQL6Jn72288U397kjxPNYyDJswencwf
h2Q2b948OR5Jkujzc+bMsVgs9MHu3btffPHFefPmLVy4sKOjo18/rL2ju7v7
aM8wm9yCsySzNk8YNhfd7GzGnAlzmUdOpdujVlnth49ZDh2zFJfX03OIP6aH
PhkXTvk9p5DnNAib5bkwby+Ombe7I7JLogpdVM899WK3ms1eapo9P6mq5cLp
1+fbFZPnNK4SVj2PMnn+CQ+ti/jlZ2z8nG8/n8kWZGj97Y/q/e3sFjSi3YJy
/3bW3z6G97eLHRkZ/dt72t8+yOTskdDffmXCXoy4a8+4/snEDDBTYxJCa5rT
B22eMqgaEfX0hRRUaahERL2gSKnNS2v15ebxC9S+2FJjDJsnN7Sv4cL88/yQ
EObvGcJ8S3DpZtPZwg6T6rkxqU5fnK6GvmhlCZXnX+10frapeil3h8s/4NpX
xLafr+fj54dK3KVJ8lysPme71Vyqbt4uu/2SJxCJucMlrlfr5OvV2rl/u+hv
r9IM4oixAH0P7283OzV9SJR3ifQq72+fowRnyr7HJfcjUvf9NG6H2u4INt7m
r73Fd2q0t4yPIx0e2r13iKm//S9x/e2LuENyiv52U4i+K6m/fejvTt4c39+u
y/PUtkvpNhb1pr89RSjOdvDsw+mDNr+I4u2lTCptfjJem7dFqDaXOlvaapKH
zeubWvWG9ph/kaj7dHnUknLroWMVNKUs4umlSCxpSilEut6fqYoaum7wXm20
uFOFzlvcj7Uwec76dtzemjrrIbH9XLjD+bw/WCrWWSpWO+zCvF2kkWJnxIe6
O9wrqvQCtxcW69WmxFLHWGUn5t8eqBvNVv+w/vYRniLdv/1gT/zbeQemKPGk
829/LN6/ncnz38f824cluWT8sa/+7ZlNhvu8Xu3ijGDpTuaPQ9+IRqNGPT2L
0Pxw67/9n4P//t+ZD30NTSaz/WYHDknaXJIVh6R00twpLLlo/OTavFEMmwtj
drefC3Nxq+lRqDAXYbOxzdfhIsahv62sddCjh9OKaqudDyQqwkqOfjcmz1OZ
txvyXHeH6/B4rMy5vZw5t/M2yPhBRfWIz7fTYvmMynOfbxPfWflllKzms+fL
uN8vX32uvkpULs+VZ/Tt5zOUEFuvpvgnyd6H9QI6vwU1mpQadP/2k3yGqEj3
b9+n+7d/w/zb7V/9Na496YMk//aE/nbDv52Pn2ubK3vi327un+zVAvR+Hx3K
djw8+3OWPu3puBCCand399p/+cUZIyo969evz+5bvXRIFiMVSdpcW6CmG8Ft
Mw2br813Um2+ZE2VuWgeVzHnwvyTTcGP+flEnM2xI9Q6fSWV529qNXTmF/ch
VejfaQp90cpiKs9z92v+7VSebzvgMrvD/VDsLtF3q5nleWunKnarcfN22eml
8lz2GO5wfPw81Xo1u6IK/3arHtXLRU+UXkDfwcbP1Q0xI2V1Ea9kzVcjc5Xg
bNn3hOSeHOl+KNLxN9b11DKe7cSs5kuHi4Yz//YDQ7h/O8+Ev+J9pJ9dr9l4
pvRvnxHv337PmfzbzePn6fzb+2MB+sVuEHeWPu3puBDi7SXO2LFjJ0+ebGz8
0ZebV/Hl5jv5cvMkbR7n0M60OVXWHn3AXAxLioq5UOU0pXQ4icgqteqPXvep
YaUfTaHbOjwFRWVaAb2pRW/OFBPox0pKjzhdTRHZJsmtQp7Td2hn/e3lXl2e
11tziLrNNCO5nDVhKouJ/DaRX1UlGnbmqeGnePaorVeTtdU/unNR223BlvHB
xrEBq/BvZ6sePcUj3MeHu44MS9ffblurDUia/dtZAf01PYc0mjCfHGRyMYql
kbEtvaOSjIwMl4yEAvpVKfow07pZ9uRGsVdpZLYjUn+dhI9Df2WSFwJCm5f/
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
zYmmzT3kcAGT2x0uIoR5fEoZV/oROt3Un2mvttqcPq0GpHvEcQt3Nn6uu8Mx
8/ZumvHa7OVmea7G5Plqv29rlC2MoMnk+mjMHe4dPiBJE8hnmTtcZJYSmsE3
R0xm69WM/nZR2dH92/3Cv/3kqP72bx+cyb/dbGKZ4N9uukiEf/tZnoQPzkDK
JKHN+5eEoNrDiJpBmx8vKisoLDf5ZyrNNk1r67eaPE7qqrytk53WTpan0SOc
ggx5XqXLc+uZ5LnYrRaWnGZ5zgro3Lydy3Ph3F6hy/MjVJ6fTJTn67jr5vLY
bjXVMG9/gd9/zuHr1aarkalqon/73+JcPlL6tx8emtjfbvZvX3om//Zpemh9
UC+g3xFvDpxuATqX55YzxtXz472Z7fDYhwNtDm3eL/Qw3mbQ5vvN2vxE5Osd
sQVqQptvMGnz1dtFQ3vR4rVxRfOPeMXc0OPGWfxl3Hmfi/SUCl0Mob/7WdXK
3O53ljN3uBWbWjbtDefuDwt3OCHPN2yvNeS5cG4Xe88LqDxvV5s0ea7tVqNp
Nq9kKcIdzhsU69WC5vVqEebfTv/psXP/9hbu325s5aB5fhFRzfI8P8raTYV/
+6eaf3t4oRp6Xgk+zZYc+SfJ7gcjXffG/Nsrx3vLx3qKuH/7DzezXRvMv50X
0NdrBXTW5rRYv0Tl/u31yf7txgZMoziV4N+ebBDXkwXol4Z/O7T5RURTU9M7
77wza9YsI6z5/f5nnnmmtbVVVdWNGzeuXr3aeHEabV6dTpsHU2pzv6bNu72k
yspK4WxYktd9eMVHyypjJ0mtn6xx/MAzTF4DsokWTVZAb2w3dqAb7nDG9nNZ
6cwoz6k2z49qLka6O5z6Li/xzGftl2I6MjRTCUyT/VP09Wr3a5Udm6js3BYb
jTw1ymsZ4S0d/v/Yew/uqI5s/ftzzFd477zvnTWefCc5gsnOaWY8HtsYgwFj
gjFgG+MANtnkaHJOJomcQaDc3crdSq3Qrdw5nXOYt2rvqjp1QrcaITCSu9ZZ
XkIjUOv/v721f7Wf/TwByb+ddo95XH5JipLQt2/W/dubZP/2T6UdySnGBZx/
pBmgo4llmpgJpsO0rVTW9fP7HqAPMTw3vXeGUieZY/MBPKaimn1FvQc2DyhV
bh9smvuY3AiovMVI5V58/BzPO9XyGt+17PDcFH2eBs8vBqm4nbVw4CB0R8Lz
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
hfIEnkuL53tgek7xnAerrZHw/DsDnqufUoWSiFejIqUPlBh3+Qi9lep9U0qx
fInegjaOi9SNCdfCDpFzuH4FKunb/bJ/u7w91Je+Xb/5fMkonjSZA1vqqj2e
p8vFGAiDuEeB0HNsTp7Dhw+nq6j/NRZP8gU7duyIRqMawZsTJ5YvX279vumK
cO78937Y/DJl840HvYs3Fq/d10TYnMWobaQxaozND3A239oxA9l8u87mXwCb
i6G5TuVrw3OMD8VzELd/YYfni37oQFO4ldyzfcOhLvKSyAtbtYsp2zHxHBbP
k1dKkodO1+4+Vnb0HKSqVZut4Zy1HM/1MZbGs9U0iud0gE6z1QJhtn4eivUZ
r9aiqF7VEK+Gt7IiXu00xB7tBVPlDVDeF2upr9Tkp2piphKbqoQnpgLvJrvf
pPp234vUv50U7eqRIerf/kxP/tOkXFM7ppP8KnUnFOr1ko3n16hv5/MpkV4k
hws/Z0nAfNy4f/R7u71OK57bdrzZGcTl2Dx37v/84he/OH78eFqfdonNvS01
hM1JeynYPMzYvNTI5qzDJO1li42m3TA3x6G502P3uBWHGyC9DzxXCko81245
ihzuzkCyto50vCUEz5kvXLWzmCnb2xOptmSqGfHcSUPPq9Lg+Zm72sm7dF/y
AHgZkX7S6A6niPTzj9XEDCle7V1DvFoHrJ+3vgDxamMi9SOpf3sV928veoYO
d7LUt5v923/P/NuhQDH/dmmAjlMes3+7cQ3HZTUykpOAMvsMZ+ghs8Pzn3A9
52fF5lVVx+AXaKano+PyqVOnRCdp+09VVVV99NFHBL3xj1evXiUMbjWCI6ex
sXHVqlVr1qzxeDxTpkwRf+Xnc7CiGjPU7pfNbfbNrWxeZ6il5I+Yf1HjJXge
PGvEcxGsRh4Qt6cYnhchnseEKRwfnTMLX7f7jog7V5hHkMuobGeL5y7XxhD1
hTtmh+ebYGNI4Lkwb//agOcQr6alQN9O/dsnKpEJ6PKB/u0Ji397uHZ0uEry
b883+bf/La1/+2LuDGzxb6fiSdm//YU0BnF/MeZimA2IjP7tti7BQ8K/fWiz
+Y0b2/qsqOTJwOYZiif5yokTJ+J2ufWYinDu4CEwItfb/6Zn87O3EwRv1+4q
tbL5OsLmIkZtVRGLOD8IMWr7osv3RJbujhCIJii9CDTtOptzQTsOzWUw/2RN
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
zz//fOPGjaTbfJg/7yNyHgSbM017vkewucmyw3q9acJz6twO+vY7ZT4Zz+u8
wWt08dxV7fGRV+JpaLtNR+e1MEBho3OC52J0nky1JxWf251PR+eBSki/5XHn
VNmOi+fUFy4UOuOiieeb2/37OJ4fhlq61273fJWE59/x9HMcoEO8GnXg5Pr2
JNyCMv/2/5j922m82rho/eiIeyTVt7ueDZRCnC71b3/S4N9+yOTf/qes/Nv/
I5VWPp0xiyfl9s907TnUDeJybJ6OzdMVz/Pnz5MaO3v2bILe7e3t+MWiolqL
cO7IJwObX07P5seMbL4S2dxk1W6MUUM7uI+XUju4r3+g+ebp2Hz6snYE82lL
/DO/D036pp58TGh9zhqwhltvwPP5fHS+8IcOZgp3OEpeAHkZi7dU4eh81c5q
8lKPXI7vPO7Vle2FySvcF+7IWbp4LmzbScG/CHhO+mR3s2rFc/IrRrjDdTI8
V+X0c3n93KhvJ7/L/ATP7eLVSi14/iP4t++CznmtllquJRepiflq/BMl9pES
nZQKvZPs/Xei6w0qfPK+GKl7Llw9JuQaSRM37jwN+vYnUN/uP/g32glvo20w
lTlhD/wNv0SlGqffoj1yJvOlYeknU+nGUnLTm9kP+SeKV8ux+VA998nmpMMk
COxpbEU2J+/xKg9dY6yo8RnY3Kez+WVgc6ppl7tKt1JqZPPCqlRBZaqgIoU1
R9hRCpsjzFa7kk/aW4XgOV08L/WQPrPK3Ybrk7ALXwIXgGEcnTe31KIyU1H9
bb4yjuf5zHkSrv6MeH5aCgPao6nbocigebtwh1sA25GfaOoMTf1QS1FjYSWG
6+dyvBrVt0O82gvRhucinrFSvJo03BHd42nZv/0vTN++WfJvl0Y8ooek+Y9T
JRHmvzMGoD9xLwHo/+/QDEDP/HYY1Of+2fy/YO9mTfbJfFRVTSQS9/3yB+sZ
QDZvtt83z8jmUD+xYOqKIxnPm5Sr+R4qbr/jaQI7TcRz8t1rPP7esGYYncfY
6LxJH513JFO+3oCbsLnDcUHK1jEtnqMvHMPzcOioBc93gRgJ8Xw9x/OV0vo5
6ttN8Wqz1CTq28G/Pf6eEn03FRbr56/T9XMRr9bI4tVCrhHB0uGBwmG9+c/0
kH7vslHffgD92/+i69uXp9e3f/BYzYRf17xjHKA/zwPQ0dZDBKDL7d+9+rcP
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
c2z+IE5GNs80N7eyudUOTpa1U9cOKd+8TDKCKwD1kXDtOH21ddfRst3H2HPs
XC3dSXSnyusAz/Pd5J8tdvlQdETqNnkZTW2B2rqW/IJSZ0VNCJTtjd56ULbf
Js2YULanFB+NO3fSuHM1o7KdNGZ+/xGXazPBczvb9t3MGk5DPBfucFY8X2gY
oCto8cHj1RLWeDWjf7t3XLRhTMQzKlxNaixkZBQ9Qy0+qL79iT717Rn827G0
smgMMUC3iietAej9qav3uDr0EEtrjs1zbP4wT7/Z/OgVZtW+/QSPOOdW7V+u
LtLt4OxWzqms3W7lXMzNJ8wvnyHYfJkZzwWh/2cOHaDPXNFOle0E89ezPLVF
P3SYRufrD3Wt2duk56lJo/Njl3uEZzsq21niuYTnpNQXVVI8J31yfpkFz/Vs
Nc3XrenucHbxasb1cxGv1s2VqNZ4NdS3m/D8OB2ga3yArqzUUt+pyS/VxDw1
NlOJTlbC76UC/0l2/5OU7ljLS9GG5yO1Y0MVo4Jlz4K+/SnQtz/ecYL7t+/g
/u0r/0R74EWgIP2ch2BSjZNUosVwyja6yOq8ZFWN/tJoEGdblvsXr3aPRTjH
5kP13B+bR8n7VEScp2Nz08r55Vt05by0OlAlsXkZ17QLNqdD80Nl24DN6XO4
7MDpWlJ5LtzppXjuYhbuaHxB/hFadi467jh8DaBsr/OG0LO9qa232deTX1hy
u7DE19kRjoV1ZXuPNwGLk+RnTCle8vM6nGe4L5w9nod1PD9uh+foDrcMekgp
/ZzGq03VUh/Q3B/aN+rr50kerxan8WrPRxufi9SNDddC9E85eAuXPCPMi7ov
P9F1PpO+vXmNIaJXjHhY/uOHUKDk9fN0AehP9hUzIQY96e4S+6xXj8aOZOa3
w6A+OTb/Sc6DYHN55dwkaxeOmoS1cW5eKLH55cLeI2drKZKTHvVM7aG8Wgrp
R8vyrreKyllSFci76EBfOPIdPU1BwHNHZyBJ2Jw8ngZvKBqNcGV7U7NbVrYT
PHd7bhM856PztMp2Tbvi9x9GPNcMvnAynm+H9fPNRvP27y3p5yJeDfzbU58Y
4tXiE8G/HeLVgtL6OS2zzOVD8m9/lvm333i6+4q0QCT5t7duZXMZk397vdW/
3WQQJwLQhxunM6YA9N8YczHSzWgGdICetq7eX2nNsXmOzR/muSc233aYzpoP
ne/5UWLzHSdYxDlatdvbwVlSzm1WzsEObsby9nf4vrnO5nZ4Tp6JX0P0+YLy
eWAKZ8pT+34//e7fbKhcsCrd6LwaTeHO0tF54jIo209eaSEFn5T9AineyIzn
pW0eDFZrpW15k8m8vUv1G9LPFZieKxCvlj79nF3YYrxaszFejfw6KFPVQk29
pakGPAcB6k5N2aylVqvJpWriGzX+uRKdrUSmKeGJqdDbyd5/UX17y6vRhpci
tc+HKsYGy0YFCp/tuUX926m+/fTj7cf+7scozB/+3IL69mW8Ss//fd2839VZ
/dv/KUVsiOGU7N+eLgA9Q9ObYSD1wPzbc2w+VM+Aszl5I3cGFJMdXLO0cm6w
g+ONpZibow5TsPm+k7V5N3qPXmiRIX3H4TIC6aQEEUIn9acEJJrXC9tOwuK5
yx0kpQY928lrKHa4uwLJsooawuauyqpQNEKV7cKzPdmJeJ5SWsTiuY/5wsnK
zDt1dYcQz+9qF+9q5yAS6Li0NYnm7cIdbrmUfv4ZrEbO1JRpEK/G+kYlfbxa
VHcuejboGs7928G8qE99u6TAlP3baQ+J/u1YoGQHy1elNclR/1v5rF0bmeWg
h1Qq+zXJR1TfnvntMKhPjs1/ktNPNg8yNq+s9RnYXJK1Fzl9csq5hc0Vnc3h
hvMwUDmBcfIQKr9elrxWRnWPO4/Q6XmBJG7PL2kTtu3kmxaWerByett6CZuj
sp2ZwlmU7SkFlO3Oy3ajc7OyneB5Xd1ugud1ddth8VzG831GPJez1Wz17ThA
X9BHvFrEWGaFy0fT2Ej96EjtyFDliKDz2UDJsN6CZ2i/d03Wt/89s769wVbf
Lpw9cDpD8Pw5SZgk6qppgC5iK7MMQH9UV4dybJ5j84d5BoDNTwKb7wA2l+zg
Vu/rNK6cG5LUFmzowJXzBfLKOcSoYYaazOYf8sfK6eNh/Xzm8nY0haN5amAK
98W6hhUwOl+5p9O0dS4M2/ef6167s5T8RMcu9QjP9mulycN88Rw3mIQ7Uzlk
Gwk8d0t4LmercXc4Gc/F9FzEq7H1czn9PMH07e08Xq3JEq9WAle16A53TtNO
aVQ9dZCuNdHl0LVaarmaXKQmvlDjc5TYdKpvD7+b6n0z2fVG3PdqzPtSpO75
cPXYkGtUoORZeqEq/NuPQ63e89fW7X+hhXqNtH6+gF+iwnxK92+XwoVNJdom
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
k751jqPzK+bROZrCXYNINYbnYvGcK9sZnl9Ii+dytpovDZ7z9PM4mIWK9HOB
58IvFNPPRbxaDY9XK4GOGn8jXNS005p2VFP3aep28G5aBeKor0nPrCZnU317
eHIqMCHZ/Xai419U306FT2MinhGhSip5ohtJN57uuvRk55knwL/9b1TptA0K
Nd6jcoO4us9/55kD/u1oEoLdrxigv8Ccl/Qb1CeliI0/2uUWyQP0dJbIfbot
9ZfQc2w+6M7du3c1Tevzy7LXtCcsbB6JGSPO6bsVIs6FHZzDg7uTmVbOG3hj
WcMchpHNxdyc9pOFtOaQ0mp6Tl7tQTy/5UwWVLD1yetc2V7oJHguDYCYsr3k
TlEJXvRJpnDNxjLSjHju890xijPR1yg/jbj9mJSttgMMhzca188xXu0z2j2m
PqbORYkP1fhkNSbHq7G+Ude3e8dBvNpIGq9WPZzq28u4vv2mjX+7P1t9+++Y
vn2apPB5y9hGjkvjM2zVt/9GMjIaVP7tmd8Og/rk2HzATzZFtT+adiubSyvn
6UbnpKGq8epsLquPGJsfLTuYV2sA80JaNgme4+ic4Dn5MlnZTmrymUuOc5dl
ZbuzytNaW99KXq2rsiYci5Oybzc67wgE6xzOy7amcJKyHRfPr8Pi+Z5y1+b6
uh1GPE8nbpfN28X6+Qrj+jnGq30G+vZPNIWnnycnq4lJCiuz75Ayy3RKnbK+
/bkIdfkAfXvF8KBjGM3IQIuPK0/a69ulXN2mvvTtNVZzYKvx5l/S4Hn2dTVz
ab2fAXqOzXNs/tBPNvX2njTtjM1Pmtl8yabixZzN0Q7u203SyjlPUsssa2dJ
apzNJ3A2x7k54fEpnMenLA5N5g+BdPIFuHXO8tTAFO6LDR3kW8z4tnDF3ogY
nX8pRueb+Oj8Mh2dY54a+enQFM5G2V5pULYTPK/MAs+N5u1aO8HzXk02b2f6
9qicfh4R6+eyJwnEqzUb49Vc8GbBO1vyG+ES6aWZvl3dpeH6Oe2cF2mpL9Tk
HDUxXYlOSYXeT/a+k6D69tfibS9Gm8ZFPKPDVSB5KgLDEFKuzz1B/dsP06tU
qnTa/Gd2j7qM69vn2+nbcTglHELGGPHcNJmy2i71kSmcRbvbL317js0H1yE1
bf369Xl5eeIz5JfFx/ysXq3//+ZAsnmEsHkK2Rzt4MijZ/WKlXNJ1i5WzkWM
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
93+yr7f3w+ZHZDbfxNlcsoMTK+csSc1W1r4NZO1bwK19o0HWTlfOV7CV86nG
uTkFc2Bz8gFVthNs/9b/nzl02j712/pP17PFczSFW7iVjs5XZzk6Z6ZwtOZf
tXi2l4D5p8DzCgnPL910u5sVguceE577TXiu+XvUdoLnvWqXIf08ZU0/j+np
55Z4NUWOV0P/9gLJHe60pv2o0d8C5FfANlrwle+15GI18ZUa/1SJzVKiU5Xw
hFTwP1T+1P56rOXlaMMLkdpxoYrRwbIRgcJhPbee6roM/fDJv7fjLhLphLdA
0Ia0fs4aYNnD0xSx8TzXOInWF+vzn8UKErtBtbcHMQ3Q0+lFM1bjDEU4x+aD
7shlraen5/33358/f/6sWbOmTJlSVVUlvuz+2TwUjRPUJY+JzY0r55pdkpoT
k9TEyrlYlkSr9u2H6UD8EvgXYVd56hYdl5+4kTh+PU6q67FrcQLp5POHzjE8
v3inl/x1TDzHSLUr+e5GnyIGQE1tgZ5Q6k5RGXnBdHQOpnAGZbuCTaZPob5w
zaBsNy2eC2sjOgByuXZaxO0m83Z0h9sK+hzEc7F+voCtnyuzjMJL0/q5iFd7
gcerjY64Sev4bH/07Wvt9O2f6vp25t8+XvJvt9W3294i2vhYWvTtNmqf/0nb
Qz7gKY/pXTOUOskcmw/4EUU1+4qaJZtTq/aAWgL3mQ0tQYnNNcPWOeI5jM4J
m1/N9xgc4TyScUdFCr3gzuX3oqZdzM2RzdE1CPF8txHPK3mk2vUCD/mmVNme
77xx21lb7yOvmTxoCsdG5y2ehDQ6J5XT7b4NyvabilrPuy+2FmS7eN5O8RwX
z0XxRO+OgxKe7+J4LtzhTOvnmePVYP08hevnU9SkwHNjvBro22mZ9T4XbcBb
UPAaovr2ZzLp23dK9pt96tvHW5w9ZPchrKu2+nZb/aTtkuNPF4CeY/Mcmw/U
yabe9pvNjwk2v0jYvJqw+br9Tcyq/VTshxOxL1cXExDeeDSKK+drDjJZ+wpZ
1r6sYuG2CDjCwaTbJGufQ2XtH61gc3MrmL+/kI3O0RTOiuefrdNH5/LW+XYx
Ot+pj853nvDKo3NS3mXPdoLnV4t7hbId8byc4/nFG24Tnte10v3TBp8pW820
fq7K6+eBMMVzef1cTj/n8Wps/dyob69Ko28/Za9vT36mJj5WYx8qkYmp4LvJ
nn+Dvv0lrm8fFXI9C/p27t+eQd/+TXp9+7+4N7K8gpRO357BdulB6ttzbD7o
jszmfr9/x44d0WhU0zTyW2P58uXiyx4Am6com3M7OCrRhD7TnKTmDhpk7XV6
BpCwg0Or9tM3ei9AXcWhOQFzrKtHr9AICQLpp27SnnP3cR6p5jJHqrlqAwTP
cQB0I9/ZHVI8ja046xf3ezA6v93dQ0fn0GSySLVAsIr8v4PDuHgu43kodFHg
+V3z7rkwbxfucJuM7nCob8f189laaqaamKbGpygsXs3aN74cbzPGq1H/9mFB
17CA7t9u0bcfsfi36/p2O/922wG68Qqx8lkbE8ty2b89ex3mT2oybHrXDKVO
MsfmA35EUc2+ot4bmzsFm2s2bG70bMesc2dtsMYUdA5u7WJ0fhBa00smNpea
t7P5zBfu6LlaTLtwAZ7nXXSQf7+yLki+dXmN/3q+q8RZ5yh3k5eNceftXdSw
vbj0TldPK1ctUjYPBDxU2e64SIqnYvBslxfP78iJ53V1u10GX7jj3LZd4Pke
jue6O9xdhue4fo76dnmA/q0Zz1Vwh6MiJcRzTD+X4tVQp0T921+MeZ+PNoyL
eMbo/u1QYzP5t2etb9dXh97g6+fj7PzbxbXnHy111Xrt+Wj4t+fYPMfmA3Wy
qbcDwuYbD3rNbC7s4PZ36klqkqx9qZC1Wxzh5q23kbUzOzhJzU7AfMLC0PvS
6Jwg/JTvGJ6jL9wXm8KzFrPR+Qq70Tk1bD9JR+ekGSY/1JZD1BSOj87Nyvaj
Z2tR2U7wvNQOz0/Z4nka83bJHU7rDmoGd7iI0R0O1s9jEp5b4tU8fPjl4Je3
t3gAep6mkTZmv6bu0Gj/vBrK+zea8rmWnK3GP6L69uCEZM9/Ep3/jPtfjbU+
T/eS3KMk//anwL8dxE6H/kY7YVv/9s/Qv/23mfzbR0ut7xNSALow8JT73v/N
6N+eTi+avZYpx+aP5GloaNhuPOQz8heYNO3ihMPhiRMnhkIh/OOoUaPG80Oa
+QFkc2EHB7bDmlg515PUJFk77kuWGlfOkc2prL0weZ6w+W3K5idhaH6M7wqR
Dwit5xFm557ttpFq9a1Kk18pKPEQPK/2tPWGVWdlLUS/eU3KdrQ2wtKRUlpT
iretrZiwuVtXtssDIGoyKfDc7z8KxUTG8yMSnqM7HOK57A4H9sLKp1pqDsSr
TafxatHJSmSiEobcH6pv/6dpL5IKLxtHR+pHRNzDw1V9+Lcb5jtU3/5ng76d
Xh7+oR57SDCIc2PAxBTJIE5uI8fyAPThdimQaQPQLW1kOrXPQwxAN707hlIn
Sd7OFZX5itqR+fG3V+fYHE//iqqpoj722GOioh4/frz/bN5N2dwga+dsjovn
KGu/mu+xDTrH0TlGnOPoHG84SakkVZSxOVoGge6RfBlp3vKut14v6UXLjpKq
AOJ5FfVsVwvL6m7k0+KJeWptHV2haKSiuhzy1JwJ0XTBUmFrm4OwuduNynbT
4rlJ2U4j1QSe19Xt0My+cCY8T+cOJ+vbZYO4b4zxarM0dbqmIp7z9HOK53K8
2uukx4u3vhzzvkjj1erGhtHlo/zZoIPvEOEVKOrbT8j6du7fvuZPXrE9RC8/
f8fMPWZSfbvb6t/+onTzKTt7pAtAl/2BH6UA9KHN5teu56Wosq6PJ8fm2ZwB
qbevvfaaqLeYpHYPbH4lazZPJ2vnjnBfWRzhhKxdrJyLffNJ3zE2f++b4IRv
pNH5MvqVUxf7yV98B6bn1Pt9bfu0bwrJN1q2J0JvBnDrfE3xxsNdLOt8Z/UB
GJ0fvRo/eJ4p289YKrysbDfhOYrbiysDGHqOeO5Og+cG83YerybwnKWfR0T6
ecywfp7oxfTzBP1NwXpsHq9WxxtsJ/8FgZe3lyGq+EdNO6CpOzVq37QGyvtC
WtVTn6jxmUrkw1RwYrLn3UTnv+P+N2KtL1H/9ga6lER9mYqGgX/7U9S//eTj
tFajf/sWq0EcNMA4n5piN0B/ztL6yhEbf8iYWyTwfEAD0HNs/qgd8msi33jI
Z+QvkMua1+u9efMmftzb2zt58mRhptHfuXmIsnkc2DxmYHMbO7iWIPaZIkkN
Ze3I5ujWzlbOuawdV85vOqisnbA56SqZpv0mm5sfhaIqxDzHxeI5+MLtOFx2
6irNBiJN5nm4DLzjaGv0KbV8d7LFH2xtD+DLFsp2NIVrRlM43ViyheC523ON
4DlXtgtrI12fCXi+w+Xajnh+Vzsv7Z7LzsO27nDfsvRzal40R3cuin9Ac38i
46X1c2O8WvO4aBPB85ERN8SrVQzrW9++P42+HUc8X0n6dgyYIHguXIzAIK5K
zpgYyUU+wmfYun5uHfRkbiMfkAgzx+Y5Nu/rZF9Us6+o2bB5T0Y2b+u0x3Pm
CAejc7F1Lvtqmtgcu9M8UB+xnAtpev7jpRYxPccwSvJPkeJMle13POQ71jWF
yGsjeF7mchM8d1bUBKNR0+icz0So6Mjtzid43uYrgdG58GxPG6kWCp12uba4
qG37PqMvnJie7zPiObrDyfp2W//274zxanM1dbZIP6cuHwl0hzPGq6EPp+/l
WMuL0abnJJcPCOvBGnvrSYO+/Rjz92jd+ZeWNPr2OoO+3WgOrK+fC+NNsd5o
vPa02Rt6hPA8x+Y5Ns/yDEi9va+5uYXN5Rg1eeXcXta+tQNH51zWDqPzjWZH
uKkwOtfZXJqbI5vrynbwbCd4PgkTz+cWTPuufv6m8MzFFR8tLJy/rkEenS/e
UiVG5zv46PzYtfgWKU+NxZ0X09H5ySstsmc79YXj4nYXTs8b6H0s4nl+aVtt
Bjy3MW/n6echrm8X6+dRff08qq+fY/q5iFdr4fFqqG/HK1yUV4kN9FOadkTT
9moqrJ/TIr9YU77SUp+qyVlU3x6elAqMT3a/leh4A0r3c9GGMdTVs3w4tfTU
9e2PM337Llqo8R5VGMTRKv0pzxdmHp5c4yQ7hIzS8dxcojPU51+ml4z2F899
K3NsPsiOzOakmk2ZMqW7u1sj/8d95MjatWvFl90/m4djcVcldVdr6+gVbI4r
51UeH0/sZQMgDOpFt3aUtV++5cahj8sia8fROWHtUzd6UdNOjdn50PwgFFX0
wSCVljD7KZgHHT7XvO0g4PkVukF52xk4cR5N4YKkqriq6UsqdXrIi6SpQPam
cCzuHGwrDMp2n++2ZG0knIdpk+n3n5TxXGPWcHL0+QGjO5x1/fxLKtRR5uJq
pGH9HGyLoG/8h4hXY7k/TWMj9bh+PiJUOTzoGhbM4N9+JIN/u1HfPofr27FA
TbC1yPiVrm83xgCZYib61rdnn9I7oDuSpnfNUOokc2w+4EcU1ewr6j2xORbM
ylofsjnK2nVle6dZ2S5G53TrHLLOhbK9FHw1LxfSgfjB07Uym4sASlItMVLt
Avf1xd3zq0W9iOekW7uMeF7gId+3oLTuWr6z2OEuLa/NJ39o8Iai0UZvPY7O
YSDSzSunnynbqWd7lWqjbDd7tpMGzO8/Aqlqm4y+cELcfoDjuWTeztzh0g3Q
ZTy3XT+fRtfPE5MM8WpWnRKLV4MUy6pnQ67hgdJhvYXP2Ojbs/Zvd1v17fLN
J+K5bLwp6uofBtS/faBLa47Nc2w+UCebejsgbL7jRDch3JU7qiibg1U72sGx
lfNjUZGkJtza+3aEWxeesqheHp3jyrnQtE8ANqd4vpCZwmGkmixuf2degXl0
LrbO1xRvONy1dl/Tdxv1rXPT6FyYwlFle1nycF4tYfOj52oNeG70haN4fiF7
PGcDdI7nYv1cd4fT18/j8vp5gOvb0aWEttkEz6V4tQr+a8JqEHdQ03gAurJc
Sy1Sk1+oiTlU3x79IBV6L9n7VqLrH4n2V+jNasNz4doxoYqRoG9/2qRvZ/7t
qG9fSXtgUqWpghQbYNS3c41T9Zu/FuZLeokeln4ylU41+j9p/Nv7pW/Psfmg
OyY50Pnz5+fNmzd79uwFCxa0t7eLzw8om/cEwjZ2cMjm+sq5lKSGo/PS6oDe
UnJZO47OT1ymKed7T9SeL2Ca9hPXE8jmpKLuvyCPzuMnb1LFJuk2D3E8v1RI
vS/OXv3/2Tvv76aSbN//Hf37W+utu968efdeJt15b3rmdiLTxKahZzo3GZOD
Tc4ZTGwwySZjE01wABuck7AtyVGSc5CclWXpSPSrXXWqTp0g2WAbGtq1tHoZ
47El1mh7f2t/9+drRvIcNZnoh6InkJ1vzC00tlgdvc5AYUlZoa7U1tXt8rpJ
3HkpgcKJrhsS+gCj83brCxKpRhfPefKw2GTK5flTTp4zfzuDtyfgljJO6W8X
doYEEq+2DreOivRzrXg1xm83T3bV4Hg14LePjcxvB3/7Fc7fzjswI/Dbf1Ly
26sV/PaPB8lvH3QA+gjz2xXvmvepkxzV5sN++KI6yIr6mtq8V0ObKxbPm2wi
EQ6HqQWJs130INUpR+f3M1pRh0ZuOIkwT8XCPK0I+jcShPG0pD8lVww9L8ap
aqggl1aJzvbSCiv60Vn5hux8fbW5Nb+4rKC4tL2zy+lxV9VUvCgram41835F
v2AlzHYkz6ll0Sxntos7QYzZHgo9s9luG43nkDyna0HJWvJcAW9n6+c8v/1k
eHnO0s8x4sO/kotXU8Rk/FOMyWgPx2+HcQzq9zT87deU/PYmxm9n4ZVst3Gh
PACdAeL4uqoZgK6U57+LJM8Hw28fhEKPXFdHtfmoNh+uM5h6+3raPFmhzR9q
aPMLDAd3z0NWzhW2dkaEW68iwpHR+ZojHbKgczw6Jzg4UZvvErX5wr1AhyPa
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
ln5u58M+uHi1ZnypS/ztJOaDgErYBnpKKHQvFLoZCl4KQcE/gf1Ru4GrHFgP
/Hb30oBjgb/3h/6ur322Od62GRBvZJnkqgYuE2wk5X3a/ezjrtSPCL8drlJZ
0MYxOSCOXKLyDE82nJKtn3M3qPxkKtxYKoJlNGJNfj1t/k7U29/4GbI296i1
eZ9L0ubd9mBuoRHJ8w6qzfmJD29rV47O6dY5aiyfRrS1I0l+Nc1Liip6oA/Q
42oqYOLuPvcl3Kklznb0fdA3TM+BuPOsQkuTDeLOszDXqKm9jzjbWZ4ahcJh
ZjsMgEiTaROCRJ436w3pBjHxnA8GYjMgJs8fcPKc3z1nCUF3ODrcJdxSatHh
2Pp5YG0osBLi1Uj6uYekn38X6OPi1Xh/OwEL105wKvzt+WH87Tci+Nv/zPvb
oYfkCxTvb1eYfD7lTD6aAehqef6m+O2R3w6aZ8WKFW63u6WlxefzDedbcbjP
qDZ/K2fo2vyFljZXm9tb5aNzAoUr1ltR71TbLNnaGa398p3yVLC1+8leORmg
p+TjuHP6AJAmZgehFi7pMcjzlGxIoiRQONHZngmjcxOsBUHxrLW0FhSXGytr
0S8C1GgRZjvvbA8I6P9m4ujcbMkXoMvine0GRdoFWzwnznYqz0nNZPL8DvYd
8eR23t+eoPC3cxvoLAD9yEDp53T9nPnbXd+rLkJZTMYU0d9egTMydJ9hfnsY
f/ulv4Xxt4fnt/M3n1M48KZ6b+jPmrkYg5DnbHVokN6kMKX19bT5O1FUR7X5
r/AMUZtDGi9O/EGq9kDci6u8NudwcEibx1FtPvDofHBb52R0TuQ5UuLzdjr+
ub5uxtIi8pgZVfTlKuOP22xIxS/YAXHni7ZXsDy11XtLtp9ugDS3q10iFO42
jM7RS4i71SxmnfN5agWyrMxsubMdoHA1krNdlOf1kjzPyIWFUNSim5oFSZ63
QvdeH1Ge23pDHUSewwCdRp+7BIcWHY752+Xr51bCehIkz5XC384D4m6HQtwA
XdgfCuwI+jcGfWuC3ijBtTBg/9Hf8zVcrrbP8jRNd1s+d1VPAssT8bdnEX87
DjO6if3thN9OMJ775P526nGSlWjGRla0vjzA889a9fl/h+G3R+AhD0GbvxP1
9jd+hkObe1XaPMBr81JDnWLlvJVrKdFbm9jaH2Xo+XxeBmwntvabj02atvbE
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
t2m22zLDVT3VaZhsfzGhr3BsTw42lKZSmOf1D9sSMCDu1P9tFtfP/9KwnYZg
knxhfgWJhQtPUwWga06mcH0e1ebv6xkJbW7X0uY8qn1AWzvZOhdH57V2DWd7
rdhSZuCt84uJ5eLWOQa2o9Iae7lpy1HdxiO6vRc7D1xx77/k3pvgFmvjefeW
nzvWH9RtitWdTuq+9LDn9NUy4mwvrgxkl7SjH4rkeaNVaOkQirE5ExbPHX5D
ZS16mfVNLFJN5MLB4nlAsmjixfM2sniO/g3N4uI5c7YzlyafqpY/kDxPV2Wr
sek5Wz+/QHckT3Dw9j3icEfAq5GBtSE/jlfrXwKuSy5eLay/vfFzd91ktxkn
81aOdxgwIC6iv13it5+j/vajan877SGZCZOnGJGMCb5GfapKgQw76FGCjCKk
9EZ+O7zTZ+ie9nDn5cuXJHJ39KjPULR5t1qbhxfmms52bnoe5OU5YbaLkWot
4uI5Y7aTWnonzXQVy3OkzQkUjmlz1sGi/5Ko3GTsbE8r6r/zpJVEqiF5Drem
lXZUP1Mz9VV19ud5hux8A3pF6JUieW4DZ7uXXzznyyYw2/XP9IaMdmspJ8+r
wy+ek9E5kueZeHp+Lgy2PYI8H9DfTuhwLP38NCfPFennLF4tmsWr4TWiKBqv
xgPioNL2Q6WVQB/Yp4TKLE6xNI5zlAENuK8A5/Uo/O2J1N9+XpPf/mfqb/+j
bLeRn85MV9VVTX/7YK49VYC4UW0+oDZXn2Aw2N/fH+5vUb31+XxDfvrv5xk5
bS7GqD0Mi4MLa2uXy3PibEfyXGpBOXm++YxrTWzHjxtpntohMU/th622mVEw
Op+9ug70OBmaxzjmRDu+XG+fvc4+a4116mLgwi3cA6Pz7ygULvpow8o9IM/3
xXfCXQFdPD9zq1t0tl+pIcx2MVItqVaeeB5m8VzObJfkudzZXsOlqtVibT4o
c3vk6HNRngdptlqAynO6fh42Xk0MBBED0CVTVg0HiCPr51IAOv7tcO1l8CIU
fOFoKLA/6N8R9G0MetcInijBNT9g/x7uVzu+9LZ+4WmY4TZNdVZOdpSPB357
/ic9zz+G29SHdBfp8t/EQn1MXD+XLlFJvjBheJL186/k4cKsRIdLwBzzO9vp
UW3+fp6R0+ZYnsu0OcHBNTIcHCEMqxYk1VvnpJMk03MWqUbKLxmdxyeV30pv
IVnnt8DZDnX18KXGzbE6mI9f6ET1UCJk/gyEzOhDVTGHdMeud0EFvt9y9nrZ
xaTyjOI+1Kk+zQVn+/NCM5LndPHc0Nxub7X1FerK0Cvt6O6RJ54Tec6XAris
I4vnelg8f65YPJdj26XF8/DyXHP3nEWfX5fD209z8PYDtHvcKraO/Pp5/6Kg
FK+G+e1yfzvHb5/srpvoMk1wVY8Dfns4f/vDV/G3E377GmrCJA4fxm/H8lzp
bycD9L9ryfOInGG9Br8d5Hnkt8M7fUZOm4+eCGeEtLmmMFcg46zyxHOSp6Yt
z+WRamJCZVXgGolUy2xF8hzp7kd54so5r80B2I77OuDC5QK2PZ2mqt1NN6Hm
LVfXnpKhzymymBodWbh4llcQeV6G5bna2d5FI9Usej042+2OarokOJjFc5Dn
OFWNx7Y/ekV5HhEQp/S3nxxo/ZyPV4uSrZ/L/O3cAB0oQ1NhjchM/O3jgN+u
9rc/pPz26x8OzG9fK3mTNMgehD4kS9f9vXZdDX/tqTYmjWrz19Dmo+e1z1C0
+d3w2vxyBG2usrWLRLgk2dZ5LNHmnLOdLJ4r5Dlxti/bx+WpYSjcor3Or6Pr
iLN99qq6uRscs9fbZ62Fx8w19hmr4YNpS43TFhd9t9mKvvjHTRUk7nxrnGvD
sQbibI/Fi+cH42mk2mMvcbZDpFqmNheOXzzPoYvnzNnOpueiNrdoJJ5ryPOW
sOT2Bk1zuzr6nIO30/Vzv+b6uXyALmc1455cAOIo87cbaBSIIgD9Tih0PRSM
xwX/GBT5wM6gf1Owf23Qu0xwLQrYf/L3fNvf+RWU7pZp7vrPwVxaMV7kt2d/
gsq15G+/Qv3tJ6jNCfjtdMGTeZz47U4mz7kVJPEGlchzanDqODOqzd/PM7wZ
ampt3htOm2va2hVb523BlEwYnReUtddQeV7Bpuc4Bqi4UgS2X0wsv/+8F5zt
WVBsr6aBH+lQQuOmIzqkwfddgnE5EubrT7jWHHWuinVGH+tYu1+39UTV2Xve
q6m+y8kt52+WIZmP6g/6/g+f6NHPLda3I3luqG4n8rzHKVga2opEed4tVgPK
hWthXLgASTyHmzribJcnnjN5XiafBGnIc2LaxPJcTW5XRJ9fV2Wr8fD2vdR7
iVvHIAYLi/J8cZC4LiFejXNdvhK/nfnb0zh/e6LobxcXJH9m/Pb/kvHbN2jx
2xUxQHwbGYHf/qoB6P/zfyneDu9TJzmqzd/KGUqG2mtq87DyXFlXGRfOYHKg
rgnMSA3SbScqp9mlfddo4vnTEj9q1ZA8R81bOG2O/io5GxQ6qr3xmNz+rKQP
fZ+nOeBs1xmsxhorejllhjp9BV48r6x1erwurxip1txq6ReZ7Z2kbMLiuehs
bwgOsHhOnO2iPHc6Hxu1uXBEnieHh7cPMl5NTD8PiatDCnnO1s+xv11QxKu9
Ir/dQtaIgN/uKBNrrMhvT1f52yPx2/+k5LeTm0+2fq4me/DTGc0A9Mj89n8b
1eaj2vyNnqFkqL2SNo+93IQU7pFLjTJtPrjRuehs31uy+UTDHo4Lh+Q5GZ1v
IFC4GAkKR+LO/4XlORLgs1bVzYlxfLEOVPnUlfbPV9inof8uNny+qOiLFcb5
u5wLdtm+W4/jzo92bD/nWnsQFs+3/dxAuHCweH5Cd+xK07m73QfA2U4Xz7E8
1+DC8YvnOFKNONs15Llq8Vwhz00qec6w7YTcLsHbFbvnkjyX4O2iv10Ob9f0
tw+B356BB+ia/PbNIf96jt/+A+W3T8f8dkAzSfz2zI+7Uj8Cs1PShzJ+OzdA
r9vyJwuEYP7BvAID4nh++5f/obxBVQeg//l3HXGj2vz9PMOboRZOm/doaXMb
P+JR29q5rHOWp1bdgJtJztyuq5FG51eTax/nw6AH1VtUbGGX/B6Em284pNt/
GSrhljOu6JMuJMyjDjjXHoPytf4AIOMuJHtRpcJQuPKHz9ugsFdAYiP6uRVm
e5NNKCq1EHMmKguGKhN5sfSyTuLCYXlO+kwb3XNptjuq9GLiOVs8r5SnqpWE
k+d1dTcHJ8/V2WpMnvPw9l10NTIG0s+D0DcybBEfr6ZBFW4V9yLFAHTTOGf1
WA1+eybnb2f8Ik1/OxnxkB4S3x+aWYFapADEUYoRWT8fJ79FVHOGNQfov9Me
oCveDu9TJzmqzd/KGUqG2mtoc4U8t3Kh5zJmu5wLl1VgMbdwkWqonFKURxZu
aJNwpBpq0lIKgAiH+jfUyN144r2e7kWlNVGt0HP6k1JbEm6Bri+qDBQa7I8w
uKOqzlFcWpdbaKy1WPUVJvSS6xpanB5PRzfvbO8RyyZ2HJnNBXp9htmSJ8gi
1arki+d8pJrIhUPyvEJaPFfI8weDkOdqQFyE9POfafp5LEeHY+nnLF6N8ttB
ni8J+hcF+7E89/wo2yQigDjbbF/bLG/zDE/DNLflc1ftZPC3V1AIJ+a391CH
kpLffp7m6rLtoV14NEO8SWS3cYmq95vJ3XyO5wfonDzXHKD/PuwAfVSbj2rz
N3mGkqEWTptf0dLmpxIlVLvS1k6JcOrRuXrxfJNcngMXTgWFI872xfuc83Y5
Zq+E4fgXq+rmxjhmr7PPXA2qfPIy+5Rl9mnL2ycvKJq6qOirdXULdovOdvRN
kNjf/DMsnq/aW7L3Yid6MkeuUmf77e6fbzbJ5LmcC3fjcYsi8VyxeK6Tm9sV
zna1PC8obeflueW15HlHGHmumX6u4rf38Ne/WJ7DAB1HdhJ/ewXHby/Av1Ce
4Q30+6FQYih4OQQ1/ySu83vAHBWIDvpWC+5lAccif+9P/V3f+GxzvW2zPM1T
3fUTXTXjHYZxIr/9+Sdd6R91PvxvqNWE30787eQeVQTE/YkA4rDHiet+6XAK
blD51vdjWYnuOHuKfzuMavP35oy0p13S5ipUu7atXTU6553tCnmuJ6PzKshT
u3S7HKBwaaKzHZXca2lQTjcd0UUf1G0/0wlWn1OuNUddyw6BX2jlEef6Yx1r
9umYs/1aSs/ZG2Xxt8pTsttghFTSjgrL8wIzejLMnNlidaDXReU54cJ55Fy4
Fr7PBGe70EwWzw3aXLhSbhI0oDxX7J4/Di/PWbaamg5HViM3sPTzUGBZ0I/l
uczfruS3c/72SWH97Tmiv71L4W+/quVvJwijnZy/fS3nb5/P+9u1+O2EMxzO
h6kY9ITxYUZ+O7zTZ1Sbv5UzEp72CMI87PRcHammhW0n0/MqbnqOWq87NFLt
aQlsnT+ko/PEp0DzQPIc2tdU77V0L/ojkeqov0Vfc+V+bcJtMfQcwB1P9egH
lVdZswuMqHiWGs0FxeWFJWXWrm4cqVaP/jWws72XNx8yZztePCf+QwUXjtmN
CjgunIRtx4vnrEKqze13VfJckX6uOUCXyfOX0vp5hPRzFq/G/O1LB+1vJxzO
yZjyofK3Z4j+9o7X87fPk/vbiTznwJuyuvpf4XIxtOvqqDYf1eZv8oyEpz28
NgccHNPmLEnttDzoHLQ5B4U7ck1aPCfynJ+e7ziP1y3PABRu2V5wts/jnO1I
cSNtjtT3tKXGL9c7Zq2xT19p/3y5feJS+6SlINKnRlmmLITB+nebwNn+A3W2
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
Lb3wJPKcQeEe5/SlAsQDFoVQ74o6unP3vQcuQsHcGde4/7J783GYoR+/0YX+
6sYT6O4SU1sSbpdfvVf+JL8NfcPMPHNapv6Fsb2o1Ey4cCRSDf1ToH+Qzp4O
XWkxxrZb2Eogdhx1tFuNHBeujnLhqsJw4fKYsz0UysTY9nM0VU3NhRvM9DxJ
K/qc+NtZ9DmR5yxb7WeODqdIP+fj1Si/nfnb/ZK/nayfB/pk/nZv20xv83Tw
SVomA+WjGlM+yj6zK/ztj1X+dmZPguoqg3tYABAX3t8+VZ5c+XFEf/t/vmVt
Hu4MS1Ed1ebq89br7TB42jPBCzRIbU4izgmqXWPlnB+d3+JG51rmdqLQY45U
rtpbsv5wpSTPz4nyfPl+WDz/aUvFMgpsn74E9spnrm4HPPtKeCB5PhWPzr9Y
Z58T7Zizzvrl6jr0ZV+uNiJFLznbz4jO9g2xlehpKOR5ApbnOPS89PIjKs+z
feeSahXynHHhbqWIXLhiztleLpfnjAvHEs8Ztr2gjIaeU3nOuHCvY26X/O2i
uZ1PP4/gb/eK/vYennPC/O2UQarwt5MN9KehUAoGxN2UBaALe0KBrUH/evC3
u5cGHAv8vd/3d/0L+O1t2PhkngShG3rUFSv97e28v/0YBcTt+HPdFs7frvI4
dd18m9o83BmuJvatnBEyA3R1daHaiNpyNz3ok6hIrlq1qrq6Gn1w4cKFO3fu
sK9/w9q82mLL5bV5rzLuR3PrnIzOmTznze1kdF5J486Zuf1ZCSyen79ZlvSk
9yYOUzt2vWvDYQhT24zK1FEnPI4BC27tcde64y4k2FEx3Hneve1UI/qy3aer
LpPE8+swOs83+tG3fZCuf5yhLzFApFpLp2Cshel5boGhx4FeacBQNRh5blNg
29VcuAipahHlOcO287vn98PIcxZ9fkJFh6Pr58R4+f/Ze/OgqNI0/3ciJmL+
6L965hczd/o3v+m+ERPxu3HvzL3T09UzUzNTPTPdtahVlqVVVpVWVVfXarlv
IAiI4goqCKi4oSCbIIiKyqaCiiJbsmSyQ7Ivmey5kZnkYt3nfd9zTr5nJVEg
s7p840SFCyQUVefJ53Oe7/P9OgJY2yKsb7cifbsn9IfTtzMDdEbfbul+FxkL
t7+NDeKW8PTtZTL6dqaBfE3Cv53St2vJ80MoUAKTYTpjgp7y0DpMvpER0WEK
bh9fdZJTU1NQzaAaJCQkQJMzL6/5I2TzRSuq3lfURWBzHqQrpqrpZsXzSi0Z
nTO7Qu2euPNsvHieX45G54De0LheuDEdjgXt0GFGpVgik0bh14fOtUATiyLV
8OJ5TvEAcP2Vmw1P6qaqGw0F99VFperWbsOjcvRgs07TCT+EKlUDvIPw8byT
MdRlFoJoX7gesS+cS+gL50k85/Ccmp5zi+cCazhv8Nz76HN6/fyEzPo5cfkI
wni+Az8IZTaJ+FacX1CbRMyD0Om+ldOkzLZhfXvDEoMKxeniR6C/E+rbaf/2
BHZ76Chr7hHu8d7klVbOfeh9Spj0lqiu0ntDr/yDReUvbD7vRfUlmwuOP9Tb
xWRzQYwavXIuOTrnKdt51nC83HMyOg/3+MJZODzfcADB9fqD3SjrPBJlna/a
VPX+lkYgceBx+gJah3+u2W38NMz4wbZGwPOvIvTwWV/uRsr2oLiR/YnmoGj0
HODAuR6C5/FXkG07/OvEp/elkFS1RF7oObJtz1GybRcvnjeIU9V6vMFz1xzx
3CWL5x53OBeL57Pr21n/dsYeCnfpgOd9Tk9ESDMeoNdRBnEEz+HtI9ftpgbo
jmPumYMu+x6XbZfTutVpXu8wfI3826F6D32IhE+d75lblhvVy1h9++tY347D
jK4yTp6oDSYyp6MkZYM1CSEaJ6pEj+Wco//n9yGbL0QT+9zHbrevXr36t7/9
7Zo1a2w225w+d4HEAFAS1/HPzMwM/LlKpYJyFxQUFBMTA9829/E+Y/MpSTYX
xv0Ile2UuJ3geenTzlYqnLehEy2/AEdDucgp7EjObki53g51Jh1vnR880xIS
rYo4Nxp6xgxX2Bm017PnHKqBAOxwQT2EChYW14Iazst9gOeJ2e2A59fvDVY0
Oio1BigphaWA58N9OufAiBM7D2tq1VrA86GRKWgy2dBzBs89qWrEGRI9miPB
DQMGYyv8hNWMLxzpM58Tz90SqWoFrL49jxW3X6XwXBB9Hk+5wx3x6NudoW5H
MOPfjuLVtmBXYb7qUuDfTmyLUN+4wtKJhZctOPoHWsdarL2sUNa3vzYIdYlz
GOYsjA69oH+7IACdHfT8ypdsDh3IzZs34+PjAwMDN2/efOjQIeg6ioqKoLGZ
l9f/EbL5YhZVLyvqYrK5JKFL4jlU2kEOz/W83fNHFVp6dE4edRI8zysZhA7t
9mM7VNQrxSgC4/A5VCrD41ugpTx8aZSsBZ1IRfm5wO/Q3aEsy7uDadfR9Lys
dupR9VA+g+dGgucNTVoaz+GHQ/Ac2bYzvnBQM1Gz1NlZoVaXdGrLWUNdXhIl
a9YhULYzeN7F4jm/PAqc2zlxu6Rz+xzM258JzdvjRenn3Pr5HmaNiItXm6E2
iZT92wdWEh9ONED3+Le/5fFvL6YKLPH3SBb7t7/aw/i3/4vQv13KIE7av50K
QPctmy9oUX3J5oLjD/XW92wukrVLKtvJ4rkQz/EA/cilUQ7PjwCeJzHT84gL
SNkOZP1lSPWmSP3GKNOX+3QA3Ss3VX0UpFuz28C7QthrtwH+diUWtwPOr8PK
9g37m6DLDT8zsjMSKdv3n5XA81QKz3PoVDVJPBf5wtWSSDXR7rlg8bxNKvS8
Q5SqJo3nI6y4ncPzcQ+ei8zb3SyeC9bP5fzbJyn/dj3fv72T8m+vd7uEeM76
t+MBujPBPXPCZY902SKc1hDn9E6neZPD9I1j6g/2sU9tw2um+z60aN83t75n
1Cw31C6bqnyL+LePFRL/9v/SXflPxskzgeff3h3OhmASjRNeQRq77ks2X+gm
9rlPTk4OfDPwi4iICPpR3ouchRMDuN1uzkCDO4vM5ijivAJHnPPZXDDQEaTx
SuI5K25Hz9/4eO4keP6QHZ1fuzcJtTcVjc7HoZMMi29BAH6WGZfDFZJgDk2g
aD1hhNi2QylOuT1xLqMeXuTuU2R88bhmOL8E8FzTrDX26Z2Do87qem0ZGgCh
0PPhEUMV8oWr7+pjU9Uwntd58JxLVePhObt4TsZABM/rqT1KWTw3mYqp6bkC
noun55dZC6NzIvN2bjUynIpXC2Dj1TZ5VJdK/u0rUQC69l3WuWgZilfD2ksJ
ffstvr49mdW3n2b17QL/9iA2AJ2IMMURkJxB3BJ+GykwMvq1L9k8MTHx7Nmz
tbW1GRkZBw4cID4283h+hGwudxaoqHpTURefzcWErpdaP5eMrSTT86oGHWPl
oWXw/FHtFMA1IDbJv7j+wJZ1F4mRLty07olVhUSrjiRbIi9bIs72Mnie4sHz
/HL7ldvt8LnXsW37vbLOgvvqRxWdDS3Dj55qnlRqNM1oet7Y0oEbp2mE5zhV
zRN2g/HcYNCq1aWA59TieQc/iVJy8VxS3F4oMz1X3j2fK54LzNtpfbsgXo2s
EWF9u2OHa4Y8CN3ksmKp0jQlVeLWz0mQJXoQusLSvdzc8bap5W2jZqmhDrsB
P30T7TMK9O1X2dSei5Tv0PFXe2n/dk6btPmV9u9+JRGNsYLUVSlhEsZz37L5
ghbVl2zu5VnMervIbC6OUfOwOd8Rjhmds3jO2z0XrZ9zi+cCPN97Hnu2h1Z/
E960BZvCrQlAM/H3tzauDTF+GIRm5fBP7vqIvVZtQRN2+GAg+j8Eo731bVHd
+86bQ+N7AiLJ4vnoSQrPD56uJXgeT/A8nYfnJFXNg+dsqtrtB8LFcwk8F/nC
LRCej9B4bqTwHBM6tX7O6NvNkv7tDmaA7mAC0Aedzn6nq8fpebshCZ61+F2G
c4fjAtAzoP67nWfdjjjXzFGX/YDLFuacDnRatjjN65ACauIzm36tdeCj6e4P
zO0rTU3vGuvfRhW7HJfrot+O3mZ3kVJ/gwo1tMHs+jmq0uQhKplP4e3O8Txf
svmC1ttnz565XK7n+9z+/n5ihB4TExMXF/fc34MPxQA+YPNKxOajkmwuPzqX
FLcDntOpagJxO6A0lI7knIa0m+15ZfYsbAqHBj0xqkOJowcuonE5gPnOWLR1
vuMEuuDXAbFY6B6NJuzHknrToD7nDSRmIs/20uqphg5nee0wnp4jPIdvT9tn
JLbtOPTchULPlfB8nMZzp3NA5AvHLVEqhZ7z8bxIxhquiHKHE+N5Gh/Pxe5w
3Po5F68WwMarifTtBll9OxJeaom+fSmjb68V6dsLKX17loy+XeTfjnpIToTJ
DdDnqG9Xvh0W9PT19RkMBvLr7u7ugwcPQqGDUjBfr/8jZ3NfFdVFYPNZwVx2
gC7zLJRzbm8l4nYUem5o5zttFj8eAjxPyW0oqkBhakTWnphnDQc2j1EBmEel
WI6nWQ6e7w09oUKuHSdV53PHM++ixPPbT+zJOfWp1xsKy4agMuffUxeWqFWa
4ao6+JfV1Gu06qYOhOfIF85msU7zbdsnsFcPkhoaDF0IzzWSeE77wnGL5x48
N5sKFFPVxLnnLxh9fonKVjvDXz+fo76dZxAnp29fYelcLtK3v4Eegd4X6dtT
fyPj3+6dvl1CmOTBc0utL9l8QYvqSzZXOL6qt/7D5uKtc0k8Fw7QWWu4iLN8
PMfi9ogL5qC4kW/CGFO4zcdMX0foP9hSBdy9Nli3NtSIxO2ByK1dcH2wc/i9
DShS7bvDpvWH9V9gZfuOY91oLHWKh+fw7UVf7iV4fjKjj5eqRk/Pr7HTcy5V
TcYXjts913Sip7v04rkYz5VCzxXxfICP5xLR5xjP2fXz+dK3a6X07WVUADpf
3+485nYcdM0gfbsL6ds3OAzfYH37Gijd033vW7TvmVuXGzXLDLVvTVa8OfHo
9bF7PH37YBL7HPUEW6UjqBDMrb8ev3Ne+XZY0LNw9dbtdq9evToyMnLWj/zd
7373l3/5l3/7t3/785///O/+7u/+7d/+rbm5mfwV/OKXv/wlgXTvj5+IAXzL
5iMiqyKGzZXxnApW84Setxngfm/FeE4G6FAlKhodl/HoPLdkMhfrMM9dG98b
p9p3quVoquXQJcve82hoHhiHrOE2ROIryrTluAnqYWAU+rDzN6wZRbaka+2X
rjZkF6C5D7zyExXC84cVWvg24NvrQqHnjU8qNe0Iz52dPUMkVQ2L2wmemzx4
jmwhR2ccRDODPCEBzzXSeC72hePheVdXNuB5V9dVVtkuzj3nzNsFzu1ZFJ4n
8fFccv2cE14GMPFqM3w857kKs/p2MtbxGMQtM7ctNTVj//Y6j3/7xIPfIT0P
p2/P5fu3C/Tt3vu3r/5lq8C/nR6gs3iufDss5oFadO/ePagGUATm5QV/hGzu
D0XVf9hcYQNdPD3n9O21jTqibO/oZ4Iwmlg8v3kXRapdud0BrI0XhVCzGh6n
CsVPO6NSLcfTUZ8JPSewOZRZaFahoc0otkL3e+3+ZBLgeW7Dg5qpSjVaDiou
1dQ369gHm8MNCM+ZVDWzlbFtx75wk9irh1jpstNzjOcunm07h+cCXzgPno/o
ryvi+S2Z3HNJPJfbPU/l757T2WpiPOfi1fYz+nbk8sHzb0eVlvNvR+vnfKkS
HqBbBz+Y7ls13f0es0bUvJTn314m0Lcj//Zhzr/97L97gnuwf3u3gn/7JyJh
EheA/l/Yv/21/9dS5y/75t/Pd1F9yeaC4w/11pdsLrdyLlK2i/Gcjj7nnNvp
0HOye05G59uiur8ORXlq0KZuOmr6PLQLmbFvb/xsj/GTUOPHePccePzdrSj3
fPlWdMFv39ukeW9j1ed7dOuPMMp2YHx4tQOX8OJ5ZE1obDN8aQ7PpUPPRdPz
zIKBuzSeN2A8J75wzQ650HNJPC8p78z3Ds97WDzv8x7PKXc4Eq9mkI1XEw/Q
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
1Iyif3AAOta3P5Xyb79G6ds9DsPciIf1bw/z7EjyRJiMfzvfIA67GCnfDot2
oOvr6Ojo6uoyGo3z9Zo/Qjb3h6LqV2ze0qmvVXdxF/yWXAKJu2CA7lk8r2YS
zzswnrfgp501LY5rRR0puQ05xQO3cNZ5RrE1Lr2PmMLtO9USnW45moqU7Ycu
WfYnIi+j3SdHgo6pwk6oTmWNpxdia83s+rwSpGwvVw0XlQKeq9u6DQTPVerO
Nu0A4DnxhbMgPO8meD4+OUxPz52ukU5ttVpT2ql9ikWGCnhOi9sfkdrIT1Wb
E56Lg9W8x3OBebtY306tnzNrRLt5Aeh2UQA68vrgNom4B6GrrESnpH0H+7cv
MzYsNaiW0P7tY4Wo5WMWiK78J/JvT5L2b++W9G+nozHIk8/l/2hR+5jNuTPv
RfUlmwuOP9Tb+WXzZGU2v43Y/KAkm4tk7TSbSxI6vYfucYej8Hw/FrfvjKw5
lMQU0m1Hu7/GeL7jBFK2f3fE+PtQ3Yr1Ve+u17y72fDWOgk2h7Ps60rg90+C
dd8cMG4+atp4CDnLbTiAEs8jElGqGgk9Bzwni+ccngt2z7lgNfjRXcxpI3ie
R/BcJR16/hx4PtdUtVnxXOgOZ5KOV5PWt9vF/u3jrH/7EA5A78V43sm+7xDD
k2rKHa7A7c5zo/cLeHfAG+jOU+6ZaJf9sMu212kNdk5vR/7tpq9npj63j35q
G/p4une1pXOVqWWFUf2OQbWU9W//7Wj+b0du4llVOhpUoUJ96t8NTy8q3w6L
dua93tJs3tvbm8I/PT098Oc//elP6+vrycc0NTX95Cc/0ev1L/h1F1rR6uXx
TzYXyNoVCF1hgA63uarFAAWhrp2nbIf6DHieddd26ZZ1zwlV8DFVUHTPtmOm
v/7Fa+KyBsy+eV9NwGHVvpMtl24iR6PckslLV+sBz+88HISXhXeBshpUVR5W
aMniOcFzRtw+zIjbSe45wfNpOTzHyywGYxvG8yKdropaoqTxnN499yjbTab7
UnguXjznpud5InF7OoXniZS9cDyVfi6OVwvC8WpE375JUd++Rl7fvhQZxLH6
9snHr0889ELffkrCv51nMuzRt/9KUt+ufDv8oM+PkM39oaj6D5u3duqfYINK
4VWBlEseQhdImPCjUUk8b+tDnRWU00eqqXRsCpf3cPJWmQ2qIjS0sakIz0Oi
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
zOJ5WHVQHFo8P3jJAl+C+MLJ4Tlv93zueE5CzxtEuec0nrdKidulF8+p0HNZ
PB+TwHNqgI7j1RCkOBn/djZejSF0AZ7z/Nsn2FhPPcbzISceoLsY7VabyL/9
CX67KXa7b7ndOW5Xutt1CZf9WFzn97udoS5bkNOyw2HcNDO5zj72pU3/mXXo
I2v/KmiPkeqpCUuesH/7+L3Xkb79xn/rrv6nSZ1E3w6+ZfP5rbc/8uPLubmY
zaUc4ehLboYuSeg1nLK92QDVgCjbiZER9IRXCwcAsTOKbBduWCNOtew6qtp9
cmRHjGndYdMf9hm/2m+Eirf5mCkwDoVLRpwfDYlWhceiuF6o2zkltrwy5AuX
lN1wNZ9ZPK9pMsDX8uC5aHouxHObFJ6zOhmE5+z0HON5G0/czpuezwnP5zQ9
J9HnF6n5zklq/fwo5VzE6ttd3FhnC9K32wSeRbTqkrUtIvp2EoDeuczcttTU
vITWtyP/dq57zP9vTz5vBtNACvTtaMRDMoCIQRwnwmRdjIhBXCuOAVK+HRb5
HDhwQPCYESobrdiZ0/mRs7mvjj/MzRXAfJy64AOgGgu17h16BTxvaDdweP6g
ZirtOvJsv/1osuCp/eo929mc6eiU6V1Rqh2HVLtizVuiTMu/zP8/fuFJpdxx
pCb4mCrqYm/ybSv0w1CEoRpn5jWU1081dTtLyzuLStWPqzo7eo2PcKpaPcLz
BhbPUZvU0tYEFbS1XUPkhTOMvJDCc12d05Oq1kolUday1VIOzxXE7d5Mz2k8
z/Jiek5nqwn07eJ4Ncq/3Unp253bmEpLAtCh0kpKlXQfWgc/mO5bNd2NBzHt
7yB9e+MSQ/1bUzVveiw+ZPXt/+HZHork9O1Uad30Sse6V8j6+XSLH7H5/FbU
l2zuh2eR5+aXblkPnq4FXOXYXFbWLoXnkhdtGZfAl7jHE2V7LKNsP8g6eGw/
1s0o26Oxsv2g8cPtjYDnH+wcBjxfvoW5VmwzvB9g+CjIgDLQA7pWba76YEvV
1xH6TUdN8Ikb+Ivn+86NksVzwPNYKTw/mdEnxPOHHjxH4vaHk/ermdBzBs9x
6DmXqlbfzoSeq72bni88nhN9uzhezSFaPxfr2yftTAA6Lw3Z6eplnU9aKH17
FbuBfp8JQHeLAtCde10zwS7rTqd5s8Pw3czEV/bR39t0H1sH35/uXYFcPVuQ
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
nGw5cJFVtodVf7u3aStWtq8JaAQ8f39rI/A4UPkaIPTdmNDDjJ/uMX4Wjgj9
01CE8PCRZHlzW7QJPp1ePD9A4XloXLMEnp+WxvOrxRMEz7MKBjCe41Q1Cs9p
cTvn3N64WHg+JIPnUvp29/Pq2yewvp0JQHcyA/QuGX07F4AObyjX3O4MtysJ
FX9nnNtx1DVD9O2BzuktTvN6h+Er1CqPrrEOfTjd+76l8z1Ty3KjepltKFX5
dli0M+/11n+O0+msra2dnJwkv52YmEhLS1voL+rnbD4sAHOFa0xoHzcwisQt
cKt2s3gONzjc8k1YkFnT6rjzYDAZK9uz705cxXi+L14VGqM6dHEUMPxwkuXg
JaRmBzYPP+8ZoB+5NLrnBPJsT75tvVJsu0Yp2wseoTzHunZUcFTN0rvnZUzu
uYGP5+Pwwxyb0GNfuMqBwQ42wHfE6cHzJxSet7KtplpK3F4pmXsug+ek/yx4
ATyn9e0y/u2ob9zGuAqjTF7s3y7Qt48J9O3Ev/0dc8cyc+tS5N+uZv3bib79
AeXffpPyb09h9O39tL6djHg4/3Y8QO/Y6kdsDic3N3fHjh337t27T53nfrWX
bO4PFXXe2XyugnYBmAth3MQMC7hrgq9sp/EcKir0PHh0rlG3G6B3asZ4Xtfm
uHkX6dKzCwdQNmW+NT5jbHe06qNvzwvA/Jf/tXvdAdOmI6atkfrth2p2H0cr
QtDjwWdBO5ecg1LVqnEqZQkenZdXa6GtwqHnmlp1Z3vXIIPnZPfcZuHjuWdy
weJ5CYvnglS1WqpUctPzRyye53qdey6J59fmA8/PUQVWwb+d1bfT/u0oKQMb
xNlZgzihFSdbaTmDOLRGhJ+CqpcYat9CcbrkESjt357jhX976D9bu/yFzb+f
74r6ks2Vj0/q7Q+LzaWRXPLCH3/2OlK204vnKPGc4HkSo2wHpkbK9oPdW46b
vtmv/2ALykr7JEQHGA4wDkgOnL42BF1kgP7Jbh0Zna87bETKdv7iOcLzCzxx
u8T0/BTC8/PXxjk8Z3LPAc/v8vC8pIYJPffgOWsNB+8axBcO/ntJT897vcNz
NlWtRw7PR2XxXM4dbsKzfu6k9e0igziLBfm3kwE68W9n8dzBrZ8zAeiU/4kG
d+w1/AD0O253rtt9xe1KxsU/HpV650G3I9xlD3JatzvNGx2Gb2cmvrCPfopK
98BKS/cKc/s79pE05dthMc/81lvfnhMnToTwT3h4eHR0tFqtXpxv4JVXXoEv
B208+a1v2Fxx5Xx2KpdB9cExVtmu8ySeV9QNk5YSCLqiyXH1Tgfyc8tth+bw
SrE1Lq0PesWI0y3HLo/GZFiOp6NBeWSKBZD84CX0oBIuwHbg9/BY1ekslPmY
dQ9VeKj5ydkNqbkN+Q+HoPLUtiFrOFWT4Q7Cc3U1i+dcn/m4Qt03bJgwznT2
DFbNguejTpdeCs/bRHhex5+ee4nnAl+4F8FzejWSWj9HeL7L7aJchcn6uYU0
jV/N7t+uXWZup/zbBfr2Yr5/O24ghwT+7WTEw/m3swZxgtvB5wrMGzduQGWb
l5f60bK5b4sqqahcKuUiszkRtEtsmkuyuQjMJ/GfeJTtnXoGz8cZ23bodlSN
OsDzhxWdbX2ogyKLQuUNqPVKzmnIvjtJwi/24fCLf/3dt4TK/9ffvfbB+vyA
WJRKGX6WKaT7z/aGnVBFnKxNvD6eXYKCKQHPswtQ8kVDh/PB0074QnVNwwMj
zuq6zrKnapW6s00LeF4vwHOVBJ6PDusYPDcYW5wCPOcZaVZSzu0Ez0vNpvzZ
8FwcrKagbJ8Vz3nZanw8F8erSfm3OyX8290OCs8tX0v5t39kHVw93ff+dPdK
S+cKc9typG/XLDXWMztEPP/2vFn824m+3dpdS98Of0wV9SWbSx7f1tu1a9dG
48P9yaKxuUTE+axsTn1k4mwXMX73KNsBzzMtnuk5tm3fdwFFqhFl++Yo/eaj
ps9D0Ub5+5ur1gZ1fRGBROyf70XjcqBy4PRPMJ6v3o7G65+FdJHR+dZotHi+
LkKE5+ek8TyaxXPaGo7D89Rb/WfSlfCcc26nfeEEeN4sg+dyoecCXziBbbv3
eO5ZPze6eP7tTLyal/7t49yOFda3D7EB6NzbkMC/vQxvoOdjfXum23UZ13/W
v90V7prZ7bQGOM1bHIb1MxNf20c/t+nW4CerK2Ym0unbweea9nmst749RUVF
hw8ffvLkyeDgYGVlJVSYtLS0mpqa0NDQoaGhRfgGfvazn7XjQ37rJ2yumw29
dfQ1wf8tjeejHjxv6jQWlmqAlNH0vBeVAiDop42OyzkNgOcZdwZySmxQlqHw
Ap7viVUdvtALZTA63XIsDS2bH0m2HEpCeI4eV+KWcm+c6mz2OIlUu/XYnlOE
4noBz0urpwieQ815XDNM8JyeniM8Z6fnEyYH4Dn86CTxfIabnru8nJ4/B56L
bdsJnt9QxHOSrSZYPxfr2+l4tSC3KwC5CjtZV2GryL99Utq/HQ3QtW+bO5aa
WpdI+LeXUvp2PN/RKejbj/wrkwGERZiC28HnnSQct9s9L6/zo2Vz3xZV+F+I
rqiLyeZ9QyaBQ7ssmJukwZwbnXPKdrJ4TvCc+MIhU7gqbTE2hYOuqZnFczI6
z8hrh3Y3rcB6LtcaEq0KiFLtih1BTsJRpvWRqAkMiDPtPo3GPQTPD5zrhWIL
VfdKMbLvuHi1/vI1lHwBnVtNk6GwVI3xXDc4CniuBTxH03Ott9PzYTQ9L2Xx
XMvWzCY2hlJpev7seYLVXhzPxdlqAn27IF6N79/u5PzbmUrLC0BH6+dfCaw4
UaUdWm3tf3+6Z6Wla4W5Y7m5FWXpIhNOUmOfvD7BKpQk9O1YntQXz1bXQ/9q
6/EvNv9+/irqSzaXPL6ttwAj58+f5+rt9z5ncxk8vyAJ5vgVLuILXjA2tfcE
/1LCc2zbTpTt2452E2X7tmjE2p+HYDzfUvXRjsY1QV0cnjOEHoZH55vQ6PzL
fboNkabNx0zbYkxbj+rJ4jm8mhjPeeL2a9PRlxk8j0/vgx9UXEorwXNiDZdG
8DyjPqtQGs/R7vlc8BwaGeILJ4nnkrbts+K5IFtthH2+LRWvxg3QBXgupW9n
DOKYHSs8QMcB6GiA3ocD0Im+nfif1OI3oAp2gF7kdkN/nu12pblRg53ABKA7
97sdIS57oNOyzWHcMDP5jX3sDzb9J9ahDx2GTMHt4PN98/mqt749QUFBw8PD
3G8nJyeDg4O/x+WutLR0Eb4Bv9C0C9h8QpbNhUhOXcJX4JsME9t2Gs/h9q/v
QInn96umoBsEPL92fxKqNFTmuLS+iJOq8DgVADi0jsdShWwOtI62zmNVpzLH
OFO4O+X2a3cZPK9odBBxO1SbJ6phKXG7nrEgRs7tXO65AM8rMJ6POxh/CR2R
x5Ddc52uig3wJXgu6dzujbhdMlVtVjynzdvPSw13jvHj1dgBupPRt6OlSKRv
pwfoCvp21li4422evp3zb+f07Xek9e0DMvp25dvhB31+tGzu26LqQ037HATt
UmBOsIKMzhGeD1OL51ziORYjtXbjuHOsbG/rY/C8ts2RfqMBaumNkkno0FLy
rYfOtuyOVgVFtwSfMgfGm3bGog4QWkdoBdEA/TTy9Nh/0Rx8DD0LPZM9DoUU
inBSdj2U0MKyIejZ4P/fIg+eu2oa4IejgR9RR9cQyj1XNcjgucc1F1nDaUo7
tU8pVaFk6Dm3e15G4zmenl+ay+75fOE55w7HrZ97rW93Ufp2ptKKBuhCfTvn
w7nCol1ubn/b1LxMWt9+B/m3E38PSX27rc/v2Hy+zks2lzy+rbc+1LTLsvlN
JTanqZwDc6ByeE3xhfAcL55zeE7E7VHJo4HYF27fuVGibCeRahsOdW89jhLP
Pw/tWr21igzQ1+zq+sNe3vT883CUhw5/9enuLkbZjiODtx7Tf01s22NHGDyn
ds/DWDyHb4Pg+X4RnnPO7TSe36uWwvPHaANUxfrCNShYwyniuTD0nLZtl8Tz
MSGee7F+zsareaVvN4r07WT9XOdE3s59s+nbi7G+nR6gn3Q7j7sdh1wzSN/u
sm1zWjY6jIy+3WnOVr4d/jhOu8xZuK944MCBuro67retra0hISHwC6jtFRUV
C/d1ufMDYnNlKvdc7AsKXIz62N1zLG7X3H/SibbCW5GyPa8ULZ6n5bWj8Tfg
eTHy5zyR0kcG6KExqsOXRjk2h38eS2XY/GTmWPJtazo2hYNSX1hhz7jVDnie
XdABeF7N4jmxhissZfCc79ze2N6lh7te09JZxQSroVazr7+LwfMhhOfs3Y3s
Hw1G+K9TrNEU8fGcdJtql8T0XMm53S0beu49ns+6fk77t+O+EcWr7eBchamm
8Uuhvp0ZoK+a7l853bMC+bejZF482YHWEWsvUTjvEyl9ezbl304rMKM5//Z/
Vb4dFuEsnCDwR8vmvi2qPmTzOnWXApt7A+aEzcnoHD6llV48x3gOLQ3x8WDj
zrXQIBFxO/RXBY+GUnIb0m62Q9MLoH3u2nh4nGr3cVX4mRHkrnnWHJJgDsKc
viPWBD3k9hMmwPbg2J6gY6r9CS2X8tBzzow7A1CNAfMB9qFDq6gfxniuZvC8
nsXz7uHKGjWH56MTo6q6aiGe45lFZ2elWg14Xi4KPdfwreEY/0waz9lgtUvd
XemUcybB83yqTuYpLp4/P55TA3S5eDU5/3buQeh2qtJyA3Tk9UFVWu5BKPHh
XA5lFqVYapYa6pZMVb81+fRNRt9+lyqwXH4lVV1t/b5n8wUqqvPF5s+ePfvj
GC2R49t6u5hsnuQ1m4tH57yJOX9cHpXYgg3WkHwoLq0PXenon8QQPial9zzr
C0eHnu8/i23bj9QQZXtQ3AiJVNsSpQfQ3nQUWcP9nh2gr9pc9XFgF4A5w+Z7
jR/uQGz+RbgO2Bw+klO2bzrUjfB8D0pVIz5LB7DPUnBMs2d6niXAc9XxS62J
otxzL/GcsW0X5Z57g+cKoee9c8dzxfVznn+7QYjnEgN0nn+7g5mvYf92tH7O
13GRp8QCPL+J3zjSn6EAdOTf7p6Jctn3u2yhSN8+vclhRv7tLmuu8u2wCGeh
t1pSMh//3W+K/6/fVQuupZ/dh5o8L19CfKCm7dy5MzY2Njc3Nz4+fuvWreXl
5VDcgoODjUbjAn1R+vzw2FyOykWtLG/Ww9m2491zwGS4wR/XDENBqG52lGtm
su50JGWjGpJXhuzdoEWE4gzl8ci5FjJAj05H03OUcp7EurXHqqA0QbmGj7x6
D43Obz+xK+F5ibqw5DnxnNlecSBtjMM5YDC2wn8dNQ/PWzx47poTnpe6JWzb
vcHzVCk8p9PPxfFqrPDSEex27HLN7HTZt7vsW1y2TUjfbuXr22n/dt1qlPvT
v2q65z1WePmOqQmtRhrqlyDtZZWUf/sNyr/9skff3h/v0bcr3w6LcBZOEPji
bF5dXR0TEwOt16VLl7jJCPzh0aNH9+3bl5iYaLVaBZ8CBQ3+FSIiIi5fvjwz
M/Mi3/9zH98WVV+x+RjL5sL0NKmhuRyY4+mAh83h08niOecLR7bOiRIJKdsf
aKoadNAjAZ5DlYNyl1PQkZxTfyV/ANpdaG6jL/dB8QyLazmUZCaxvBykB7OQ
Dv8MPN4cfEwVmdgLrS/U3svXUQnNLeqAVq2ZwvPWbmNnnxH7dWjatTr46RE8
149NIjwfF+I5Lpv6GedwZ2eFWl3S2Ql43uXkpapxeK6i8PyxAM+xuJ3Dc4Vs
NRrPc2XwPIuP5+nPi+d0vJr4KSjl3+5gA9CZSrvBOS3MshT6t6MA9OXYvx2n
WNYvNdS8NVnx5sTjN8YfvM7Tt5Pnnym/YfTtp//dNuB7Nl+gojovbA5gfu7c
ucLCQvJb+CaD+Wdqaor+eOV66w/Ht/X2B8HmF2TYnIzLCZWfyR6HF7902/O1
gNBpPD9L8DyHnZ5nYl+4yJqg6GaibN+Ole1f4cVzhOfH0CbRd0eMn4UwG+if
hiKDOIbN8dz8452NHJvDp2yLQQV502H0OgTP91I2yB48v8LgecK16ZOZY4Dn
B+aE53Uztx8MevC8lXFuZwbonU7PAF3Rud1bPNfPGc9HxOvn5L0S390Ungv1
7WZJPOcFoJMevt/p7MFvRrRJaa3bVel2PcYjs7t4/fymG71xXEEDdOd5t+Ok
a+a4y3bIZQ13Tgchfbt5vct+U/l2WISz0FstwOb/z1Lt/7diUnAtKJvDGR0d
LS0tzc7OhiJssVjgT8bGxhatrV18NofW8Qlu9sRsrrByLgBzGsmFGUPsnUXj
uWB63qw1klQ1VbOBVrbz8RwVZ6iWh88hDD+c2Hs8HcWowXUs1RKZPEpWzqFs
Xr5jzShGW+dQ7e88sec9nETJ6dcaiKkRlB2Se15eh/C8QA7PtTr4iWlaOnh4
PsDi+WA77jNHZ5w8PJedns8Nzx9IhZ4L8DxXhOdc9DntDideP4/mx6uxBnFk
L5KJ5WVCf5xc6I+Sf/t7093vYuElmuyg6B9a386m/4wJ9O3UgiStwFS+HRbh
LJwg8AXZHNqqwMBA0lxBrxUXF/c9Lk3whyaTCX6dmpoKVYv+lOnp6e3bt+v1
eug/79y5Ay3oi3z/L3J8WFR9yObSRnACNhcPzRkk91yTlLKd+MLBK5PvSkfh
OaNsx3je3o+aKKilj1RTadcbAM+v4WxKKKH74tGzzYizvcDmYWR0ftIcGIdm
NNui8apjtCkofiQwShUSo4rPHE8rsOaW2i5dRYnnd8uHCJ5XIjzXwJdr6zZq
MZ7jVDWC5w0Yzyfw9HyE4Hn/oJa2zDUYulDoOeA5Mz3nhZ5Tu+fS03N295zG
c5rN5fBcbnpOSmgmP/Scw3Nx9PlF+fVzgUGcF/p2T7ya4FkoqrQ2om8fwkYf
SKf0DqtvX8rTt5d49O16zt8D22/ah+oUbofFOQtUVF+czXt7e48dOwZFkmNz
t9s9w56srKyzZ8/SH69cb/3n+LDe+i2bX5htaM6CeS1QeRKF5HDBVyQXh+cn
pKbnsZkWomwPO9mzn45U29e0/QSag5PpOY3nf9jHBJ0DpxO3dvgr+ACgeGD5
rVjZvnNWPI9tPkHh+dnr05EXWgien6aC1ZSn5zw855zblafn3uC5gm27Mp57
tX5OxavNom8HQjeJ9O0Ez9kAdJcgAL0RvxOp8HsQLwAd3jLc7hS84nTK7Yh2
zxx22fe5bLud1h3umTvKt8MinIXeavEVm8OB2tvf3++Th6I/JDaXGZcLutaW
Tj28OD3rEeyek2C1arUOSPn+k05SyaE43Hk4SBLPbz6YvPXYnoun51CfoXJC
ewl4fuhC7/E0C1wxGRakKTqDRupA7lCu4cOA5aEWAdfnl9tvPUS27SnY1Kiq
mfGFgyLD5Z5zeD7owXOye46C1RTxnHWWcA4M62pFeO6Znot2z2fFc7nd81uz
4XkKZTIscIeTHKBHePpGF7YtYmJ58VIkg+ffCP3bPQZxq6yMf/tyS+fb5rZl
rH+7V/r2Ib6+Xfl2WISzcILAF2Tzqampjo4O8uu+vr4tW7Z8j4c+pPWCc/ny
5atXr9Kf8uTJk4SEBPJrqM/r1693OBwv8q/wIsdXRdVXbE6M4Gg2lxO0i4bm
LvGFSzcfz/HueTfgOWcKR+E5lFPomqDK1bQ6rhV1pOY2XLmFVoSg6b1wfZzg
eXh8y75zo3vOmndiQftmdqyzMcoUGGfehUfnMWljSbdQ+AWg/eVrDRk3G+4+
QYvnUDxLn6JUtcfVWqjhTOh5pWZAZ1Q3dcBPsrG5nbRGFJ534o6IMeTBeM6l
qgnxnK2WtC/cE9oajhO3493zu/Kjcy93z7nRuSKeM9lqs66fi/XtrH87GqAL
/NtZK05W3+5ABnFfOKZ4A3T0IJTolLTvoqegrcuMjUsNAv92KX27fdj3bL5A
RfXF2TwzM1OlUl25coVjc+5otVr4JrnqSo5yvfWr46t666dsflOCzWkwh08n
E/O4tD5uVp5MUfllfNF4nnB1DF6E7J6fwbvn0IVGJo8GiBfPw6o3HeregfGc
KbOHjWsCGoHEiTXcFxHGtUFd72M2/3R317eHjOuPoC11+GD4FOD6gDgGzzcc
aAo7axbieSSD53EiPI9P7xNMz2/I4HlZ/Qy0xwI8rxXgudgaThbPvU1V66dC
z2fBc/l4NY9BnMQA3Sqrb+cM4oh/FOPf3utiAtBpfXsVFYBeiAfoV92uVDd6
F0hAz2OdkW5HhGsGanuR8u2wCGeht1p8wuZGozE2NnbdunU7duz47rvvIiIi
RkZGFuhrSZ6f/exnt27dWkyf9udgc+mh+aQQzHuHTITKoY1EF/4qyMiIFcmT
6TnRt8M9++Cp9s599WPVcEMnqgkA0QTPM251MHj+wJaF8Tw2ldk9P3S+lzww
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
Rq4gej02j+mvOP+VXaKwL7LHzKpoJ6+iaArX2UPwvK4lMDRO+iXooOo7w7lF
7pv53QVVS9AJQxd67PLAwTMd353tP3KNtHbQOkKPBxc0kGKA/vPvc2TxPKvj
ZvH6/QpSSKGEPqCJ548rfVg2ZTyXzDrI65mLkbhvBK3huuGHlB7P4QfZFB9S
kJpJ8NxL8DwS6ed4bhqsphl0KHi+Ei2jeI4D9LxdObc/MuC5rGxPKm638m8X
eC4G6EpMBte3J4S+3cwgTs6yJFIlsUkkfDj/mlj3yv//U9w3NxZVrKh/2HYv
xvOnFlWHzd/O2VG9TUc2J0Zw+vQ0WdAuhub3Kwx4LkM6fYT48E5QcTumquVI
zu0AyF9zPJed2/9Bo8+R0D+jhL7vLBugk+sUg3SB6jhAR2u4r85xPP+e4PmB
c7M24vZz6u55pxysllu6iKZMucVq7jngeX33ZhXfPS+q8NV1hHH9nOye20af
Mzxv9JfuBM9NbdtTxPNk/u3aD9mIub6dEfq6ziCO+rfH5rhBHMNzSdlFfjBt
b+v8IVPcN0+Lepthx8pd+cWLF4cOHfr222+PHj0qZ8+952xuE6A2FzYzglNt
juwIHT6F+8KFQouJ4EICw4DgPoU792VzAG7tqkYSCeT2k9frWCpQIcFqgOui
yimo9hqhU4k7u16Sq1B/iVS1CtdGYeUUhp5Xt9JUtUGC57h7ruaez5L6wHPP
PePBsG8YuvouF8Hz8VUDnotWM87wfDIY6jTgeSrR57vD8wK9PlNRZirucMZ4
NdE6ysLLI9y//butGAlAT2x+ldjYm9j4gjSNIvTHWt++RvrG/4HCy5UBGv3j
+bflLjJAV26fVDpJe1tdqxvt7R+Hzd/UMS2qKVbUNGdzFdV5YY+LxzwRjAhf
ONldE0i5osbb6g4inkNDVUpjL64/6oZieO/5q5y8hR+yOr473fGva3O/3lo9
dmsVYJzw+A1yQSf50+8r8Ouh7P7vz3acvjUG7Ssq28ubN+DrQM9W2TiNeN43
SmzbAc8bWgOI5+3u4YYWLzyZC5GYp9fnau/29g1F1taja2ur66v9g72A5wND
XsDzV3zFL4bTcw3Pldxzj94azsXx3NK8fSX6NDU8LzLg+UMDnqc4PZfN26/q
X/+8KL0EauPf/j33bz8gJWVApf08sf5pfE3LspTWz2Wjj/838Wo3bG4sqqKi
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
8HtKeL7B8Jy7w6W+fi6iz+3w3DA9n0hN3P766+dK4BRSDP8RrA3QN+Ob9reD
c9L0pDWbN5qzedyUzYWa3dhqCkgXeA4fNjw2LeM5uhAPDRM8lwPQmcRdykDX
4zkpC3K2Gh2gE317aTMZnQObY3VFU8riRhap9qKNNJm4eN7cEzPiebOE5+Mh
qBLx6fl4ezdpOAcCwcVIfHo23Nrhpi816PC8U7aGowmJMSlbbYfucOZ4bghW
KzNYwz1OAc//VP92IHTi325/O6T1ATZ/9qIPk0Rsrvr2GYfN3+D5oNic1NWk
eB7d6vYON9LQ8xBfCOrqCQEpV9R4PUPL0B1BywT1rbRu6k6h+2Z+dxkunte8
uldBWlYUZJ67Mw6d5OFsQuWHzpELCP3Xq/3Q3DJTODo6h4btYSmxf39c6SNe
mhzPXd3B57h4Tl/JDC4w2/ZOT2BhOTZJXswkEn34McHw/BXD84GhHi2zhr6e
Sa3hXnLn9pG4ag1nl3CxK/P2HeH5XQOep+4OJ/A8Ff92Q5mlRh/b2wGb2yGt
D7D5vYIGNHy2vxw2f2snfdn8phmb39OxuUHQzifmhYbLhNANeI7flzJAx4Q1
2SMO8Pz4zTnm336s/cjluaPcHe6QwR1u3xk2NCdsTkfn+85oiecHJDxXfOFk
PP/p0mgWxXN4ANkP5jFVDR6hDs+5c7uK520b1R1a9Dlzh6P69udW6ee7xfPx
ZNZwVtNzu3i1lPzbE1b+7ZuxmP3t4Jw0PRnL5haCdj40fyVdKqGLMTp8ipKw
hvfLkH6ALjJ8UeKO+na4zasa/bhQ2UV/Urh6Y8Uvyfr5g2IfoLfIVoMfEFhR
i2q5KRxVtle1b6CyHX3h0LYdU9WgsPQZQs/hbw+MR9AXjuB5FPB82RTPu3aA
521m6+fGzlOH5zMzjwHPt5LknmO3aYXn9v7tV6X1c1P/doOxMO5FxvYnNr9K
bO5NbHxBA9D/0/52SOvjsPk7OR8Cm+8Cz+XAC9QaoS/cc4rn0CMBRLf1xwrK
fbcL3fefDUFtfEwXz+9XaHlA0NBCP3z69pimcs/ugHdi3DmOzp+3bEAfnl9G
xI3PG6bRSxPF7S+b/QTP2wIYqTY8waulP8i1RojnkxzPiW27jOebOjyvkfDc
n5pHh515uxme4wD9reK5wb9dXj8X+nalzB4R/u3b28M2t0NaH4fN38OTUWz+
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
fpL07d9sJfYrt0MmdZIOm7+TA/+F5IqaWWyuunNIeL5hjefaKhD1bCca8j6f
hueDo8y2HfG8m5pnFlaQpPLHVVNEO9RMfTno7s8jvoF+q2QdY4JvUjwHZgdy
hw94zMMoSSteRTzbAc+hSyevZ/pjUDAHxuKt7pBIPKe27cwXDmr4YjQxPRtx
tXtkPF814PmGwPM4x3Nv9XJkQB+stgt3OCOeK9tA9naar4/navp5CgHoZ+RX
Qbe3x5Tb4V3chX/Kcdj8PTwAI1euXBH19o9MYfOrBjYvMLC5jsfrDJeR0O2X
0On3e54P0H+92n/+wTy6w2U/Wjtxa+7ACTI9/+Z0n3Bu30sXzz850vvlWS3l
fI+C53z3fO8pTdkuL54fpb5wqGwni+c357I4nl+S8ByeqJyHDM9zOZ4/scVz
4Q4nr5+3puAO9yfi+Y7i1Uz07UoWVWxj02HzzDwZoWlPzubqsnlKYK5d0XV1
CV3eQ5dV7tDd4QJj71BIHqDj+jnc763eZagJrt7YC1cYF8/LaOcJSC5f8J7i
RjIAQjwvqV+Sle3a6Jwq26HbhDJSVu3t8UcQzzEniOK5lhOk4fnCAnSbaxzP
Mfd8cson4TmNPo8LPNetn0ciHjNfYiOelyTD8xRXKe+noG+/ZjCIUwboJ/TO
Rahv/9b+dkjr47D5OzmZpGk3MLiJeaYNnsM3GJxb5uvn7NucCEUQz9s9QMKE
i6FYdbHFc0/3wDLqi+q7wveeuIGsn1RPvWgjZbC4cUPF81LSTIpoYCOewyfC
p8MXkZXtfaPxofF4XUsAE8/Rtn1kMorKdmrTAXi+7KLfguYLJ+E51MxXaNvO
tEYzBM+9KeK54g7XYnSHW4mWifXz1Mzb7XfPU8xWs1s/NwzQFYM4zb99e3vc
5nZI6+Ow+Xt40kjTrrJ5yWuxuULlTwyXjtBrTZbQlRh0QehXChdO/j5gqm//
PqtP4PmPV1YAscXofN8ZFncugtV0yvZz0f1Z0c+PjSiJ53zxnCjbD13ULZ6f
zyODe8DzX6/2w4OBh3Sb4/npa125pYvCo4lZw93V4bkwbzeun6O+3cYdLgme
G4LVVDxP2R3Ozr9dGaBHZH37lvjZ/Wpzy/52cE6ang+TzS2G5mv6y3yMPjw2
YUroOEZfjMb1eJ5g/u2hRJ0rAHd68QuPy7vcPhBr7tm8jYnnzydLmkjnaXqV
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
U9IYX546h3je0z8Y5XJN/Pbhux4Y8nZRffvi0hTFc2WAHorHmXm7Qd8+pDNv
V6PPm4V5uxmeW2k1d7R+bqpvlxckf1Nun0zqJP9UNoc6s7W1tbs/TbtjLKqp
V9RMYXMLHufXijmem6yfk1dKKZ67OKGLZ4DheYt3ZIJMz6F76eoNKalqUCQ7
OJ7nl/mguWLidmV6XiEM20lXqYzO88qIsr2owtdOX8/08sXz5zWeipde+Et5
qUzAY6QeHSGqbI97+/zkWer3UWU7Lp6vznNfuPGpgJyqtkn1RcvLAY+HhJ4D
nnNx+7DBvF12h7NaP2/U69trqDuccf3cqDhKGka5o/XzJPFq29tB+f9/JlXU
N8XmuyiPGVZR7c+O6m3msfkpypgYBynY3Bhu/sSEzdnQXMzK7+PONV73CJwW
1SzBdb90Ei74LVzwfnZJtA6QTsbohhm6wPPTZPGc4Pm5e/Manh9r/y5r9PBV
sj++5ziZiX/+8wiQOI7O95zihu1nydb5V1kMzzXPdskU7uh1pmz/gXq2HzzX
d+ae5tmeU7B2mfvCnfx94BZ9Ai89Goen7jTieY02PYcnJ//FUg5/Eh5zdzgl
Xs10/bxjp3jOCd1qer4DPLcYoCt4vrrusHk6nVAodPny5cOHDy8tLcFv6+vr
r1+/jn+0ubn5ySefxONx/K3D5tZsnpTKl+FaWAoCveI1PhmAi/6RFtcmxuiI
5y3t3ROhpU6Pv77F09YVmJyN9w8DnntLaeg51AFXL0lVu5nvvvt0SCT5iiID
hZdsnTcTcU5V+8ZDSdmuRKpB9egeXGaj8+mEpGxPCGX7IO85wysxL32WAM9X
ZDx/Rb59+Ka6dObtqa+f6/E80a3PVntTeL47fTvxb1dunEzqJF+fzdva2s6c
OXP06FGoHsGg1nJD7wTlpby83PSz7P80fY9cVFOvqJnJ5hKSy1eKeC6c29kA
nf2wiMMzABQMLNzhGQ4tJlDcLlLVWhDPhxmeP670qXgu7Z4/JLvnpLmVZyhQ
PMtp1EVNJ1G2w6dD98584aTF80oJz0cmiElIo+bRkXC1e+BhD49NWS2eUzxf
3ND8Mymee2U8H9Xjuak7nNX6eaP1+nkqfh0pitt3v37+h8PmtmxuLI/wwf/k
5+LFi6l8yodwUqy3Hzibm7jASWyOrA0YDjxe1ryBF3SPUAaVC54ZuB6UTgpO
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
ecOGPrpXkx7BBe0rFNWq9o1HpT7A87I6MhZBz3b4soPjdPG8xtvQGkChkZw+
Cf9Yi9G4p9fnImr8oQj5djT/TObZPhnQj861YAvq3F4j8Dyu4vmQAc93kX7+
u5R+bppHafpiprFapq5vZwP0P7ZD8v//TKqowOYncmqf1m8kvYCyV6SjfB2r
8ggf+dlnn2F2WIqfkqkn9XrrsLmRzQuql+zYvNUEzKvo1LiqfZNe5Lcap0sf
/4Di+W8Uzwtf6sXtNwieH7vSzxbPf23f90v79xdncev8819G9mcRBoeLcfpZ
jdPl0bkuT+2alqcmRueqKZwcqXaxE55SXDy3wXNccSp4sSS7wz13qfr22k4T
dziyfs717d2Svt0k+lxxh9PjeYrp50nj1VbWHDZPp7O9vW3cXdra2hIGGuI4
bG7F5rKgXRiVI5ibUjlmf5td7GMWw5MW0/NuT6+/0UWyfT39IbiLS7myvaad
mMLdzHPnV0wKJMcZuhijl9Ims6R+iZnC0bjzdr5BiUVDZwpHle0TQtnOc4K6
PEzZDmwOT52G5+vq9Hxdij7n2Wpa+rkuXi0RFObtlnieUKPPDebtAs8rUzA7
2lm8mv3tkNYndTa30rTD+wHMxet78vnQ2PwPs6KaSkXNPDa3BXM7QreHdMxW
U8Tt8FDhm4InpMMzDH2IgudA0H1meE5CzCmel5hNzx/XYeL5K6OyvXOQyY0G
RuND45qyfYK+konpk/A883iLGBudz+lG59bKdq0wktzzgEs/PR/R47kYoPdK
+nZl/dxlu35+fWT4roXiSMFzey/NnaWfO2yObG7zdeTyODEx0dTUhG+Hw2HA
T6Md3B8ZWlHtT4r1NhPYvGwnbF4rsbli0s4VlffQBU4StMtDc5nKBZJX49VB
mBQveBvfKdM6fKJuel77KrdskTi302C1I9kuDD0HcD54ru+rY+37T/V9e36W
ZJ1/T/B8z8kZI5jvPcN2z8no/KDJ6Nw0Tw1N4WyU7fBkIp6fvtbJ1vb1eI7u
ylbr5/Aty+5wL1rI/yVt/XzAEs9Tz1Z7I/r2qMPmGXo+BDbHBWot1UxhcxOT
dlXQrh+a68BcR+XQhJte/AMWw1MCz9EajgarETx39/gbWjy1Td7uvmCrh2hj
Kuv98POlsJzskgN3F1aS3AdsOPkkaAPd4cppk1lUyU3hekhOeqfIOjc1hePK
drp4nmigo3Pq2U6eQ2rdHGtlvnCTK5LfkfT8aC9ZWK+f69zhcP08EKij/acR
z0W2mmbePjz8KDU831G8mjZAt78d0vq8JpvPz89DowhfZJUf+U+VXhE+TB4P
fYCdpDgZw+ZRI5ubDM1NwXynkK7Dc7SGw2A1eHgi97xvKBRcICVrcCRSWesF
am51hwbHSEcE3VEXxXPcPX9U6sNWHJrSUp57Dl2ZuKDLhc4WCil6tj+lynbo
u8ToHF/P1Cnb54Sy3SviLfwj0/rR+Tr+NOkf7DVTtmNhZLaZ+t1zgedKttou
18+3TNbPTfH8za+fO2y+IzYHHt+zZ8/i4iKAZ1FRUU5ODr7fqagpHofNk7A5
Ds0twVxF8ppO7XqJb0i0Dp9Vwafnut1ziufHL3f+62LnkfMdx6+Pnbg1h57t
h36b/fLkCOL53w6yxPN9ZxiVo4X7vrNsdM7y1I5qeWpHzPLUmCmchbI9GyPV
6POZfYf8s8I/LuK57Nz+xKBvN/Fvt04/N7rDKdHnOnc4Q7Za0vVz6/Rznb7d
YfNMPX/5y1/Q3BKPw+ZGNl9YCpoNzRe1VWtO5THza45eDNJVPH+FeN7lau9u
dHXXNXteNnr6AuEaunhe10ZeoIOCcKeQzMRv5rsLKknpEAuVZH2y/hUZndP1
yZvy6HwADdtp0aAVQzaFY3Hn0uI5H50nMMYXnsAQtOuWeL4i8Nx8/Tw2t8m7
UKJvp+nny5FBPZ6busO1KebtPT23o9FyCzxPxR3Ozr9duR0yqZN8TTYvKCj4
RH82NzfFnyq94v79+3t6eqz+9IM6WFFFUf3g2dyO0CVI16zhhHM7PCr8ITIR
iuCLh71DIeILJ+G5qzsIEA1NEXRH0Cm19ccAsQHPAbexk5SrJToMY5MGHdpT
WjmJZ3vHZl4Zgfryhml8SRO3gQD84eujsp15ti9saSqj5dhiJIbK9uHRSXn9
RyjbcXSuebbrUy30uefjejw31bcb08+F3KjFkH5eI62fvz08d9h8R2wO58WL
F4cOHfr222+PHj06OzuL73QqaooHYOTKlStyE5vxbP7Yms1lk3bB5kY1u5iY
y2D+stPyquVvMDx3aXie+2wCHgw8sIt3ibj9XxdcuHh+Jnf++6y+r35tP3Cq
7/BVolHfe2LkH98zQt9zcgYIfa/IPT/Dts73Z0dx63y/NDoXpnDHeJ7a/uPt
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
Xiy9nmmzCpRSvJrD5g6bv83jsPmzpGxuIWgXQ3MdmJtReRNc3s3q1rCC57g0
JAbov+V2Fda8upo/cfJK59ELrqMXOg7TxfMDJ9q//hXxfPUIx/O/H2z79x97
BZsLt/avs6IH+OicKdsvM1M4kaf2661V0zw1oWw/frX/X1TZLvD8brlu8VyH
54b1c5t4tSp9+nlhuQ/N20m2mpl5e68ezzXzdpv0853EqzlsnqnHYfPU2LxF
YXO9Bdwc77JmOZXLSD6FKEov+C3i+YxE6OyJ7R/sCc3PtrR3Nrd11Td3A567
Ov3t3iBwdMkLT20bmeYAble2hDH0HIow1BMoLI/rWGIvjs5LcXRe4AaQd/WS
gTu+oIeL54op3Bg3hZsmcedoRNwDT+xkKLoYxcXzOPyDBueW9Mp28eyZ4Lm5
O5wOz0OSeTvB80CgVm/errjDsWHQ8HCeWD9PQd9uE6/GpkL2t0NaH4fN38lx
2PzNErrd9NyA5+7BZYHnUPSeA54/Jnhe3hQmi+ctpHGFUin6MVlxBE0XNJzP
apiyXcRQkkg1agqHynY0hYNq2TsU0pTt0Tg8PPIE9vu4st3KFE6JVNPwXDi3
+wMt1nhuXD831bcr6+cs/XyG69tnZ/IN+vbXxHNG6A6bO2z+No/D5uZsfq9b
NWnXsbk2NH8pjM44mCs8XvjcBxcQKFzwRrUrDB8DH1zL18+B9OEr3yoayrnb
fS1vEB7neWnx/JfL/SdvEzz/6tf2g9mjP10joH3g3Cyg9ydHeoHHkc0VWfu+
02x0TpTtxjy1W1TZflyXp3ZBylO7+Igr2/MX5MVzWdkunlhTPEd9+yXzeDW+
fi7M25+o5u2qvp2at1c3Eh2sUd++IzxX/NsdNs/U47C5PZujSbveCG7RMPsw
grmC5BP8mqTvnOYSd80gjojbu1yjE8PDY2Ni8byuyePpD7Z7Q4DSxZWel67p
1r7YixaC3sDmpU1M1v6EFhOWdU77zKIXZLx+hyrbWdz5oDY6J6ZwzX4xOh/T
8tTY6Jwr2xOL/CmFJzMATbJO2S7j+aoZnuOSvvpqhrR+rjNv93qfRyIea/N2
NgwaHs43Wz9/IeF5KvFqrO20vx3S+jhs/k6Ow+YpX2vSZUfoUvQ5WsMlJkMR
KP7wRLW7h6FqQdPS1RNS8BzKHfTn5Q009BzwvDFMUtWoKZzOoZd2s4jn0MBD
w0lG5zTu3KBsD5gr270BGnce9/b5WyVluxidm5nC6ZTt4mcH4DnPPUc8tzJv
H0zm324ZrzajWz+vsFg/L0oNz0307Q6bO2z+No/D5vZsbr9srgzNNTD3kqu0
jlGnfMFTWlo7BR8DH1wnCJ0O0G8VEjy//XRCWTw/eWPsJF08Z7btV1YAt/9B
Ddu/PEeH5nRuToLVaO75V1k6PAeQF3lq8uj827N90uh89bzeFO6spGy/Zaps
Tw3PLeLVJHc4U/N2gztc/2jy9fMU089lPI+sOmyemcfJUBNsvpaczZcs2HyW
zz4UNkcqJ/uDy5H+YKiTvj0hBuj0g2eQ0BfDE53dLR1drpn5GW/fQEt7V1Nr
d0OLp67Z6xuLtHlCcDs/q/RUu6ZbemK4df6QyNpZJSmmYA7VmLy+R6sH4Plt
ybMdI9XE6Lx7kJjCldd4sSAwUzg6OoenGkfng4EQeWKjcfqsysr2SUs859Hn
8J9EuMMZXtMQPkjBeByfqAnJHc7KvL0tmTvcbvBcuR0yqZN02PydnMzOUPtz
wDwpoSt4nlhaSUzORBHPe4dmpudJ6wLUDOwMBA0cTfCctuhQ98rrKZ4Xussa
wkLZzmyNac0UHSz0rtBxoSlcId0iJMp2fwxr5tBEnJnCDUdQaESU7XR0jv6Z
wdmIi/rXacr2V2uG0bmkbI8vxPTKdhRc6cXtKeK5cf3cUt++Ei3Tp58rfh1W
Xpopxas5bO6w+ds8TobaLti8WmFzDubI5jgxBwBHGIf6+bI93NpLFiTh7ft0
gC7wvJ4TOny1Z7VLVNnefevJxLWCCfhGfvnNdSTbBXh+9u48+sJ9dYzgOYD2
Z0d7gc0//XlEgPmXZ9ncHJXtctz590LZbjs6Py+Nzq8+Xjt+rf9fFzs1Zbsh
Uk3BcyVbDd3hihtN/NtxL8DUvF1dP9+VO5xV+rnRIM5h80w9TobaG2VzczDn
4FkBTykldHWADp8LX2piagjxfHhs1NXe2dIGeO4myUHN3sHRiMsdKnnhqajz
w41f1UpG59cfdRdWL8lDc2EsScpvx+ZDw+I5UbZz/2EcnbeZ5KltjUyhst1L
n9s4xXP4N9Up26Pq02iJ55K+XQzQRfp5MGaC58r6uduwTQl4XiKvn0t4ntQd
TtdzKrdDJnWSDpu/k5PZGWpviM01Hl/llzWhm+M5fAtTEp5P6fDcD3gOjRA0
RV3URbOsbjq3yP2w1FeFynbaxJYKMBfTEO72Ax9M4s7rpzVlO407b3UH4esD
nos9IFS209E5eTJxdK4o25U8NVNluyy7Wo6IYDW3+CGSmr79deLVXgfPNUL/
Y3tGvh0yqaI6bP4eHidDTWHzguol9DGzZ3OjoF2AOerYBZi7KJW39ZFCCr8+
p3guBujApELiXtW++bCcYOzF3K775YsXclniOQDysSv9F/LWTtyaA5Qmtu05
s//MnkVTuM+Pz+zlE/MvJTDfn02u/6CL53LcuchTU7fOH6ijc6Fsv1msjc5v
aMr2Bcvpuc68/ZWM55fudcP/IuYOR9PPX+rd4Yzr5yhYVfH8hX79PFn6uZV/
u8PmmXoyQ9O++KexuUWA2oI+IIzZ7XI218B8OdIfCNQjcgYCdfArQjpwqB7S
AVFn4AsODrlx8Xxmfs7V0dXS3l3b2A69X2tXYCRILNafUWU7VMvKlvCNPHfu
kyGoxlA6sDIro3NcPL9T6G72bjJlO30dTxmdD8uj8zk2OqfKdtJz0tc9+Oh8
RefZrsNz2RpOCoiX3eFemaSfzxJxO0s/35l5ezRapcfzVNzh1J7T/nZI6+Ow
+Ts5H4ym/XXBfNX6MnC6iueAwNOzy/Dgh8juOcHzkYmojOcA0YDS0Avh4jm0
lLh4/qR6iqSZt5A6CdUSIV0QulgnfM7jzslLmtwUDuPOUdmOcedM2e4hyvbB
wAw8sdNkdO7Rjc4pnvcPiTw1xRROG53LL/AarOGS4rlVvJqVvl0Xryatnyvp
51Z4bhmv5rC5w+Zv8ziadqoC2gmbt2tsjoJ2edNcTMyLKnxkXN6ngXk7vRih
N3BCp5COhA5fEMAf8RwXzxHPiS/cxY5frvRnP1w7dn2OKduvktE5OsLhxFzT
tEuEvpd6tn/6k2QKJ/LU0LD9V7PReQEZnaMp3FHFFO45U7bTJ/kVPsn5Rms4
W307/EcSPy+qU3CHY3gumbcPjMWrG/04QPcMLst4btS328SrOWyeqeeDZPP1
N83mM5zN5aE56aaQxIHKIxHomgKhUBtcgtD9gXpB6LH49GZsZoPj+fjEyMj4
eGtHl6u9u9HlqW/2tnQGWj3TJS88Tys8VS3TZHReQEbn2GfiBd2mGAYR4U3r
xv1iH3zYMzo6h4oq4s7Z1rl1nho1hUMj4gjNCbJStrPnUz8617LV5PVzSug+
aWa0oLnD8Zc1gqEuKzw3mLenvn5uGa9mfzuk9XHY/J0ch813A+av5GuV/Krj
dA3PgXlbO9zcHS6IuedEXNTiHQY8n0sMjkYqa4mnOqaqicVzaNTlxXMoj9Bc
Ea8kXjlF2cQ8tbxSH3x8mX50LuLOhWf79LzknzkThX9KeFQ07txkdK43hVs0
msLFtPDNoMEaLkU8t9e3N+v17dr6OVwr0ae7XT/X9O0Omzts/jbPh8zmT3fI
5i+s2VxWsyNayuNyQuUD5CmFC96wIvSKljB8WbF4Dnh+t2zx9LUugufnibL9
58v9WQ/XMPH823Oj32TP/uP7tn8/3AsM/lUW4fEvz1FI1xO6/ej827Mko02M
zrOl0bnOFE6KO4d/4vNU2X4+dyAVPH8iBdUJ/3bEc+P6ueoOJ+G5sn4u4/mu
188dNs/U47B56mwuBahRMNexeUhiczY0R5E2gLnUR/npFZAJnUJ6QzDYtRmf
3ojNLC6Nd3Y3d3a5xgieT8Aj9/b5Oj3+2iZPc4e/pWvqWaX7yXPyolxeme9m
vru4bglbTew2ydWi+XOW1C/dpJ7tL1zhFm4Kh+bDYnRukqdGnvZEn480vZ2e
ADEijmhsHoI2nj6lqeO5Gq9mguc4MwrK7nDwLOnx3GvQtxM8t00/r5Dw3CRe
zf52sDnb29tbW1vJP+7dHYfN38lx2HxnbK5DcrPLgOfyAJ1kq0XiA4Eg7v4E
xiOTgOcjFM95qprXsHgOrSk0qJj+I3O60B2R2TodncPHv2zXTOH6aZ4aUbbX
eBtaA+MzrFq2C/9M+jPIRR9baE6fpzY5bJ6nFteNznmMhQ2eWxG6WbxawlTf
rsarDdutn9sM0E0M4l6Hzd/zouqw+Xt4PiA2f/nabN5mxuayoJ0PzcuElJ2C
OaHyQcKYcJkSOkJ6QTl7qoFYgV5zcokv3PXCCcBz4Qv3r0v9x2/Off1r+75f
2r85O4pb55//MoIKdpyVI5WL9XO70flNdXQu8tRyAM/p6PxXOjrX4s7583ye
L54zPFdeA7FcH9hQ4tU0NYK1O5wJnpumn08a9O3K+rnBv/112Pw9r7cf+HHY
XDSBNkRpweZzejYPSoL2cbFjTgFTtE94+ZDT4Y+40P05PNvApIjnE1ODAs97
Bwbhwbt7h+qbPbWNnr5AuLrJB3heVuuDKgrQfTPPnV8xWSHjeYuG5/D+okri
2U5M4bybbOvcdHSu5qklZhYT8uhcj+di8XxJwnOz59PwQoc+/XxBv3Spw3OP
nXl7p4TnWvo54rlZ+rkxXo00nPa3g9WBmnb58uXy8nLxHgDhEydOfPfddzk5
OWtra69/Y77+cdj8nRyHzZOyuQHMLajcBM/XjXg+PbMMpamLCssFnnf1hip5
6HnfKFs8hx6psIJMwx+V+qrpfOeFns3LuQCpgnq2w4cBngtTOJGnNjShU7aj
0EhET0KRnJ4NU+H9UIQ82nWLPLWwaZ6aYUNqWu/c/jr69na9vl2JVzNdPy/R
y42S4/mu2Vwpqu9hRXXY/D08Dpvvhs3NjOAapaF5ef00Ds3FxBzpEi9TSH9S
SbTciOdV7ZtPXzJfOMDz3wsn0Lb9cLbrCE08//UGUbbvP9VHss6pYbslnkuj
c12emjQ6hy9FRufX1dE5y1N7yEbnl/K10Tk81TeeLqCynSyem+G5ukEgPeFM
365PP8dFfrF+rpq3y9lqfp2+XYfnO0w/X94tm7//9fYDPw6bvx6bz+rZnNma
QftkBuaDhotxeijU6vE+9wcaYvHJTSpup3jeIvC8pb2r0dVd1+x52ehp907D
jfy0wtPUHYZKCHh+K99dWDn1rG5Jbi9R344zIBydV4k8tSFtdD44Fi+VRudS
nho0nImRyQjbOl8WW+fkuYUndliKVDNbPDfiubp+bpZ+jn0pe4nDH2j0WJq3
q+vnwh3ONv1c9W+3vx1Mz9jY2MmTJ/ft2yfK2srKyoEDByYnJxOJRF5e3q1b
t97U7fk6x2Hzd3IcNt/h0DwZmHM8Nw7Q8TmEa2omTPDcy/B8eCIypcdzeXpe
RPH8ac0Ubkc+1+8EodExlk1oX/PLfMwUjhppipc0Udleicr2uURwfqtvaIaO
zkWems9kdG6ep0ZG51bKdvyxIlnDTb62vr1Nr2/X1s/N0s9LDennSfTtu2Nz
pai+nxXVYfP38Dhs/gbY3K2yuTY0l8C8W38pnA4fiQZxxS+n8Al/VD6JeH7n
6cTFu8wX7qcLHYezO07dmUdTuO9/m90HeH6o7e+U0D/7eYRRuSRuF1vnQPFk
dH5JHZ0Tw3bb0flx09E5Xzw3VbZreG7+nKvr5xXS+rnAc3gqEM8fVyrm7TET
PKfucFzfnkhR3747Nk+LevuBH4fNX5vNZ7gKUWZz3DR/TrsmuWWyugb9gVrA
8+lgJ8HzWHAjNjs5NUhCz7tdswtzrvbO5rbOmvq22kZ3c4fvZbMPPdsBtEtr
p+8UEvQGAC+oJC/iQU1Gj6NianMERaNQjM751jm6G2FZaO4KWo3OQ4uJDjqQ
GgiE8BmWn1uzxXO15TZdP7cwb18Q7nAkXo2bt6fgDrf79XP728H0PHjwoKOj
4/79+4LNe3t7z549i2/Pz8/v3bv3Tdyar3scNn8nJ73YfPkdsrklmK+sSZf0
/jXdAJ0S+vDoJJ1Q+5aisQUhbm/R8BxDz1v49LzbF2voCkOzdJdbw2HTXt7C
CiY0XXBh2SSmcM3MFK6uI0zz1JiRJo0792tx53R0jv6Z8BgAz6dmwvR1g25l
dK6awkmj801F2a6NzjXn9uWIz2J6bu/f7rX2b9fp22ft0s+twih1/u27Y3Ol
qL6fFdVh8/fwOGyelM0rkrG5WDYXLnBiaM7AnBIlFE/zi0N6XWcY8byyJUxe
+ZTw/MFzYtt+4krnj2fribI9hynbMU/t0OWVvSfIAF0QOoL5PpqtBqi+Pzv6
n8at82t0dE5N4f55ps9kdJ6fZHQuFs9JpJphdJ4Uz9G/3dwdTjJvRzw3usN5
/JbucHbxanr/9uWV3bB5WtTbD/z89a9//eSTT9I9Q+0ts7mJEVxct2yu3zSX
lwEtr0ikmz7nBM83Y/8/e+/x3Na1tX1+/4anPeiqHvRI4676qkc9uNVzDfu9
9/Pr8NqWrfBeS7IVbCtZkQpUTpSsTEpiziRIBCIngohMiIwIJCUSgeq19z5n
Y58AEJRIkKL3ql0yTUE44Dk4C/vHZ61nhZcBz1emyFQ1OOeh8VG90awdsvRr
rT0Dts5+e3OXvbHDrnemIHlCIm3qiwChA4DXd0YgP7TphTG+kKtbWencgKVz
UQNyhdjKdmaemiidx0TpHBY5z3CSxf18sfGcmhKviedL5fB8TvyNRwLjeTSb
C5fHc9xNKfciltW3S8erydrP38puh8orMFk212g0d+7cIV+vrKzADZXL5Tbi
7vyk4Gy+JbFr1y54A9CZPpzNyxa0q7D5kpTN8QfNgiqew8sA8nUO+wCBHW5/
OJ6cTWWF4nbRGs7qInjusI2kyFQ1sm9vHYgCcQN3k8m8ncZiznytKaZN+Kvn
WDqH/aqQNsWKI7tXMIXzhFhTOJQqZ1LZuXQWXhK8sOBYOL1UtOOgpnDvluWG
7RjPi9K5rLIdO7ezg9UEPK9AQFe2n5erb89kWjGef8R4NUToH1an2NthXf3m
NKluz4zK2Xwbxu7du7/EQb/D2fwT2ZwtaC+K5n6Ek2WWDVtuksZzSJhveyIk
r4p4bn3cOldT5z113XIUV7Yfv+Y5eGH4pxOmf18cO3oTSeE/nhn95rgbEfpB
I8A46jQ/hxaRzveU7jr/Q5TO950ynXu8iPBclM7pPDV51zlb2S4dqfaiNJ4r
xquhc15sPyfTz9XM25tZdzh8Vq3Ylpm2nxM8V69vZ/FcMV7t49icxDbPt3/z
4Lr5RrA5mQJG2XwiHjczBe0+sR57WBQyVJcnHtc78WnH6rlw2sMRHzCsx+sM
jY/pjZZBg6VPa+sZsJucEcDztx0OuMGNnqzOufKsxX//hb15IEllIMgejHQe
hr+lXedEOncGBcfIMvPU4miemkw6F/bzssr2UsPpSuG5Yvo5W98uTD/P5SLi
bLUO8dcdfrX2cxmeN601Xk0o1/yAGfatGF988UWFNw7L5i0tLXV1deTr1dVV
yGzboWGHs/mWBNfNK2bzcnK5GqGXqm9fdnn8BsYajji3w2kMTaKCc4tbBc9p
cfuLFj+ReGBPRSqOyK80SUMQ7GOJKRxs8gHnadocxuPODTbBFG6SmsLZSaqM
zaazYVE6j0/PZQie4x/T4yXSeagC6VxS2f4JeD4sZsuPGK9Wqv1cieeI0IHN
Py6jfmCS6vbMqJzNt2Fw3ZxM+FoPm68gNreIxmUMm5Ox5mR0mqygnei8ZZY9
gDw9ZHhO+oYe1CN6vfXcW9c8d+am5fcrhuO4sv33m+PEsx0QG1j7UO3C/gvI
uf2ro+59uOV8D2bzPeclhu2SrnMsnf/OSOdHr40Bm19YSzp/oJDOi5Xt3QKe
qxa3K8erwZmn08/htJMTLjFvt4nm7Q3l8BxNPx9b9/RzwuY03+7atesj2Hx7
5tu/eXA23zg2L05PI83mCtHcLUoYRMWgy4GXC6vndgf2hYvFrVg4jq9kp71+
u8WqHx5xOoc9QmW71q4zB/r0Abh/NaYYfBIZh7MvWtG4tLvPbS/awpCWIVG/
xr/Zo13nTxr9EsN2XxHPqSlcUTqXz1NDTkdwBenGnp5hNem8Ijwv0X7OusPh
6ef4xFLzdjyQrrw7nGT6uaL9XFLf/oFJaxD0dhgbG3sgDfgOe6fIdPNbt26R
r9+/f//tt99u9m1bSXA235LgbF4Rm6uI5koeL+ZsVUInnz6y0efRqRScT8Bz
OCGCNZw49LxfHwCgJngO2U9jEYrbn4vWcEQ6b8Rg3koVEPPKm+4IPOzxazv8
EyuqbM+SynZ23LkgnU+mNaJ/piidw1n1iblRZZ6awhVTOe68FJ7T3nO2vl2V
0D1l69vXGK82GqoTx6uVaT8XCL0Mm1eeVLdnRuVsvg2Ds3lFbD6kwuZ9MjZ3
SthcIpozbO7ELKm64DHweJOI50xxO56qVme7+dSLJp7TyvZaz+GLw3tPmg6c
HT5+B7H2/otTbOM5YvOzRTbfI3adA8IfBjy/QU3hsHR+Q5DOT5J5agrp/NyD
8ZLS+S2Vc67E81cKPH/NuMMRAZ3iueAOV9q8HeG5T4rnooBuHUnR9nMy/Vy9
vj0OH+IFNt/u3r2b3g6fe779mwdn801jc9psLtsauRget+Nlw8uBHzASjxsw
nncAnsNzwvPDhs1i05mtetewi1S2t3Vr+wbtWlOgtcfR1OUwuVNwj6PK9t4I
wfNnrWFI1yR7N+F9JiSK5oGkzLDdSlwpsAwE2QDyQHGeWkKcpzZDpHM6JEhk
cxHPQ+NRNel8HXhOBfS5+YgSz0Xz9ihxh3Oqu8M5pGZHqu3nyvr2tlK3A2zD
9NKA77CPZNnc5XKdOnWKfB0Ohw8fPrwp9+o6g7P5lgRn849jczmYL8uOr1ri
vqiG547YVBp+NF8wQazhojMolRE879MHRjCeO7DKYxSd28lgNdjBtupEMDcU
jX36bYIpXEO7n6RN6tlux6ZwdJ4aHMvti+HRk4FZVNm+IsxTm5knhpnkE8fj
dUvmqWVVhlaIqa8knuPe88rxfM36dpX280ymBY9Xuy0dryafdsEK6GVq2itP
qtszo3I234bB2Xwj2by9BJtjd3GHlMpdGCeLK4geYMON5/Bv2zRRYttO8Lyx
X7Btv9cwWVPn/eOq4ZdzmqM15mNXPYcwnv94wvRr7RSwNnVu//r30R/OZb5n
2JztOledp0ak84MXhgXp/CmSzq+I0vnNhiV21jmL55ewdA7vgWedwjmvBM9l
5u10+rkcz5n2cxbPjUo8F9vPiYCu2n4u829Plq5p/9zz7d88OJtvNJtPptIj
IpsHpAXYKlQu6hewVPHcRvB8PjlpselNFoNz2K0zmvsGDf1ae9+gAzacQNNN
nY5+Ywxuc707+7Yncu+F/dEbH+wwSd6gZe1Nmvn7uOu8sTeid2XJYCAb3mei
hpexnFZqCkel8xgjneMhQax0nqOmcArpvFI8hzXic0rxfE6B50RAD4vD6Uq1
nyvr2yXTz2Xj1crfDmWCZfNcLrd3796RkRH44u7du/X1wmg2oOOFhYVPu0E/
PuDo//v/bfw//9/58uv/+H+CnM03MDibfxSbq4P5zHxiTUJn8dzl8RM8D47F
4KzCCQFMNtmCQM2QzYCg23ocBlsMmBq2QJD3IAEahxGe19WjwWqosh17aSrZ
HHImkc6JKZyNqWzv0wXoPLUI9ujQ6LB0Hk3NprP+0YgonS9T6Vw2T03S0ZOV
VLYzbF4ez1l3OLa+PfhR9e0fMV5NENA/rE6XuR3KB02q2zOjws72f/u/2tfM
qLA4m1ctOJtvIJuTnught0qzOQVzl5TK3WSNoj8JnqPKdi/aXta3o6lqj7Bz
O2TRt33ohV15aL39avLMTcvRC5ojFw1HasyXni0dxHh+qGaMFLfvOT1K1PMf
zyM2Jy3nxBFuz9midC43hWOk8xMVSOeSeWqvZ8XT/p6edornLytTz8m1oObt
T1vCEjw3y93h4Pz0W5KCeTvz2w+hvr38eDVC6MDmmQ3oN9+e+fZvHpzNN4HN
PWJndEBa0O4UqZxFcou4NbIw6jnpPReK2+GZ6VQ1j9flHB7RG629A8Z+nWPI
GjQ5483djrcdjl4DcvCAHAsAfue5DTKz8Ns8UqKpQ1miaSBJ8LypL2JwC3jO
Np5LpPN4Sekcb+9p47lgCqcqnS8oektlNav0VBM8h/eYtM5zhpkrVAme26W1
mhJ3OGV9e/nboUywbA5hNpu/++67AwcOnDt3bnl5mXxz3759LpfrE+7OTwrO
5lsSnM0/otlcFczHwyELBtgRnwtOnfS1SEvcmd5zWtwO53YunRs0IEx2++KQ
x0ZG02SqmsOXglwHWyC7v7iHBzxv1SZhH0W3sgjPh8SiRBHPYU+FGoK8wq80
WVM4NE8NT7hg/DNzc+ksmacGL4ydp/YJ0rls6HlYiudlBPQ1x6uZKhiv9rzs
eLVXG8LmH7ZlRuVsvg2Ds/lmszktaGe1corkw8yC7zuJeq4obn/bgyZiPG1F
fdm3nnlvvkR4fuQCqmz//brn9P0ZAOqfTph+vjgGrH24doFI59+dSvyArdp/
PF/E829PjJaZp/bLlTFhnlpZ6Rx1nUsr20nXOXGEK1XZzuJ5aQF9WTb9nJz5
LsYdDvD8Vau/6A4nbeovhec92oCyvn1+I9j8w7bMt3/z4Gy+4WxOyJExgqPk
6GT2QlZmO0RKCuFrKyZ3p8wazuHsSKb871cSIz6r2ap3j7gNZoveZBvQOzQ6
p8MTNzricPMCnnfrozrXytMmv1jWjspsmrRICaIGkvWdqO4d1XDSced0pNpY
zjaSKjFPTSKd431+XjzVWYV0rjjJJfFcIqAzeD6v2KyK7nAinovt531MT2XJ
9vNS49XK3w7rikKhsK0MNDibb0lwNv+0gnbhgBMimLMLvgmrKKYzeF6crbb0
Hs7tkFmwhpuMpUhlu8sbZ6eq+SZyrC9cqyaKGs9b/LB96sJWxmgHS5Z5hdga
k8p22GfCnt8sjrogZh3IFK7X2dHnpLVGxBSOjDsn89Tg9CZoZXuJrnOmXoiW
DKlXtmM815fB87UM4jZ2vFrRv/1T2FwW2y2jcjbfhsHZ/OPYvLcMmzMm7VY1
NpdQ+ZhgMA7LLcVzmTVcmy6JBga98l2ts91/PXmZVLbjxvMLj2YInv94wrTv
zPDh6wtfH3eTsnYBzC+IZe24sp2YwsFjSGX7kRvFeWon7y/++zyep8ZI58gU
roR0/kDadU4d4dZsPGfd4eoZAf2tRnCHK85WE/feAp6Xd4cT+0xl7eelxqt9
CpvLYrvl27957Nq16+zZs7CNJ//L2VzG5oQW5+ajm8nmpJhQBc/hnwfx3PNA
cHB5JTI7P2q2ak0WvcszbDBZNFpj74BFo3N5x9IGe7yp0/Gm3TFgTTX2RpB0
/sz2qnseGQ7TEs0hITk8xaZweNw5ajw3iR2URAai89TGJPPU0FXw+BOCdI62
+vRsZ+FUBxnD9jUbz1V34+ScS4vblXiORp9nc0LvAP7FhdIdrtT0c+V4tR7Z
7fApO8ntFpzNtyRIRqVTKTmbfxybWwRujeNfkIaUqA5JfRw4fW5KxPMlFs+B
godMNoTnoYgnENXoHf06R2AiPTmVGxR84YLecbSZlDWeP29GeE5MjMn2FTb2
SOzAekeHPgmPgUfSiiPyK02vaAonjDufzoUm00Jleyw9l8nBhUan1+PHle3v
SWX7+OSoWZDOk0yxkATPMZur4zkdeh6LO9TwfKKK49VofXvDh9UZ9nbYSRmV
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
S+I57FcJnsMbDy4BIyop8TwSi1tFd7j+sme+WKuZyWykF9x2C87mGxWqSbXC
jMrZfB1sjg9FStZFNmdIfAWt99JF8Vwg9MlRRkBHn01pBs9n01l8ep0avQvw
fHIqb3bGAc97dQHIeGhLT/G8AeF5U19EY0eNgX0YzyGFkqlqsLesq0fmw32m
oinc8KhKZXtstgAsDhfUF0zAOcfSOapsl3WdSwzbVbp4Ss46Z6VzaeN5JXge
FB1R2Pp2l6K+vWT7udp4tVbO5pzNPzHWlW85m28Um3cPoaqhelwRVIbNh6Vs
rhMhkSz4GrARFsLzsSKek4GVQJ1kIga8gDe96HVerbPea5g8e8t6+obl96uW
ozXm49c8R2vHfsJd51/+gtgcABz+/PFsYn8NqmbffylDIR2AXZDOrynmqYnS
+cm70xeYeWrXXiLp/AaWzuFysF3nSDovOsK9K+K5ouVcVTpX4vmbsnjeycxW
K+kOJzXiE343wtS3m+0h9s3P2Xzbxurq6uLiIvn6/v37z549I1//+OOP8P1w
OPz+/Xv28ZzNN5zNSQd0Ou1SI0SlGIF2O6HQ80TiLUPoOobQSQe6I522OJwt
gOeRqGV5JToZ8QCeW6wGt8ejN1kHDYDn9t4Bu9ERaeq0A553aCOQAwG97wOe
d0RedoRZ6Zzkavh+Kekcsm6PLqAyT02QzgUXYpl0Hhelc0CP0tL5WniuVtyO
3eFYPC+ef3G2WiSV9hI8dzrblO5wzPTzYq2m7PbZSTtJzuYbFapJtcKMytlc
jc1L+E4wLnBF0VzB4+JK4oUeAFlCSei0/RxeuQvhuR2r5zk4w4NicTvkNDz0
3GmwxYYVeA75801PhAVzsqFCjkY9EbkpHP6VpswUDknnk+J4i0RmXl06F7rO
4afAP9G8inQun3UuYXP8m0kHwXMFobPt5+Olx6v5NmK82gvA8w+rc2Vuh886
OJtXJ9aVbzmbbxKbK4ebs9ItAXNUX824k8GfLKHDAyihu6SpFfaccEWetYYJ
nt9+NQk/9e9XDEcu6o9cMl98skQq2w9dmdpzZpSo5/9x0MhK50Q9J9L5P8tK
5wcvDJ8n89QY6fw6K51LZ50T6fzmi4k12VwVz+sV08/pZaLt5+xsNYLnyvZz
6g6ntONjx6vBB33524HHtop4PH79+vUjR47Mz8/D/8KfX3/99dGjRw8cOPD9
99+PjIzQR3I23yI2L+5zgMpF8/C3mUynlNCJjG7M563wDCmx8TyV9i1n48zE
c4/OaOnRDPVp7Tqzv1fnb+y09w2hW7u5L/rwlUDorzrCb/vmSfs5WVQ67zKI
89REdyO48W1e9XlqSDoXB/hOxNKzApsLXechbNiuNk+NnW5ckXq+JJ1kJ+C5
2my1XC4uq1tQaz93KtvPZTfOTtpJcjbf2GCTauUZlbP5uthcWtCOZHE1Hpct
KqAHJS7uk6NM7/myy4OGjAMaQ7KyOVEbuMkeZIeeF/Ecb+xbRYnndXeEgjnR
O+B/iSkcPKDXlKRmHWSemt3HjDtnpHM03iKTjyRSBjx+HdIjlc5V56mRFJdl
pHP8e0gWz6MsnrOELq1vL+UO9xHt5+r17QuZFtp+ztmcs/mGRIX5lrN5Vdlc
Kpp3awMUzOlSJXR3SJiIAZtM0nhOJp4/qPfV0onnNyyH/+z+9YL+t2ueY7Vj
xBQOcPvw9YUfTouE/rPxm99H2d7zYte5Ujq/UZTOz6tK5zeRdH7x0QSadS4d
psZWtpdhc9Xidpk7nKT9XFTPpbPVlot4bivieX27f80LMZPkbP45xeTkZEND
w8GDBwcGBuB/E4nEw4cPl5aWCoUCfGpcuHCBPpJM/CEBm3nO5pvP5jINYpCY
kuH1kEJ6ItGI9z8Coefzpnzelsu7YzE9Hqk2gK9Lwuu3AZ67R5x297B2yNzd
P9Q7YOvstzd32Rs7HXpnCu5ryLRNIqEDiQOPA55D3oYFmeGvt5Ku8+JgICKd
I1M4h9ERH2XmqcXQRckPYxdiiyM4m8oVpXNm1rmaKVx5Nld3bpfh+WTEr8Bz
0R1OMG+fxNPPy7SfF8eryW6cnbST5Gy+scEm1cozKmfzT2LztcE8yQroshJ3
YF78IQVHf0/wfAjjOfzgpLjdaAuKQ88dbT0OmzdFh56zeP4G4zlscdFe11Ba
OiemcGTceY9zYKhoCieMt4ilIVU63OS3BL40OqVC17nH61JWtsvK2pkyIRXp
nCxm6HmkjHn7esar2fOF8uPVBAF9FLefT0152LtmJ2VUzubVjArzLZ2hRidX
/s3ZnIzu+qs5vKlsPoLZnIjmBMkD4SKe+yZRUyTBc1g6a2zQEqNVSeS6kMZz
wRcON55frvOevmH55ZwGVbZf9ZB5ar9cmzp6Ewni/31pas9pNFjtnweNe/5E
5u17ziM8/+HPBDFsR7POZdL5PSydn0TSuWAKx0rn9fKuc3IV4BJcx4btpLKd
lc7Xy+YN4sVizdsls9UMcvP2Yvt5m/8v3H7eb06axMthU/i3T3M232YxNjb2
QBrwHdljRkZGfvrpp9XVVfabCwsL33zzDenl+cDMUCNDKDibV4XN6fZGcCRL
JN7A9iaReC2DdPxXjYlEE368OZ935PLDgWAvmXi+kouuZKesqPFc7/K4dEbz
oMHS1WfsGbD36/2A5x0DARse3WtwZ7XOFaKeNw0kIRVA0m7WViCdK0zhiHQe
m80n5vKsdD4HZz6DhqmpnPN1SOcVqed0tpoanhfN2xk8VzXMR7WasltmJ+0k
OZuvNz4uqcoyKp2hRoKzecVsrjSCK0/l85AE3qOlqqGHpHgOR8dDz812gueR
RJrgucuHfNssLoTnfTpkNTwsDj03AZ5roo8wnsOuqcuE9lFtonROus6FeWoj
krTpm8gR6dwTSuOEWRj2kfEWaJ5aJJHE0rktPj2XWXpHpPMluSlccdY5W9aO
P24Spdic6uaibXukjHl7BXiu2n5uZiaMqPi3f1idZ++XnZRROZtvbGxIvqUz
1OgmlrP5xrK5qls422lOwDwQzotLLqAjSO90mIdTxV97aoRfe0IWbdTMX3+M
Ktvv1k/WPBw5dd1y5KLhyCXzrzWevadMB84OH7uFiPuX6wuHri18fRyp5N+e
QNL5j+fXks7vLp68v/jTSRM8zwmFdF4rlc5J13nxKqhK52psrtp1/koxWI3B
86J6/qS5OPq8U2rernSHU70i0/OczbdXwMeEXhrwHfj++Ph4f38/eUwqlfry
yy+XlpYmJye1Wi35ZjKZ/O6776iZBq9p3yI2FzY2IoC/ho0NWZlMayLRIOP0
RKIZ/ysrfh5PAE88DwS12VxsLjlhsepMFr3BZGIr21u70W8sTe4U3MvGYYHN
7+HK9nasmzdpUepWdp0TDQj9Xm6UzlNzFOepTZF5avn4rCCdo67zFO06zymk
c/acl5mjpNp4LuzY2fZzRe+5bLZagjVvp+5wYvu5fLya7LbaSTtJzubrjcqT
qt/vrzCj7lA2Xy+YV8rmsmbzEmyOqJxd7+WQjv4VKXH3+FzsRxXqPRfUc/9k
PE1s213e+CS2bW/vcRhsqAgTDz3P0aHnZPRPj1mobAdIJ5vbdl0S/gq2T0AB
MrMOpXSOx1s4R4IxSJX+0WhROhfxfHxy1MxK5/LBkdNSNpeVtUekhu1KMC9T
314ezytpP6f17b0fVnfs5AvO5hsbG5Jv/z417eWtxqrA5m4pm7Od5gyYS5Y/
nHN4Uz26ADy4azBAKtuJek584eDqwCshjedXHqLGczpS7bdrnv2nTXtPIjw/
fhvhOaD396eQ+RvAOGHzHzGb7xGlc9p1zs5TO3xlTCKdP8XSuThPTdl1jq6C
2HVeI846hwuhyualwHzt4nZxttq9Vz54W1biDmdUU8+nOJt/JgGp7Icffpif
n19dXW1oaDh+/PgHnM2+//77ubm5QqFQX19/7do1+njO5tVic9aLTGDzTKaL
FLRTMJctwumY0OsymV4sndtgp5ROW534AsXitpVsbCLsQWbtZr3d7dYOWdq7
tX1aR2e/owXjucYUgwSLKtt7EYPffW573hZu1qI03orL2psG8Kzzl3bgd1Y6
JyWa1pEUZGCZdI4q2wHP5/ImbAo3gWo10flnzzxrCreernNpZbvabDXi3C73
NBauCLocWcXlULSfC78tkd0+O2knydl8o0KZVCvPqJzN12LzhRJsnirB5iKS
Z8UlIXSJhk4s3z1el9wazoOs4exu/0gwOqB39OucgYm0V2w8t/tSsPkUpqp5
hR0+rWzvotY9tpUOPWJzWLChNZUwhaPSOZ6nhgqNZlPZuXQWV7bbQmNhwRQO
J0NS2U5M4diy9hWpdF6q5Vw661wJ5mX822Xm7X41PF9zvBryb1/lbM7Z/NNi
XfmWs/nWsjmSyLFoHoyoLRHSiXQ+aI7BrtIeQE8Lz/8aD6yECwQZ9WlL+Fqd
7fID67nbyLP94JnuozXmE7fGCZ6jiecXx4C4kTUc9oX75vdRyub7LmW+wtL5
vgtTKpXtoinciTsS6ZzOU1PtOqcX4kHjbPFCVFDQXt4djrlqyy+75uGtWFvC
vF3pDkfaz03S6wJkxL75OZtv5+ju7j6M48aNG9FolHyzs7MTvvPvf/8bEt3U
1BR9MGfzLWRzUtAeCj0DDF8t9JRaGM8fYjzvI57tcI3SaRvwpsPZEY3Z36/E
PF6LyaI1mA06o6l3QN/dZ+wddAwYgwjPOx1GVwpuZ+DuRsDzFwjPIW9DMkct
57h98kmjH9gc/lbvQiI7+tUcsYUMIZtNrTXW3O3o0wmmcJPiPLXYbJ6YwuGu
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
vTTgO/B9yGCncPz+++9fffUVfLG4uOhyueAL8g/D4fDhw4fp82zUR+eXX365
Ic9TecB78uzZs1U+KNHCqnzQ6p/btziqfNDt8GPyneTfOSpPqiaTabMz6t/2
HqxCVD+N/00+rZQ/Js+oPErFhuTbjYKRv+0dWoXg2+bNC9mPydl8+wdb057L
5fbu3TsyMgJf3L17t76+nj5sXR+dZd7t5W+EMtkA3sxlbtsyf1s+yZR/2jL/
EP5VmfurfJL56Kct/2rLnNtPOXvlX0/5k1Dqrzbpx/yUpy3/JuFszqPyoEm1
8oy6SffgpzztNr8HK3zaT3w9m/S0pf5qkz6ttuTHXNeHMs+oPD46Ksm3MhjZ
bnfoJu0n+bb5A9824+Bs/tkFy+YfsLfGd999d+DAgXPnzi0vL9Pvyz46yyP2
R7N5+dvk427qNZNMmactvwUt87Tlk0z1n5afvU95Ws7mPNYVbFKtMKNu0j24
Y27tLfkx+dmr2tnjGZXHR0cl+VbJ5tvqDt1JNz4/e1ty9jib7/goFArUQIPG
/5AGXOj/UTrK/G35f/iPf/yj1F998cUXu3btKvW38FfwgI/4h+X/djNez+f1
tPzslXraLbk3eXyOUSqj/k8m4A22e/fu/6kW8H34W9W/WvNvN+lp4WbZ8Nez
SU/Lz96nPG01z96W3Js8dl6o5tujR49W/tb9jO7QTXrav0l+26Sn3ZKztxtH
hU8L2w/O5jx48ODBg4csennw4CHGVt+OPHZ4bPUbnAePbRRbfTvy4MGDBw8e
PHjw4MGDBw8ePHjw4MGDBw8ePHjw4MGDBw8ePHjw4MGDBw8ePHjw4MGDBw8e
PHjs/FhdXS0UCjv+oH+TH3OrDsqDBw8aPL/tmCNu1UF58OBRYfBEtGOOuFUH
5fF5xejo6B9//HHkyJHLly/HYrHqHNTlcp0/f/6333578OBBJpPZ1GPBXXD9
+vXW1lb6HZ/Pd/r06Z9//vnatWtK49BNOqjRaDx37tzx48fv3LmzGedZeUQS
w8PD7DC+zT5oFd5OsoNW873Eg8easeMz6gfFPbgjM6rqQT/wjMqDxzaL6qdc
nm+rc1ASm5dyt0O+/cBTLg9F5HK5gwcPhkKhD/jWgzdMFQ6azWYPHDgQj8fh
61evXj1//nzzjjU+Pn7mzBm4r+mNsLCwsH///nA4nM/n4dD379+vwkHT6fS+
ffvgT/haq9VevHhxs49IAvL2sWPHNimtKQ9ahbeT7KDVfC/x4LFm7PiM+kFx
D+7IjKp60A88o/Lgsc2i+imX59uq5dsPm5lyt0O+/cBTLg+1sFqt5C579+5d
1Q66vLz8zTffzM7OwtfNzc23bt3avGM9efLEbDb/9ddf9EZwu93nz58nX8/M
zPzwww9VOGgymfT7/eTriYmJ7777brOPSOLOnTuQSDdpJ6k8aBXeTrKDVvO9
xIPHmrHjM+oHxT24IzOq6kE/8IzKg8c2i+qnXJ5vq5ZvP2xmyt0O+fYDT7k8
1KKrqwveCX/++efXX3998ODBaDRaneNqNJqff/65trb2119/Jb8v2tRgbwQ4
NNzs5OuVlZUvv/wyl8tt9kHZePTo0c2bN6twRMgADx48mJub27wKTNlBq/Z2
kl3Qar6XePAoE3+TjPqBuQd3cEaVHZRnVB48tltsScrl+XYzjqg8aBVS7pbn
2w885fJQRENDw3/+538ODQ29f/8e3i13796twkGz2ez169fPnj0LRz906JDR
aNzsI7I3QktLS11dHfl6dXUVMtsmNeyoZraBgYEDBw7Mz89v9hHT6fTRo0fh
R6vmTrJqbyd60Oq/l3jwKBN/k4z6gbkHd3BGZQ/KMyoPHtswqp9yeb6tQr79
UK2Uu7X59gNPuTzUor29/dixY+RreP//8MMPm/QrODacTufhw4fJ136/f+/e
vZBhNvWIMlGAFo3ADfjtt99W4aAk+vv79+3bt3leJewRa2trHz165HA4BgcH
v/vuO/iiCr9crdrbiR60+u8lHjzKxN8ko36Q6jg7NaOyB+UZlQePbRjVT7k8
327SET9sxSZ2a/PtB55yeaiF0Wg8ffo0+TqVSn3zzTfZbHazDwo3OK3JIa0W
m90oxN4ILpfr1KlT5OtwOExvik09KIROp4O0tqkFV+wRIXufwvH7779/9dVX
8MXi4uJmH7Rqbyd60Oq/l3jwKBN/k4z6gbkHd3BGZQ/KMyoPHtswqp9yeb7d
vKj+JnZr8+0HnnL///bu7iWKNQDg8H+bF6VkhZailB+lpEVfFEjdeGWYUSJJ
hSFphaEURIuVSaKSWaZSmW4658XhDJ5W9wS5s5s9z9XszOy8uzD763WZZtnO
yspKZWXl5ORktHkXgtOnT6cw6PLycnV1dTjzw/LAwMDFixcLPeLWD0I2mz18
+HAmkwkL165d6+npSWHQ+fn58vLy8fHxL/8q9IiJNK/ATO10SgZN/1yCPP6S
okZbPoN7uKjRdlFVVCgd6SdXb9PsbVTg5Ba3t5HksoNnz54dOXKktra2rq4u
fADTGXRwcLC5ubm+vv7ChQtTU1OFHi73/hKhM1VVVe3t7d+/f09h0O7u7n3/
tbq6WtARE2nOJKO0TqefvnVM81yC/P6GokY5N0nbk0WNiv23eaSo8H/ST67e
ptbbKMW/zaNi9DaSXHawsbFRlN+7X1lZSX/Q2Pr6eoFuoEFRTqcinkvwE0Vl
Fykq5Pe3fUb0tnD+wn++AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAKLo3b96cOHHi948zNjaWyWR22vry5cuww++PAlDKFBUgHXoL
7D27UrYvX76cPHnyx48fO+2QzWYbGxvDbr85EEApU1SAdOgtsPckZRsfH798
+fLBgwcvXbq0tLQUbx0bG2toaKiqqurv7z9z5sxOB7l9+/bdu3e3rllYWBgZ
Gbl3797NmzfDYUdHR/v6+m7dulXQ9wJQXFvnirlRVVSA3ZK/t9GvJVdvgZIS
l21+fr6iomJ4eDgUqaOj4+zZs2HThw8fDh06FMo2Ozvb3Nx87NixnQ4SNoUj
JA97enqamppC7kLZ9u3bNz09HVaGg+Q5AsAekMwVc6OqqAC7KE9vo1+exOot
UFLisoUEtba2xmvm5uZCjpaXlwcGBuK+BUNDQzt16ePHj5WVlcnD0MZwqPjq
oI2NjbKysuRCoFDOsHMB3wxAUSVzxdyo3rlzR1EBdkue3v7iJFZvgVITl62r
q+v69evJylCqqampsObGjRvxmunp6Thr2Wz2ypUr7e3tHR0da2trYc2rV6/q
6+uT5zY2Nr548SJe/vz58/79+0Pf4od1dXWvX79O530BpC+ZK+ZG9erVq4oK
sFvy9HbbSazeAqUvLltfX9+5c+fiNYuLi2VlZd++fRsZGUlWPnnyJJ5Jxv/v
Jiz09vbGN66cmJiora2Nd4u/ZgxBix8ODQ2dP38+GSvsNjk5mdIbA0hdMlfM
jWrooaIC7JY8vd12Equ3QOmLyxaCU15ePjMzE9IUknX8+PFo896VFRUVmUxm
YWGhra0tnkmG5a9fv0abVxDdv38/LCwtLR04cGB9fT0+YGVl5fPnz+M9a2pq
wvHj9eHIYYjl5eWivE2AFCRzxdyoKirALsrT22i7SazeAqUvKVt/f38IVHV1
dWja3NxcvHV4eDjULKzs7Oysq6tLnjU7O9vY2BgnLmhoaHj79m28/OjRoxC3
lpaWsP/o6GjylHfv3jU1NaX0rgCKYet9g3OjqqgAuyV/b6Mdkqu3wJ9ifX19
6w84zs/PZzKZePnp06dtbW3xcnzHy/fv3yd7Dg4OdnV1JQ/X1tYWFxd/Onh3
d/fDhw8L9dIBSs/WqCoqQOH8yiRWb4E/1+rqanV1dW9vb39/f01NTXydz6dP
n1paWrb+3kS0eTujU6dOJV9C5gqbWltbw24Ff9EAJUlRAVKTm1y9Bf50S0tL
jx8/HhgYmJmZidd0dnYePXq0ZdODBw+SPaemppKLgnJNTEyEHQr9agFKmaIC
pOan5OotAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAACUrH8AJVT4aQ==
    "], {{0, 456}, {1332, 0}}, {0, 255},
    ColorFunction->RGBColor],
   BoxForm`ImageTag["Byte", ColorSpace -> "RGB", Interleaving -> True],
   Selectable->False],
  BaseStyle->"ImageGraphics",
  ImageSize->Automatic,
  ImageSizeRaw->{1332, 456},
  PlotRange->{{0, 1332}, {0, 456}}]], "Output",
 CellChangeTimes->{3.6315424498141212`*^9},
 ImageSize->{1336, 456},
 ImageMargins->{{0, 0}, {0, 0}},
 ImageRegion->{{0, 1}, {0, 1}}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Results", "Subsubsection",
 CellChangeTimes->{{3.630818982838866*^9, 3.630818983628759*^9}}],

Cell["Optimal hyperparameters for each statistic:", "Text",
 CellChangeTimes->{{3.630818796522992*^9, 3.630818821244989*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"t", "=", 
      RowBox[{"Position", "[", 
       RowBox[{
        RowBox[{"stat", "/.", "perfG"}], ",", 
        RowBox[{"Min", "[", 
         RowBox[{"stat", "/.", "perfG"}], "]"}], ",", 
        RowBox[{"{", "2", "}"}], ",", 
        RowBox[{"Heads", "\[Rule]", "False"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"Join", "[", 
      RowBox[{
       RowBox[{"Log", "[", 
        RowBox[{"2", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"rsgrid", "\[LeftDoubleBracket]", 
            RowBox[{"t", "\[LeftDoubleBracket]", 
             RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"lsgrid", "\[LeftDoubleBracket]", 
            RowBox[{"t", "\[LeftDoubleBracket]", 
             RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], 
            "\[RightDoubleBracket]"}]}], "}"}]}], "]"}], ",", 
       RowBox[{"Log", "[", 
        RowBox[{"10", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"rsgrid", "\[LeftDoubleBracket]", 
            RowBox[{"t", "\[LeftDoubleBracket]", 
             RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"lsgrid", "\[LeftDoubleBracket]", 
            RowBox[{"t", "\[LeftDoubleBracket]", 
             RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], 
            "\[RightDoubleBracket]"}]}], "}"}]}], "]"}], ",", 
       RowBox[{"Extract", "[", 
        RowBox[{
         RowBox[{"stat", "/.", "perfG"}], ",", "t"}], "]"}]}], "]"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"stat", ",", 
      RowBox[{"{", 
       RowBox[{
       "\"\<RootMeanSquareError\>\"", ",", "\"\<MeanAbsoluteError\>\"", ",", 
        "\"\<OneMinusCorrelationSquared\>\""}], "}"}]}], "}"}]}], "]"}], "//",
   "TraditionalForm"}]], "Input",
 CellChangeTimes->{{3.630763682968245*^9, 3.630763818231238*^9}, {
  3.630816490377605*^9, 3.630816645184347*^9}, {3.6308191097440767`*^9, 
  3.630819132136757*^9}, {3.6315425764395723`*^9, 3.631542585596465*^9}}],

Cell[BoxData[
 FormBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"-", "21.5`"}], "9.5`", 
      RowBox[{"-", "6.472144906775595`"}], "2.859784958807821`", 
      "19.16097378183828`"},
     {
      RowBox[{"-", "22.5`"}], "9.5`", 
      RowBox[{"-", "6.7731749024395755`"}], "2.859784958807821`", 
      "13.359418302965166`"},
     {
      RowBox[{"-", "21.5`"}], "9.5`", 
      RowBox[{"-", "6.472144906775595`"}], "2.859784958807821`", 
      "0.007176383199733016`"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
  TraditionalForm]], "Output",
 CellChangeTimes->{3.631542587908209*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"estperf", "[", 
  RowBox[{
   RowBox[{"2.", "^", 
    RowBox[{"-", "22"}]}], ",", 
   RowBox[{"2.", "^", "9.5"}], ",", "KernelGaussian"}], "]"}]], "Input",
 CellChangeTimes->{{3.631556858834193*^9, 3.631556859235908*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"\<\"NumberOfSamples\"\>", "\[Rule]", "100"}], ",", 
   RowBox[{"\<\"RootMeanSquareError\"\>", "\[Rule]", "19.236515742217616`"}], 
   ",", 
   RowBox[{"\<\"MeanAbsoluteError\"\>", "\[Rule]", "13.47478899028302`"}], 
   ",", 
   RowBox[{"\<\"StandardDeviation\"\>", "\[Rule]", "19.31557532252094`"}], 
   ",", 
   RowBox[{"\<\"MedianAbsoluteError\"\>", "\[Rule]", "10.108418294191324`"}], 
   ",", 
   RowBox[{"\<\"MaximumAbsoluteError\"\>", "\[Rule]", "75.08524820804587`"}], 
   ",", 
   RowBox[{"\<\"Correlation\"\>", "\[Rule]", "0.9963687708200597`"}], ",", 
   RowBox[{"\<\"CorrelationSquared\"\>", "\[Rule]", "0.9927507274654767`"}], 
   ",", 
   RowBox[{"\<\"OneMinusCorrelationSquared\"\>", "\[Rule]", 
    "0.007249272534523343`"}]}], "}"}]], "Output",
 CellChangeTimes->{3.631556865644497*^9}]
}, Open  ]],

Cell["Performance on prediction set", "Text",
 CellChangeTimes->{{3.630818950042426*^9, 3.630818950986649*^9}, {
  3.630818988223613*^9, 3.6308189952206*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{"\[Lambda]", ",", "\[Sigma]"}], "}"}], "=", 
   RowBox[{"Power", "[", 
    RowBox[{"2.", ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "22"}], ",", "9.5"}], "}"}]}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.630816755304348*^9, 3.6308167752946577`*^9}, {
  3.6308168147542677`*^9, 3.630816817803626*^9}}],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"kk", "=", 
   RowBox[{"KernelGaussian", "[", 
    RowBox[{
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indtrain", "\[RightDoubleBracket]"}], ",", 
     RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ll", "=", 
   RowBox[{"KernelGaussian", "[", 
    RowBox[{
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indtrain", "\[RightDoubleBracket]"}], ",", 
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indpredict", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"krr", "=", 
   RowBox[{"KernelRidgeRegression", "[", 
    RowBox[{"kk", ",", 
     RowBox[{
     "ae", "\[LeftDoubleBracket]", "indtrain", "\[RightDoubleBracket]"}], ",", 
     RowBox[{"RegularizationStrength", "\[Rule]", "\[Lambda]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Loss", "[", 
  RowBox[{
   RowBox[{
   "ae", "\[LeftDoubleBracket]", "indpredict", "\[RightDoubleBracket]"}], ",", 
   RowBox[{"krr", "[", "ll", "]"}]}], "]"}]}], "Input",
 CellChangeTimes->{{3.630816681873713*^9, 3.630816748348625*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"\<\"NumberOfSamples\"\>", "\[Rule]", "6102"}], ",", 
   RowBox[{"\<\"RootMeanSquareError\"\>", "\[Rule]", "17.696059574884544`"}], 
   ",", 
   RowBox[{"\<\"MeanAbsoluteError\"\>", "\[Rule]", "12.451131386931891`"}], 
   ",", 
   RowBox[{"\<\"StandardDeviation\"\>", "\[Rule]", "17.6911941985743`"}], ",", 
   RowBox[{"\<\"MedianAbsoluteError\"\>", "\[Rule]", "9.541295628547687`"}], 
   ",", 
   RowBox[{"\<\"MaximumAbsoluteError\"\>", "\[Rule]", "203.26157895708081`"}],
    ",", 
   RowBox[{"\<\"Correlation\"\>", "\[Rule]", "0.9966377355313514`"}], ",", 
   RowBox[{"\<\"CorrelationSquared\"\>", "\[Rule]", "0.9932867758850599`"}], 
   ",", 
   RowBox[{"\<\"OneMinusCorrelationSquared\"\>", "\[Rule]", 
    "0.006713224114940131`"}]}], "}"}]], "Output",
 CellChangeTimes->{3.631542719740428*^9}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Laplacian kernel", "Subsubsection",
 CellChangeTimes->{{3.630819693218663*^9, 3.630819694706505*^9}}],

Cell[BoxData[
 RowBox[{"Dynamic", "[", 
  RowBox[{"Log", "[", 
   RowBox[{"2", ",", 
    RowBox[{"{", 
     RowBox[{"\[Lambda]", ",", "\[Sigma]"}], "}"}]}], "]"}], "]"}]], "Input",
 CellChangeTimes->{{3.6306874228451433`*^9, 3.630687443939948*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"perfL", "=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"estperf", "[", 
      RowBox[{"\[Lambda]", ",", "\[Sigma]", ",", "KernelLaplacian"}], "]"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{"\[Sigma]", ",", "lsgrid"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Lambda]", ",", "rsgrid"}], "}"}]}], "]"}]}], ";"}]], "Input",\

 CellChangeTimes->{{3.630669450192575*^9, 3.630669511916271*^9}, {
  3.630687387383337*^9, 3.6306873943796873`*^9}, {3.6315427449577513`*^9, 
  3.6315427455506907`*^9}}],

Cell[BoxData[
 RowBox[{"(*", " ", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"filename", "=", 
    RowBox[{"FileNameJoin", "[", 
     RowBox[{"{", 
      RowBox[{
      "\"\<path\>\"", ",", "\"\<to\>\"", ",", "\"\<file.txt.bz2\>\""}], "}"}],
      "]"}]}], ";", "\[IndentingNewLine]", 
   RowBox[{"Export", "[", 
    RowBox[{"filename", ",", 
     RowBox[{"ToString", "[", 
      RowBox[{"perfL", ",", "InputForm"}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"\"\<BZIP2\>\"", ",", "\"\<String\>\""}], "}"}]}], "]"}], ";", 
   "  ", 
   RowBox[{"(*", " ", 
    RowBox[{
    "Use", " ", "this", " ", "line", " ", "to", " ", "store", " ", 
     "results"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"perfL", "=", 
    RowBox[{"ToExpression", "[", 
     RowBox[{"Import", "[", 
      RowBox[{"filename", ",", 
       RowBox[{"{", 
        RowBox[{"\"\<BZIP2\>\"", ",", "\"\<String\>\""}], "}"}]}], "]"}], 
     "]"}]}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{
   "Use", " ", "this", " ", "line", " ", "to", " ", "retrieve", " ", 
    "previously", " ", "stored", " ", "results"}], " ", "*)"}], 
  "\[IndentingNewLine]", "*)"}]], "Input",
 CellChangeTimes->{{3.630669816350437*^9, 3.63066985945767*^9}, 
   3.6306750575974216`*^9, {3.630687402091234*^9, 3.630687405310912*^9}, {
   3.630747585651572*^9, 3.630747585796751*^9}, {3.630819705425763*^9, 
   3.6308197173504057`*^9}, {3.631542754681884*^9, 3.631542767862413*^9}, {
   3.6315525097855663`*^9, 3.631552541368384*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GraphicsRow", "[", 
  RowBox[{
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"HyperparameterPlot", "[", 
      RowBox[{"rsgrid", ",", "lsgrid", ",", "perfL", ",", "stat"}], "]"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{"stat", ",", 
       RowBox[{"{", 
        RowBox[{
        "\"\<RootMeanSquareError\>\"", ",", "\"\<MeanAbsoluteError\>\"", ",", 
         "\"\<OneMinusCorrelationSquared\>\""}], "}"}]}], "}"}]}], "]"}], ",", 
   RowBox[{"ImageSize", "\[Rule]", 
    RowBox[{"18.5", "*", "72"}]}]}], "]"}]], "Input",
 CellChangeTimes->{{3.630816394072554*^9, 3.630816434873212*^9}, 
   3.630819735568729*^9, {3.63082012023367*^9, 3.6308201444494658`*^9}, {
   3.631552548717849*^9, 3.631552549216071*^9}}],

Cell[BoxData[
 GraphicsBox[
  TagBox[RasterBox[CompressedData["
1:eJzsvXd0HMeV/+sne4/e2aPfnuO1/9H67Vnv/uy3frbXu2vaGy1btvbntb2S
FS2JkiVZIkUxglEkRVISCZEUAxhFMeecAyCKmRLFIOYcACaQAEkARA4DYEIP
X3VVd3VVdXVPDzDAAOD3c+rwDAdDYCChL+rT99a9f/tG32e6PfCVr3xl4P9N
/njm9SG/HDDg9Xee/Rr5y6/eGfTmG18lDw7/X1/5yk/+7CtfMR/fAwAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC0Ya5evTpq1KiUf9qTJ09eunTJ
66MXL14kL0j5FwUAgLSDoAoAAK0D4i0AoIPREmGtrq5u7NixsVjM6wXRaPSD
Dz4gL0vt1wUAgLSDoAoAAK0D4i0AoIMhhrW8vLxZs2b169fv448/rq6uZk+e
PHkyMzNz8ODB27dvnzx5cpDPmZ2dvXPnTvGZioqKo0eP7tq1a9OmTeRLnDhx
YuvWrVu2bEnt9wIAAGmHB9VURdR7CKoAAKAD8RYA0MHgYa20tDQjI+PgwYMk
BM2bN2/KlCnkybt37w4YMIAEtzt37owZM+add94J8jnJy8hn43/duHHj6NGj
SawjYa1bt263bt0iT5JPGPCzAQBAO4IF1RRG1HsIqgAAoAPxFgDQweBuTmLO
+PHj2ZMlJSUk/tTU1Ozdu5eFOMKBAwfEQBSPx7WfsKysrH///vyvJFSST8tK
g8g/eeutt3gVEAmk5MUt8D0BAEDaYEE12Yh6D0EVAACSBPEWANDB4G6+Zs2a
tWvX8udJaCooKCDPbNiwgT1z69YtHtnIk0eOHGGPFy5cmJmZuWjRIhboLl++
/N577/HP88EHH5w/f549rqys7NWrF4+H77777pUrV1r22wMAgNaFBdWkIuo9
BFUAAEgexFsAQAeDu/nWrVunTZvGnqyqqnrrrbfq6+uPHj3Knzx8+DCLbJs2
bSJxj4W1ixcvrl69mkQqEtZYjLp27drw4cPZP2H3GEk0Y389cODA9OnT+Zcm
L8vPz2+dbxMAAFoHFlSDR9R7CKoAANAkEG8BAB0M7uYkwvTp0+f27dskFuXk
5IwcOfIebVaZkZFx6dKlioqKrKwsEtkMw9hFYWGNxEN2R/HkyZPbt28nD6qr
q3v37k1exj4/CYBnzpy5RztpDBs2jHw59jz5KuTL1dTUpOObBgCAloIF1YAR
lTyJoAoAAE0D8RYA0MEQ+7STuEQi0pAhQ0hYKykpYU8ePHiQBDTy5LJly959
91325O7du1lYW758+Y0bN8iD3NzcdevWsY9mZmZev36dPT506BCJbOPGjSP/
9sSJE/zr3rx5c/To0a3yLQIAQOvBg2rwiHoPQRUAAJIH8RYA0LExDEOc2Fha
Wnrp0iX2+NixY1lZWewxD2sklF2+fJk8OHv27Keffso+um/fvjVr1vBPEolE
qqqqlC+0fv36/fv3t9j3AQAA6SdgRL2HoAoAAM0D8RYA0OEJh8NDhgzJycnZ
vn37sGHDWGHPPSGsHTp0aM+ePfdoXdCpU6fYR6PR6IcffhgKhbw+LfnQ+PHj
ycta/jsAAIC2gldEvYegCgAAKQXxFgDQIamurv7yyy/37t17+/Zt/iQPa5FI
ZOHChbMo4kCKgoICXhHk5tq1a+QFLfq2AQCgDaKNqPcQVAEAINUg3gIA7k9I
cEv3WwAAgI4DgioAALQOiLcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANoaR48enTRpUmZm5oIFC+7cuZPu
t5M05P2PHz/+/fffnzdvXn19fbrfThO5cOFCv3790v0umkJOTs4QmxkzZqT7
7QCQZhBR2wKIqADcDyDetgUQbwFIIdXV1YMGDSJ/kscHDx6cOnVqut9RcpSW
lpL3X1NTQx4vXbp07dq16X5HTSEUCo0aNaqdRrbJkyefPXs2TIlEIul+OwCk
E0TUtgAiKgD3A4i3bQHEWwBSS2Vl5eXLl9njmzdv9unTJ73vJ1ni8XhdXR17
vHjx4jVr1qT3/TSNBQsWkF8r7TSy9e/fn/wvKCwsbGhoSPd7ASDNIKK2BRBR
AbgfQLxtCyDeAtByLF++fO7cuel+F02hqKho9uzZ77//fkVFRbrfS9IcP358
yZIl5eXl7TGykf/gPXr0GDly5ODBgzMyMi5dupTudwRAWwERNS0gogJwH4J4
mxYQbwFoOfbv309+ONtjZCAUFBRs2rRp2LBh5LtI93tJjurqahIWQqFQO41s
xcXFS5cuJe/fMIycnJwpU6ak+x0B0CZARE0LiKgA3Icg3qYFxFsAWo59+/YN
GjSoPbbRELl06dKAAQPi8Xi630gSzJo1a/ny5WfOnDlw4ECfPn3Ig2g0mu43
1URqa2t79uzJTk4BcD+DiJouEFEBuN9AvE0XiLcAtBCHDh0iYe327dvpfiNN
4caNGyQss8dVVVXdunULhULpfUtJMW/evHGU0aNHd+/enTzgh4/aBQUFBQcP
HmSPKysrSXBGMw1wn4OImkYQUQG4r0C8TSOItwC0BKWlpeSnMS8vr84m3e8o
OUg069u3b0VFRTwe37RpU2ZmZrrfURNppxVBJJplZGSQN28YxsaNG2fOnJnu
dwRAOkFEbSMgogLQ4UG8bSMg3gKQQtavX99NJhwOp/tNJceePXtGUObMmdNO
753ea7eRjbBr1y7yH3/o0KHk10pJSUm63w4A6QQRtY2AiApAhwfxto2AeAsA
UIjH4xh/kEbEOSAAgPYOImp6QUQF4P4B8Ta9IN4CAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAn6+0Lg8//HArf8XUgvefXlrh/af7
igTtm5EjRz7ainTu3Lk1v1zKwftPLy39/snlkO4rEnRkEG+TAu8/vSDeApGc
nJwhNjNmzBA/1JoykpeXl5WV1WpfLuXg/aeXVnj/cHMQEK+gSn6EPmtFunXr
1ppfLuXg/aeXln7/iKggJXjFW+YjLfozLEJ2IHPmzGm1L5dy8P7TS0u/f3I5
kD/Td5mC5Jg8efLZs2fDlEgkIn4Ibh4cvP/0AjcHbQevoNrKP0LErVrzy6Uc
vP/00tLvHxEVpASveNvKMkJ2IGQf0mpfLuXg/aeXln7/cPP2Rf/+/evq6goL
C93DDeHmwcH7Ty9wc9B28AqqcPOkwPtPL3Bz0C7wirdw86TA+08vcHPAqaio
6NGjx8iRIwcPHpyRkXHp0iXxo63s5u36ssL7Ty+t8P6xkwRB8AmqrfwjlJ2d
3ZpfLuXg/aeXln7/iKig+fjE21aWEVzv6QXv3x+4eTuiuLh46dKloVDIMIyc
nJwpU6aIH+3UqVOWTbsWNwCaD3aSIAg+QdUdUWuPHK07drTuxNG6U0frzhwL
nT0WOn8sdPFYKPd4/eXj9VePN+SfaLh5ovHWycY7J8MlpyJlpyIVp6PVp6M1
Z2J152KhC7H6S0ZjnhG+YkSuxaP5ceNmPF4Yj9+Ox4vi8ZJ4vDQeL4/HK+Px
6ni8Nh4PxeMN8XijQZYRNoyIYURj5orFYuxRnKxI1FxhsiLxRroawtaqb7RW
qMFadWTVm6uWrZC5auxVXScuo4qt2iRXnVFtLumz1QhfhX3RWvs91PFF315I
XI3Ot8BWQ6Pz3ZHVyJb9jYfFRf+bRJRF/4t5LPZf1l4GXzFl0aej6oqTFRFW
OC6tRns12KuerpC96uiqpavGXtV0VdFVSVcF/Qkpvxcvo6v0XvwuXSX34sX3
4kX34nfoj9Mt+nNFVkE8Tn7GbsTj+fH49Xj8Gl1X4/Er8fjluJFnrViuuaKX
DHNdNCJkXVCuFERU0Hx84m3nzp15vGXiU3v4qLmOHK09erTuKI29ZB231yka
gS8cqyfh98rxhutS7A2XnolUnI9WXYzW5MbqrsQarhnh/Hi0IG7cEoJthWFU
GUatYYRiRmPMiMRohI1EjXDUaIwYjWGjIWzUNxoscpJgZUYwFhtrjcoao6LG
KK82yqqMUrIqjbtkVRglZJUbxXQVlRl3yCqNkXWbrbuxW2yVxAqFVVCsWTd1
S/tKvgrlT0u+yq27zrrNFn0n7F3dKYuRN8lXcbmzSiqsdZct+g2WslVlftds
kf8CfFVUm/9NyKpkS/i9IP5SkH4XJPotkCD+u4O/K+z7hXpXkFfDuxDY49bS
hvSE8VwbzCvumcGcxnMZuHkbJD8/f4kMeUZ5TW1tbc+ePWtqavgzDz/8cJ4N
+evpv/v+me/94Ow//ODsj3947l9/eP5n/3DhVz+68N8/uvj4P156+p9yX/zn
y2/8+Grvn1wf/C/5I//15oR/L5zxn7cX/qxo9c9Lsh8t3flf5ft+W3n4ierT
z9ReeiGU/3LDnT+Fy9+Mhnoasb5G7B0jNtqITTZic4zYMiO2MRbbEYvtj8VO
xmIXotG8SPRqOHKjMXyrIVxU31gaaqisq6+pra+vJo9qGypqGsuqw6WV4ZKK
SFF59E5ZlEQMEkNIzLlRFLt+O3btVuxKYexyQTT3ZvTSjejF/Oj569FzV6Nn
rkRPX46cuhw5mRc5kRs5fily7GLkyIXIkfORw+cjX56LHCLrbPjg2fCBM+ba
f9pcX8hrv7zYK8k/If/w0Lkw+SSH6Wcjn/boBfPzk69CvhZZ5IuSL03eAHkb
Z69Gz12Lnr8WvXDdfHtkkfdJ3m3ezSh525cLo+T9X70Vu3bb/Hby78Tyi8xv
zQyqLFpasdEM2kV2DLzLwx2LcjWxCnNFK2vJilTVmau6LlwdCteEGmtCDbX1
ZNXX1ofqyGqoI4s8Rz5Sb67q+saqhjBZlY3hisYIWeXhSFk4UhqO3o1ESyLR
4ki0KBK9E43djsZuRWOF0VhBNHYjFrsei12Lxa7EYnmxWG4sdpH8D43FzsVi
Z2Kx04Zx0jCOG8ZRwzhiGF8axkHD2G8Y+wzjM8PYYxg7DWO7YWyNGzlxY3Pc
2Bg31seNNXFjRdxYGjcWxWPz6Q/Mx0ZsuhGbYsSyjNg4IzbGiGUasfeM2HAj
NtSIDTJi/Y1YhhHtFQv3jDV2j9W/FQ29Ga3rEql5I1L9p3Dlq+GKV8LlLzeW
vtR498WG4ucbiv7QcPvZ+ltPKxcIdpJApAlBlfwI5QnUfnnUjKj/RMPpz//h
wq9/dPGJf7z0h3/K/eM/53X58eVena6+/dP89//15ngrlhav/vnd7EfLdv+q
4tB/VZ34bc3Zp2tzX6y79qf6gu4NRX3DZUMi1e/H6sfSQDrTiC0yYquM2KZY
bHss9nksdphedHnkqoxEC8ORO43h4oZwaX1jRV1DdW19bU2onkQDEhnKayJl
VZG7ldFiGktvl0YLS6Ik1JCwQ4LPVRpL8+xYeiHfjFo8loqB9CgNpDSKWiF0
/xk7fp4K7yPrZPjzk+HPTkjr8xPmk+IiLyOv/8KOrgft6MpCK4+rxy5ZodUr
rl7gcZWF1gIztLK4KoZWM67KoZVF1ztsqylEVxZgS50ASzaQscpac1WRVRcl
q9qMsRESY+0wyyJtvSbS6oKtHW/LA8fbfBpvr8Zil2nIvUTj7flY7CyNt6cM
44RhHKMh97BhHKIh9wvD+Nww9hrGLsPYYRifxo1P4saWuLEpbmwQ4u3CeGye
EZtlxGYYsalGbJIRG2/ExhrRD4zo+0Z0hBEdakTeNiIDjEiGFWkbhEhbZUZa
Yuji1YGICoLThHhLZGTOnDniJvbM//7+mf/X3Mee+f4Pzv7wB2d/ZIZfc0P7
kx+e++kPL/zyR5ee+Ke8F398pWuna31/mj/8X2+O/ffC6f9B97G/KNnyu7Kd
z1bs/2PV8W61F/qGrg9tLMqMVE00ImQHsjAWXR2JbAlHdjWGDzY0nqpvzAs1
FNbVl5MrnexRy6oaissbb5c23ixuvH47fKUwfOlG5Pw1EqaiJGSRIEYCGoly
JADuOtq47cvGTw40bv6iYePnDev2NqzZ3bBqZ/2K7fXLttUv2Vq/MKd+fnb9
3M2hOZtCszaGZq4Pfbwu9NHa0PQ1oWmrQ1NW1U1eWTdpRV3W8rqJZC2rm7Cs
bvxSc41bYq4PFydY7GXsn0yg/5x8EvKpyCckn3bSSvPzk68ydXVo2hrzi5Iv
PWNd6OP15juZtSE0e6P5xsjbm7clND87tCCnflFO/eJPzHe+9FPzW1i+vX7F
jnryHa3eVU++tbW7G9btaVi/t2HDZw2bPm/YvK9hyxcN2fsbcw40bj3Y+Okh
87/G9sONO440kv8yu4817jke3nvc/DXBfi+QXwrkNwL/dcD32CdzI6fy9Lvr
S3x3LfwKUOJ/AYv/JPiL++oKYV9txvwY3VRH6aY6UmVuqsPkd6gV5/l2uiEk
7KVJbK+2Y7uwkY6WRszAfjcaK47GWFQnIf0mCelRcwt91d5CX7L3z2fl/TML
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
N5y49tKd1hFr3Y8JO0b/tA6rdV8p17qLmZ3xdq37+3at+9t2rXtvTQVm9Z8i
la8pVwp2kiAgXkG1eW7+iOnmOY+W7flV5Zfebt4wjv7Mz7bdfIvt5kfpb3Du
5kXEzetNN68U3DwiunlRefS25ebW4SAaS02HVQuQfGOpVyDdSWPmdrK+lNY2
eW1nNY2HVVXfrcRV981P36Ca9DEiOZPihFb5JBFPqci17pakVwWT9MC17j5n
ixLeFA1SuSTeFN1Gb4pmC7XuPN6KZUv2HVGn1v0dXuseNy6LP/+IqCAleMXb
5rr5CC83f6v2Yr9QPnfzWdTN11I339MY/pK6+eVQwy3i5jUh2c2LmJtHTDe/
aobNY9TNSdQiQYzERhLoiH5m7zfNdL1Q0G4mzVlBO02aO2K+1illZxlzDyu3
fHzUvNqR4pprrvflxT5EXjlKtnWu6mN59btd+s6L3r0q3t2SvpBJ+tb6JZ9a
kr7CJenrRUk30+gNOQcsSd92yPzVwCV9jyDp4g1bfreW/xaQat2v6u/TKjdp
1eSXFfy9a92rvWvdQ9pa9xr/WncS2G1JL7Ql3V3rfl6pdY/Hb4k//HDzdkc8
Hq+rq3M/7+XmZij7N+7m/2jWYXq4+Z1FjxSt+XlJzqOlu0Q3fzGU/4rg5v2p
Lo2lbk5+y6+Imbke4uYHBTe/3hi52RC+XW+5eZXbzUsqbDc3izBjfkWYdqJH
rMD03Eza+Z2dtoCzzaS0gTxkhlO2th1St5SisLPsj9bT1byPez/pm0m/4l2T
o0p6uVSWI8eT1jyQftPjQLo2rXM4WFqH1V6KByRny5mdcXat+3t2rfsgXa27
WYHpfzkARlVVVX19fbrfRZtDG1Sb5eaLHileo3Xz1+sLejRKbj7VdvM1tpt/
oXPzu7ab1/i4eeHdKLvPyWOpPmnuI+YnzEw38WgeSC0rp3GShU2y1xLXJ8Ji
z1jR1Q6tOw6LqRPfoOot6Xx7JuVQXGkU/wolMbRKku46kF6hk/TkD6RXp+JA
+hVXbaS71v2wq9Z9l3xTdBO9KcriLTtbJJYt2XdEnVr3ofH4VZ/LAYAmo423
Sbj5T6mb/8p28zdlN1/0s6K1zM2fqzjwKnXz/tTNR9tuvsR088gntpufYW5e
W1/B3byIuvkN4ua3wnk0b36WuflFM2AyN99N3ZyEuy3ssPmehjVCQfsiVtC+
WapmJwo81T5jzkrZWRG7ZOUsMz7P0vD35ljrXbZmaxZ/jWXrcyVbZ54+RvZ0
MZkuSfrqZCSd1boLki4eSN/o1LpTSVcOpB8x02Hsd0HLHkhXat1L1Vr3Uo9a
d0HShe20Wute7a51D/vVul93VaJa++d4/I7/5QDaKYHc/DcJ3LzY083fCFe8
FQ31TuTml0w3j3A3Lwk1OG5eJbt5UXnESvSUmFdQvlLQLp00j/IKTB8xJ6FS
zO84O0l7M/nJAWuRQLFuV3mO/ddPhH0m31Vut2OIfkt5ytlSKpJ+LEi5u1yT
c9Vdk1PsOjWp7xoXc3eNk3ePYlRp4oF079pLd1pH28LoQKK0Dqu9tA5I2ptG
MbPzoV3r/q5d6z7QrnXvxWrd/S+HjkF1dTX5vv7qr/7q/6F861vfeuqpp4qL
i8mHbt26RT70s5/9THx9165dyZMsN7F79+7vfOc7Dz/88De+8Y1OnTqdPn36
Hu3GQ17w0EMP/S8BTHlgNNHNJ/57oR1LHTc/pbh5/3DZO7KbL9G5+RXiaJKb
NzA3D9FwKru50wguqsRSnjRXTgaxY+ZKLFXvcB527mfyEJpDV/Z+M2FkrS/M
PRjbhpmtgfZbr2FJE6u40U6dCEFVSqYHkfTTXpLu7hrnU6HkhFbNSSKPA+lu
SQ8HO5Be43MgPdHZIvGm6NVkunQesLt0ijdFc4SboizeLqYH0lnZEmvRad8R
jY5Szj92yIgK2g5B3byTt5uPI27+n8zN7+Yobj6cuvlkIzKbuvk66uZ7LTdv
uFzH3bymUXTzq8TNb4YvXDfdnMSfo9TNSZgiIYuo5XbbzcXD5k5B+xaroJ1X
s7Nj5o6YL7XFfKEj5iMFK2fqPYKsWeYaztZMc709pYSt4fbz7DUjmLCLqu72
dLvo3U/ShUy6+0z6gux6UdL5gfSVO+tX7apfsyto17gUHEhPmPzyqXUv86p1
9zmQ7lPrXiXXupfJte53/GvdDaPY/3IA7RSy687Ozub76ia7+V3Rzc9o3XwE
dfNp1M1XUjffRd38NHXzK2HTzQtkN6+z3LwmrLh5IS/CtA9I8iLM8/J+kiV6
+NFIrywPt3IrocN2kvsb1+4qJ2vumlyyPlpycjpdH9FFnpm3JndpdgFdhcuy
C4m5O+dlDkmFml79J4McnAlSk+MXTBJ3jVNq3SPNOJAevNbd3fLirK7WPUha
h9VeigckZ8qZnbF2rfsIu9Z9AKt1Vy6HDrmTZG5eWlrK/lpRUfHEE0+88cYb
96ibP/DAA8TWi4qK2Eej0ej3vvc95ubhcPjrX//6nj17yPOGYUydOvVv//Zv
79lufvfu3TR9Q20aFlH5GFM/N3+TuvmQn+aP8nbz80/X5nUOXX+9vrBHY3H/
cPk7kZpRsYbx9Gd7ju3m2fQ+J3Pzc7ab37bdvFzv5pWKm9P7nK5YaiXNhWp2
MZZ+IYq5XXckxVIaRYl6b7E1fPMX5o6LrE37zN2XWcpIqxnZqUO2GZOE3b4L
ym9+OhHVu8rRkvQL3jkUj/Ik/65x+gPpHl3jlFr3gAfS65QD6Y01HsFWKluy
4y2VdE2tu9dNUXet+5dyrftuj5uiLN6ys0VSrbty/rFDRlTQdiAyIsbbe01z
8xmCm++W3bx4jO3mS6mbb6Vufpi6+RXu5hXEzStNNy+8G7bdPELc/MwVM/KQ
sHnIdnMSuLbbTdqJgYqHzdWCdjlpblaz0zPmZim7fbQ8c4Gpz8SjuZUTy+Yy
PozKeMa46z0yz5PVdcTRrsPtNcJa5Pm+4673HW8uU9unlhBV54l10dPFZLoo
6czTNZJOz6S7G8fNFyRd6Rq30rdrXLIH0rUVqn73aT1q3fN9at39DqQ7te6y
pIsdmO2SVH2te6l3rbtViWoYpcrlADfvGHTq1ClVbl7mdvMi7uYDqBZ9SH+D
z6duvsXDze9QNy8X3byiJkwHqEVK7CbtvAjzutCh3SpovybtJ62kuZ3osTaT
J4TNpFB4STaBNLPTsGan6ePTbRmfvthc0xafnL06dxp9wBf70HRZ24mtL8sp
XL+rXEqp26kfZUsZvLuFz9lJv2DiuuOnlfSmHEjXnJH02jQmO3zNp4WRT1pn
tTB8Tax155mdMXat+3BW665cDh1yJ6m4OWHcuHHPPPPMPermX/3qV7t37867
6+zYsePNN99kbt7Q0PDggw/u37+ffYho++7du8mfcHMflLudgpv/g+Pmz9tu
3qfTNdXNf8HdvNrPzafp3PyY7ObFDZabVzE3rw41Mjcvq6ZN2itok/bSGKtB
IhIqxtILdixVkua8AOmL0+Y9xs/YTU4hlvI7nCyWbvlCMnGyVmwrX7ipYOaq
3Jkrc6csPMmX+cyq3EWbCshaub181fZy3ibIrG/c71Qr+UdUr9ueVg7Fo9DR
feczcde4FjyQ3tLD13KT6dIp3hT9RL4pqta6x+OF4uXQISMqaDt07tx54MCB
ybn572037+/h5geJm3cnbl5vufkUIzJHcPPPqJufpW5+m7p5o+XmZY6b59pu
TmLOUTZAzXZza4DaPtoITjxsLnRon7nBI2m+xGrGboq5fbTcEXNbyQdNKTFl
3DbxLvbqPuq8uUae7yI82WW46uw9ibATVXd5ulX3Pt882M76yFkV73b7OH0m
3dXdfe6m0DxB0v27xgU8kC7+FhCTX4cCH0iX9tW+te4F7vJUtcuTXOsuH0gP
WOveqNS6RzW17oZRLl4OcPMOQ6pq2pmbVxA3P5qUmx8S3Dzf383NRnDczXmi
RzggqXQuEpPmh+hhn/26zaSS4lm6pYD7OJNxshZuLFjxafm6vWa9DV/Lt5aT
tWBjwUJ7cXPntk48fd7a3GXZhctzCvWpn2QkvcmTHH26xt2tdDe4cNW6+x1I
d5+RTHb4Wn6A4WvHPFoYKWmdza5a94Vyrftku9Z9NKt1978cOgbMzdevX79r
165t27ZNmzbt61//+saNG+/Zbk58/LHHHmMv7tKlC3kNr2n/4IMPvva1r/36
178m/+rGjRvsNczNx4wZM91m+fLl6fru2hreNe3Uzf875W6+1nbz/X5uXu/t
5vb5IO7m/LA5K0A65S5AsqvZ7WNBaixltevcypmPk0VkfPLCk85acHKSsCaz
JbzAdPZFJxdSW9/0uerpkqS7tmde/YI0B4gS3/lM4kB6ke5AeoBad+lIUZIH
0v2Gr3nUunvdFPWqXBJvim73qXWPx2/7XA4ApJam1LQHdfMB9fkjTDev5m6+
3sfN7zI3Lwnn37Hc/Lzt5ny4OQlNzM1zbDdnjeDEw+asoJ1orJI0Z43ZP1xs
nTEXM+bvzrHS5cTKzSz5qPNdRRkfeb5/VnG/rOK3p9cMmiatvhOL+00s7jX2
Oluis3NVZ57eb8J15ummpM+xk+laSV9qTnbTSrozJ32DObdd09p9qyPpSte4
oAfSE01Id048NW34mu4MqXete1LD13xr3SP6WnfDqPK/HEA7JTk3f+mfL3dN
4OZVjpu/2lDUJVzRPRrqQ938XW83z414ujnZTIZFN79TFrklu7l1QFIpwqRd
4MgeTDwdySswWSm7mOVhKR4m5kzJV24rJ6GA+fjaPWZwIItECfdas8v6KLvL
x4XdUXXR03MK1+8u15bl7PEty9Hf8WvSJMdEZTlOPHFPSNfkd3QH0oNkdnyH
r7nTOl7jev3TOrzWfYFc6z6J1br7Xw4dA+bm/x/lz/7sz37yk5+cOnWKfYi5
eSQS+eY3v1lWVhaNRr/zne80NjZyNyccOXIkIyPj29/+9gMPPDB58uR7tpv/
5je/edKmd2/1dMB9S2rcfO+vKg8HcfOlOje/SizMdvNS281rbTcnF3WsrDp2
tzJWXEF2FGYoKCiJ8ibt/D6n01Ezz4qlR/WxNKzE0k/sdDm3clHJiYPPWJE7
d/3NxTlli7PLyNaLL/JXsuasu0nWjOWXZizPtZzd5emrtpfrt2eJmvpqcyj+
hY7qnc/UHUinhs4kPanha64D6Z7D1+5K8daz1l25KRqwS6f2pujKe/Fin8sB
gNQSyM3/WevmPzHd/F3bzRf/rGid1s3H2m6+jLr5p9TNjxA3D2ncPMzc/Eph
OPeG6eanbTc/aLu5OdycDVCz3XwldfMl1M3Z9LRZ9LD5R3Z7dmK4WWLSnJ4x
V0rZuZh3tZW8P5Vx7uMDp1prAF0DPRZ7sV7VRxw1JX28Jen8cPpI51i6I+le
Z9KVrnEz1QPpIc8D6Tv9DqR7TEjXb6p9ylP1B9JTPHwt4ipMdR9IF6ukaGz3
qHU3jBr/ywG0U5Jw82dtN8/4yfWh/3IjU+fm+003r/Fz8+nUzVdRN99N3fyM
4OaF1M3vUjev9nBzluiJ3hQawTkHJO0ucKfkIkzrpDlLmrPNJDsX6WwmG7mY
W1ZOlXytreSrdpnBYeWOBGsVbWphVePYqk48fdYq2dOXnlST6UlKul2Z2dTu
FsUpPpCe0uFr1wMMX/OpdVfSOuvlWvf5Yq27/+XQMRBr2s+cOfOXf/mXvAKQ
uTl58PLLLy9YsGD79u2vvfZaPB5nbh6LxYiG889D/tWDDz6Yl5eHmnYfUuDm
nwR087mCm++y3fx8Em5ezt08pnVzGkvVgnbetcNKmrN+HZKYWxlzIuZEpUUl
X5JTbgVSGktX0O7E4lrB1g5nLaK2Tlzey9MVSQ9S6Kht6qstdEzNgXR5Qnpr
DV/zL1tyxunqhq9pa93FyiXxpugO8abovfhdn8sBgNSSUjd/1HHzk6KbTzUi
c6mbb5Dd/Cp180pPN79mxpPjtpvvs92cDzdXGsGJh815QTtvzy6eNM+cr5ay
i2Lee+x1RclNH59irv6TEy36Mibvg6iqs8Q693SeTCeSPtxuIveeLpOuNo4T
5qRPdUm614H0xfKB9FXygXSr1l13ID1Vw9fOBxu+JpWnlvoOX6vxHr7mTnhp
at2l4Wsxo87/cgDtlMRu/pi3m2f9+62Z/3ln8SPFa0U3f7LmzHNmb+Hk3Pxq
Ajd3hptHmJsLjeDsA5JeBe2upDlv/uYWc7N23U6Um0q+01Jyaxu5zYwS/mu5
vb10qzrLp4t17/RweuEyD0l3l7tr5kT4jAryCCYJW1C6JD2mHkhvveFr+rSO
97heKa0jDF/bINReslr3eUZslv/l0DFQzpvPnDmT6Dlr/sbdfMOGDU888US3
bt22bNnC3Zw8+ZOf/ET8VOSvxNDh5j4EdfNXPdx8renm5cm5eY7o5lHLze8o
bl7j4+Z8uDmtQXIfNhcOBzmx1LnPKcVSJ2POxXze+gKyoVJ8nITKpdvMfdcS
tmg1I3u8VFhiUCX/nGXVnRp4+6C6mUzfUe6ueE8g6ayp7zmptbvmtqfXgfRm
Tkhv8eFrFUkeSPe6KRqkS6d1U/RevMzncgAgtTTRzV/ycvP/Kdv9h0Ru/rmX
m98R3PwSd/NLZnhhbr7HdvNswc3FRnDzFDdnBe3C3DR60pwmzeUz5oOmlDhi
Llq5oOT9yJpU09d39WNL9PQpTkq91xgzn95lmCPpLJlunkzXSbq7cRyXdHdr
d6VrXNMOpEv3aQ8ldyA90PA192gP/+FrZerwteRr3et8at1jsZD/5QDaKSlz
80/83XwgdfNx1M0XBHLzetvNa/3cXGpeJB6QZF2FaRc4MdGz57hUgWk2LBLE
nIjzOpYrp4lysplkO0m2P1wq7CEXs/WJa9k7TGVXyVWdxZNltO5dTKbzDnL+
kq6PJwFbu7u6G/kdSA88Ib0lh6959RlOqoXRDrnWXewzvNj/cugYKG5O1Jso
9quvvnpPcPNQKPSNb3zju9/9bkNDA3fzqqqqv/iLv8jMzCQPYrHYxo0bH3ro
obKyMubmeXl55QLhcDid32SboVluvtjHzXs2Fg8Ilw+L1GTGGibQQOp28+M6
N6+w3Dzk5+ZsuDmrQWJuzmPpCTuWSvc5XUlzFkt5xpzEN3aifO76AvH2phVI
7Si66BN75Zh7ML4W5TgfUoKqlWEnnr5W8HQ7mW62kttcoKRRtDs01+SdNBxI
1w9fq03R8LWwxx1RJd7G/BuA5HrXuh9x17rH4xU+lwMAqSUFbj6eufkjppt/
wtz8teqTPWovDpTdfHkiNw97uTkJLAfPmD5I9p87LDe3hpuv3lXvdnPWCI5I
q1nQztx8KS1o5yfN7aQ5P2buFnNu5aKSZ2QJa6K5+ky0HliLfqhvlqDqdkqd
e7oi6WLFu1vSfUawNfFAOv1FsHxb0AnprTN8TT/UOLla92SHr5kb6Wis3v9y
AO2UxDPUgrv5bsfN64ib3/B382zq5l8GdvOI7ea0pr1Yc0DygnJA0lXQvveE
eTpyp1DNzo6ZMzEnmzom5ixd7t5MLqYbRXEDScLFgmx1WXtLe1cpdreQ40m9
JpkeTNLV4syAXeOSueMXbEK6/4F09/A1r3lASQ1f8691P6Yb17tHrnXfYte6
r1Euhw65k3T3aT98+PADDzxw6NAh7uaEJ5988oUXXrhH5Z2fNz958uQPfvCD
r33taw8++ODf/M3fsHlqzM0V0A6O4T1DLZGbz+Ru/stk3Hydt5uXyG5e7+Xm
Yu8Oy82vS26uLWhXkuYslm6m/djJBkkUcyeQbjN3VkzJF9rBk+y7zLVFXfPY
g+yQGFQXf6KJqKzuXSl6n0WT6eT9ZOsk3b1D8yl0TG5C+i3NJs11IL0Fh6+5
at2DDF8r8jiQfi3R8DW11j0erxQvhw4ZUUHbIdAMtSTdvJK5+SXi5u82Fn8o
u/k2283PmW5er7p5geDm5wQ3P8Dc/FiYBJ+ttpuv3WPmgEh4dJq0i43ghA7t
rKB9jFDQrq1mZ6XsTMz7MzFnVm7LeB979Z7gufpMsF6jqLqST2fJ9L4Ti4mn
v8El3c6kW+Xu9Ez6yLnyCLZErd2bdiDdqXWnkt4Whq/d8Bm+JtemlnsMX/Ot
dTfDezTWoFwOcPOOQeIZasm5+e+a7eZF1M0rqJuHknJz+4Ck4+a8Q7tT0C4m
eoRq9tmrc815FnssMVetXNhM8n2juTabay5fm6wH8+ztpWLr0q7SlUxPKOnu
4zNycaYaTxJ2jfM7kB5oQnrM40B60sPXkq91v6ZP63iO6+W17jvFWnflcsBO
Ukt9fb2o9sCHBDPUvNw8y9/N3wjg5gea4ual5p5BcnOlBkm5z0lHp30u3+dk
SXN2zNysZv/MSprPWJHLbnKqdzjZjU3q4yx+kq2X/5pLI+08HlS9IyrrIydW
vC+yj6Wbks5rHZMqTGrGgXT/4Wu3mzN8Ta11b7nha0qt+yVXrbtTuRSPV4uX
AyIqaFECzVBLys33uN18mhGZR9w86rj5UdvN7/i7+SnBzT/nbk6i5Re2m8sD
1FiTdtYIjh02d8aaCwXtUtL8Yydp7oi5kC5nfs2VvBdZ4/WrJ13WX0Vbt41e
9HTlcDqTdLHcnZ1Jd7q7z/WU9IQH0oNPSE8wfM23kiphrbvfpjrY8DVxU63U
uuuHr9VRSddUpVoRPhJtFC8HuHmHIZU17Qnc/D3q5h/p3DyPuvmNQG5eqnNz
sRGc7rC5UtDOEz1kMylWs7N5FnwzqaR4+E5yLt0ukkDB16yNZuiwlv0k31Wy
jeV8uzJHvO+3dJvmBE1ASXeKM09IlTmarnE+ZTlNmpDuGg/U7OFrydW6Fzav
1n0vr3X3vxwASBbPmvZ/83bzTA83P83c/CVvN1+mc/NrLjevVt28ynLz295u
zhvBaQ+b6+5zStXsxI4XZ5epsTTHSpQTy2ZKbsVPGjlnbjD3YJplh1YeV+du
cm6Bil2DnEzKdqfiXSPpruE7CQqT+IH0Swkm7yQ+kF7kcSC9TJb0Jg9f86x1
9xu+Fk5i+NpVj+FrVq17PF7jczkAkFqaXtPeTXDzjwO6+UZvNw9zN78uu/kx
nZuTnefGz6zh5u4BasTNp3M3Fzq0iwXtStK894dW/zcu5jxdLibKLQEfZ64e
yvrQXvSv7DU9BXMXPd3KpwvJdC7pZrm7LOlid/fgXeOUCenKgXRxQvoi+UB6
c4ev8Vp3XW2qZ627LvPlOXzNY1PdhFr3cDTsfzmAdkpQN/+9v5v/wtfNM1xu
vlp086i3m1e73Nwcbn43erM4mi80L9K7OT0gqRRhioke66Q5q2bfy5q/0TPm
dpaHi7l2M8l2kh+ztc68ucfWx+usJ6WN5UahMkdpROnd5kIn6U53d+m+n3/X
OI8D6WoLSu8J6QXaspxyd1MjKaQkqnUPMnzNXeuu1F7e8Bi+5tXC6KDYwsj/
cgAgWRK7+ZOymw/1dfMLAd18t+zmt/RuXufr5nZfTacGyaOpptd9zk37zC3Q
fOLmtJpdL+b0DicLpCyKsmjJ4+dHa501nT+WoyuPq/pyR3mfppf0zQWbXQcS
lcIk5Z6nz+Qd8t9Kve3pvvOZcPja3ZYevmZFWo9gq6119x++pql1j8drfS4H
AFJLYjf/R8HN/9XPzYsTuPkK0c3rm+TmuwU33+Byc2uA2gYzyrkbwY11FbSL
J837ZxXzpLmVMediLlu5qOHd2RprrbfGVr9lP2YfUm1dSKmz0ndW9+4p6WNd
kj5BI+kBD6T71LrPT8XwtYS17tpfAaeVniTJZr58a911w9fCoqSHIxH/ywG0
U1rOzestN+/h7eZ7qJufDejmJRWRItHN73g2L2KN4DwPmwuJHnfSnPXlYOWX
kphvUpVc3ElOp60mWcNJawk7TL6rnGn3uJCiikd9jiLprHEc7+6+LLtw/a5y
pzjHvu/nVZwZ/EB6kAnpakFm0Fr3RMPXNOWXPgckfWov/VsYObXu/pcDAMmS
hJt3+/HljMRuXufp5vOSd/NwQjfP1bq57j4nc3O7oN1KmrOT5kSEeSz1EXMW
RZUQOm21uchOjGxNzS0Z3ZVNpU9Oc0VX9/ydeR4VjxpJtxvHKV2D/O95JjF5
x6fLRxqGr7VErXu+u9Y9Hq/zuRwASC3pcPN9tptfY25e7XLzy9zN80w3/1Jw
8+2Cm6+x3dwabr6lfq7QpJ01gtNMT2MF7bQ9O0uadx91XkqauzLmjpgLPk5N
nK4x1d1cizzJX8Btnak6S6lrk+mKpA8UJd27a5zngfSlZhM88UB6ioev7WvK
8LVDwX4FqJVUgWvdnU11pWb4mlTrXhdujET9LwfQTvF0807Nc/O8VLp5eU24
NKGbK82LLrkOSNpFmDzRs2ZnOXNz86Q5S5rTRM/SbZ5irtlMsm0k7dqhLGlX
KYyKmGGnfnhUUQZGeEn6Wg9JD1ScKdz0S3x2Rm5BfLVQt5lsqeFr7vLLpDaN
7j7Dfi2M/C8HLUePHp00aVJmZuaCBQvu3LmjfDQnJ2eIzYwZM5p5eYJ2R6rd
/Jkk3fwCd/NG083LfNy8iLl5iePml7mb8xok3X3Oz5TD5nZB+wZ20lxImvNY
arY5skuPZm2k6fJ1VhSdJsbPleYGjI30JSvLXpPsc4hs8QA7Tezu6zqWOC+h
pC90JH2xJenygURXX98Ak3c6+PA1j1p366ZoPB7yuRy8QFAFTSNlbr6kOW4e
1rh5fuTcVermF83gabt5o+LmK5mb07uXynBzqRGcfNhcLGjn7dn5SXN2xlyq
Y7fT5cSvmW6LGv7maL/lFnbH04VkOpd0bSadS/pbfE76iKM93AfS53FJr2OS
3nLD19Z5D1+Tat2V06Nex53EA6RJZb5cwT9hrbso6Q3hmP/loAXxtu3Twm7e
1XbzQU1wczaQt9J084ifm7sGqInNi/gBSbUIUyxol5PmS2hfDtatiI20UMRc
2U+aO8mV0k5S3E+aS9hS8v2kl6f7dLrggWXZJ+YItqmLrFp3suatzfXpGtcS
B9J1LShbcPhakMyOb59hfQsj/8vBTXV19aBBg8if5PHBgwenTp2qvGDy5Mln
z54NUyJyuRG4H0i9m19O6OafJHTz2oBuXiC5uXqfk7q5dZ/zmHXY3CloV5Lm
djW7dZOTi7kQSEkYZFHUCaHLzQ3YxGXmTsxcS+21zFkT6SbN3KeJFY+ufIoy
hUds8CtK+kescZwwgm01nZNuZVIC3fPUn0Y8E+BAemqHr1UmO3ytwWf4mq7W
3Tpb5BNvr8fj9T6XgxYEVdBkmuXmA2Q3Xx/EzbcndvPb4csF4Yuym7PIydz8
E8XN6Q3MhbKbT+NurjSCsw+biwXtvD17/yl20lzMmHMxp7lyS7Rt9e76gbO6
kJVJ//xAep4tS9VtW7dS6mIy3VvSxe7u7q5xPgfStRPSkxq+pvR38hm+Jta6
Jzl8zfO4U6JNdVRfRuWzqZZr3esbDf/LwQ3ibbvg4Ycf5i2F77W4m4/3dvNr
GjcPebh5ia+b88bCQpN28YAk7yo8Z00uK2hn7dmtRM+nTqKH7SdFMWdVl5aV
2/kdtp8Ud4/uxfaTLKRMEjzd5+6fl6RbgYXW58zfWLDA1TWuOQfSm1+W4zt8
LRZ8+JrH0F6PWvcEw9euew1fUy6HhDvJysrKy5cvs8c3b97s06eP8oL+/fvX
1dUVFhY2NDS4/jXo+LCIqunTnsjNbyXn5h8lcvMivZvXerr5VS83dzdppzVI
O4449zm3fOF0gZuxPHelfYiSDe0Vb3LO5GLOrZzeyeRKPp5O8v1wibkZ81x0
/o6UT/HwdCeo6nZrjqSbafQTiqSLrd2bfCA9qeFr7k3aTW2te+qHrzW/1v02
i7fxuBT3grg5gipoMkRG5syZI25iU+Dmh9xuPj9JN48QNz+ruPkJM2yqbs7y
QYKbz/Ry84WmmzuHzT0K2sWkudV9XRFz2cotH8+sfoOsUcLKtFYXcSmerkum
aySdd3eX56RrD6QrE9K9hq9NcA1f86l1n+dd675SrnVf/1mg4WvaWvckjjt5
bapv6bqRKJtqsTa12miCmyPetgs6deqUlZXFJ1A0z83/TzA3X+jp5uFb1M1L
qZvXUDcPJ+Hm8nBztUk7PSApFmFqCtq3WcMsrGp2XoHJxNzeTzpbStvKzf0k
31IucbaOyiIvEzeTfGCEO+/jJem8REcJLPNdXeOkA+lOI0o1pGgnpKdw+FpR
wAPprlr3lA9fi6l9hs1ad+VySOp05PLly+fOnSs+U1FR0aNHj5EjRw4ePDgj
I+PSpUvNvDxBu4O4uRhR24yb1yXr5j41SHvlGqTs/Y1Oh3axoJ3HUvtYEOv8
ZmXMWaejFU4Itax8sbkBI9swshcdnWgpo3I1nq4LqmaPX0HSrYi6rX6hNSfd
kXRt1zjnnqduQnrA04gtMnwtUa27x/C1VNa6x+PSTJ9kz5sjqIKk6Ny5cxaF
P9MCbj5d5+bn9W5e7OnmnzE3/9J08806N58nurk9QE1p0s7cnNir1KFd6AJn
urmSNLdL2bmYq1ZOZfx1ska61ihpMWdn/0qUdObpXNI9y92ppCeodbcl3aPW
vdar1n1Soo10kHOj7uFrYq17kOFrB/2OO3luqpM4kC7Xuoca4uLlkOx5c8Tb
NktKa9oVN3/N181zUuDmdmNhYehPVGksrDZpp43g+GHz2atznYL27VaQ5Kcj
59j7SacCU7RyOctDgufYRXRL6b3Gsp3kYjnpI8YW38GO0swIuR0l73ShOZCe
ozmQroQUJe8jxZNUD1+727zha02pdY961rr7Xw4+7N+/n8QuEsfEJ4uLi5cu
XRoKhQzDyMnJmTJlSnOuTdAeaXJNezJuPtHDzU8Ed/MS2c2vy26ung9KUINk
HTbno9PUWCpUs7MzQWw8ED9NyUMoV3KyByMbUbIZGzXf3JWpa7612G6NH07k
0VV7PtGdVdGeSScRdbZf1zjhQHrCe57C8LVm1rr7DF8rSjh8TV/rHvGsddfX
LPnXulvxNh4P+1wO/iCogmRpkZp2yc3HCW6+ycvNy5mblwZz8wMJ3JyVFWnc
3G7Szg6b98g8r3ZopwXtSjW7dcbcPlrOrZwlyl+3rfxPZL1vrdfo+pO4RlqL
O7uXpzuSLpxJ543jfGrdmaQ3p9Z9oqvWfbp3rfsCXuuuG7621nv4WjK17uHD
CYevuW7S8i5PiYevlRu19U13c8Tbtkz7cPPqRG7OGwtfUYf+qM2L7AOS/LC5
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
SZ/sKekJuhBv1nQhDjB8zVXrfsS31v28dNNPX+ueL7Sg1E3yVWrd9XMi/Grd
Ew1f05yRlGrd/S+HphGPx3k+PY0Q497y1/9739/8vf8iryF6nu4323FIjZt/
9ljybn4wJW4uzqPUng+ibi6dD9pM3XzmytzJQiM4J5aKBe2rncFA45bSanYu
5vNq37fFnLcgZtswouFkS9Yvq7jfRLPrETtcyRf5K0uskNcQW39jmOrp/cab
+XQlwyJm0pW4ysqTPGvdfYevCWl0j1r3YKcRT7XQ8LWm1brrJV2bRq9pgpsH
oY0EVdDWaDtuXhLMzbd5uXm25eYf224+aaXVkcNxcz7cnEZIEuV6j72ubQSn
L2i3k+ZixpwVsbNcOTHuFwYXPT+46KXh1S8Ns1ZneZFnnn+7iHi6qOpiPl0j
6ULjOM9ad1cavY9HGp18vyTavyGm0cfpWsbZx5qaXOvuNcVYKUllw9ekWnd5
+Np275u0XpVU2uNO2onGJHT7Xw5NA/E27Tz++OPdunVr6gy11nfzqOXmRVFr
6E+hNJDXdPNc82fbPZDXaSx8oHHtLqFJ+64GpXmR9oAkj5P8gCQvZSc2PSgr
f8RsjZIPIeuj2sEf1QyeXvP2dPNP8pg8Yy6XsJN/OHhayQCh9F2RdKVQR9vv
QulImXD4mmet+8FEte5npC6USQ1fC9SCUu5r5FHr7t49ureO7vJLJ42uXA6p
2km2BZibnyFXtO8ieg43TyGdOnUiEZXP9Em5m0fT7ebu3h1sgBpvBCfe53QO
BwkF7ZoGR/Osc5Ssjp2LeS+68xRlnPUL6k8LOK01xXqSp1cyJlBVt/dv7Kwi
S7Ioku6cSRcax7kPpKu17uJtz21yX/eFTq27MiFXG07dfd01pxGbVuvuMXzt
jsfwtaRr3T2Gr8WMmHg5dKSICtognTt3Zrk//kwHdPPFGjdXmrSLjeCUDu2K
m7tL2Z/rf+0JmihnSu6Y+DvmetG12PNc1Z/tZ3p6AknX1bqnoGVcC9W6u3sv
uzbS/rXum4LUuh83R967h68paS+zNvWyZ607idvi5ZAqNwdpp8Xy5i+1vJtH
lYG83M2PiW5OB/Lukd3cbNK+xNw+rZMbwamHzdepuR4eJ9mWcvDkfCbRI2iV
0TBVyWuZkr9Nt5fKIk++rQi77ek8mT5wYr5b0se4D04Km0m/WndXiU7CWnev
4kwzpLhq3aXha/617h4tKG+kuNa9IWGtu//l0K6Bm6eFFs6bD5fdfHlruPkF
l5vLvTtMN7ebtK/cKTeC2+xM7J0u3+RUNpzveYi54+N0Y9aPbkHNDNEka8PG
F2sl1M92dvNfTa3pOVqWdHsL13/Cdanlr6uVkDh/zbzz6T18TUqjr705Y/kl
tWXcPnWTpgmnifq6ew1fc9e6u8uTxJufXsPX1Fr3aqXWPZaw1p1FWrg5aE1S
nDff2iJufqhpbr7C083NJu0jzIA2WNekXerQLop5ppU0d4s50Woi5qqPD60i
6wWPZX5UVnUzn95PknRW7s7PpEu17km1jJuYoGVcumrdeWcntpdeIw9f86p1
F2/SaiupfEZ7KJtqErT9LwfQ1ojH44ZhJHxZq7v5jFS5+XUPNz8huPkB2c23
i24uDlDbYfb5EZsXiftJNdcj1GGy5m9DppcwMRcT5VzJxXSPssSyzEHTuKeb
n8GR9Jk6SZ+S/96su+45QX617pv0w3yVWvdlW8sT1rrvPKLOc9RU5njXugcf
vqZOCJKHrzWr1r3BqnX3vxzaNXDzlBMkqLZ5N4/p3fy26uanBTfX9O6Q3XyD
7OY8loqHg6bZh821E3vZIUo+GIiJ+QC7xxFTcubjGVnWFlS72Ef7uoohWTLd
lHQ7z/LmiKO8ElJT6+6Kq+rwNaE2SRmP7tsyrkGpddzlEU5btda9LFCte5Dh
a/ehm9+6dYt8mz/72c/EJ7t27Uqe5Kc1Sdz467/+68cff5y/oLa2lrzgoYce
+l8CaP0hEiTetpib9/R28y9S7+afBHVz8x7mbHWAmtqkXXvYnJ80F6rZnxtg
ifnzg4uYmDPd5gL+/BC/9cIQUdVtT9dl0lnvONPQ32t2Gt231j3QeHT/WvcV
mhHGH3vXui8OWOsul1F51bpru4b6/AogEdv/cgBtChLTZs+evW3bNv4Mifnj
x49/5513Zs6cGQqF+PMdzM1Pad38RGI3txrBiftJ7uZ04o948EdMmhNrZgck
h3pbuZPxmSxldpSyTO7pLKXuJNM/NsWfSbpY7t6bSro7wkh93Venuq97kOJM
oQtlUrXu+uFrJdLwtSLvA+lKrXtVgFp35cLpSDtJuHlqUYJqwIiaVje/23Q3
vyq7+Tm/vppk1yENUNumurl42DxrhVPQzjsPi0lz8RBl/ymqlTMBZ/s0djix
1wTrr8pSTiyKqRal3J1VQrom50qNPlhuJZUt49gmzWNMRqBad1dE1dS6Jxy+
lqjWvTS5WvfGWEzaK3akiOoFcfMHHnjgW9/6VlFREXsmGo1+73vfE918165d
zz777Le//W3yYvYMc/O7d++m5023eQLG2/bo5jmymy+13ZxHS/P4j90z03Jz
mg8amdDNhUZw7oJ2d9KciTnx6JdsMXdb+R8GW+u5wc5jviRVTyjptNY9BWn0
RJPXEo5HF+/EBqx1d0YYJ6p1X55srTu/SatUUrlr3ZXa1MsREq7FH364eVvm
xo0bEyZM6NevHw9r5LfA22+/XVhYGIvF1q5du3jxYv7iFnXzxrbh5mzoD3fz
HNvN+XBz3ljYadJud8ucJjQWlm5g2klzdsz8nY9NiWYV7JKVT7Fqjfjesq+4
XAWZ0m3AqU4yXcykszPpPYSZ6e5a9yT6umc7te7uwJJsrftncnGmptY9Tz47
E6DWPd+r1r3MVetexWvdXcPXQjpJbwjdk+lIO0m4eQpRgmrwiNoUN9/a0m5O
LpYgbq721dzv0VdTcXMhlpq7zVlCJohPBeLdjaSk+cfWhrNfVrHTedjDynva
Zyp7eq1EvX9ZubuYZxGTLO6WceNS2zLONR49qVr3Y4lq3d0TLVuy1j3K0+j3
p5t/9atf7d69O583tGPHjjfffFN081deeWXFihVDhw4dPXo0ewZu7kPweNvO
3bw+uJtnCm7Ohpt3H3Xe3HDqBqi5D5srBe1SNTs9Oc7FXGPlb5vrWbqeU5ZO
1S1Jf0eS9Cdp47hUpdF7BUujO+PRXbXu7ze71n1Wwlp3eS+trXXP0de6S5VU
Psed7pRJdUpw87bMqlWrjh8/vnLlSu7m58+fnzx5MntcWlrat29f/uJWcfO+
idz8crJufsPfzS9q3Nwc+mO7+dw1uXy4+aqdDdLQH9qk3d1YWKrDXOAkzYfb
SfPBH9VyMVes3L8I08rvTJRKMZU7gVpJ76+rdffv6+60jFunxpbka90LNLXu
ukbE2lp3PirIqcxMptbd3klqat1L5Vp3/+FryrXTkXaScPMUogTV4BG1A7j5
kURuvmlfw8JN8nBzK5bWz3U1guO7TbGgfYSu83B/WczNPado5R9a03u702OV
6vpQyLboOguxjZySRhf3b0oaXT2NnrqWcat3lCsHEq00imuH5lPrfjLJWnc1
rirD1zxq3e86t0A9a92jsbj489+RIqoXzM2Jjz/22GPsmS5dupBAwd28rq7u
m9/8Zk1NzenTp//u7/4uHjf/EzE3HzNmzHSb5cuXp/PbaEsEj7dtys1vt5ib
jxbdfJbk5u4Bak6T9jFmAlotaHclzZmYvyiIuajklpUPqnpmkPmnZgnO7ifp
7gPpKUqje7aMm9qGat1XyrXu6z+Thq/leAxf09a6i78Cbt+Fm7czRDf/4osv
FixYwB6Hw+Fu3bpFo9agkzS5+ZqWcHNzIK+/m3/p5+Z86M8ceeiPtrEwm5tm
njRnSXOXmFulmMLGUly9eEHmeGdshFiH6TXhcZBQ7s4kndW693jfmb+m7ese
pGWck/TJUac6+te6r99Vbta6HxIbUXoUZ3oPc5SGrwm17peD1boHHb4m17or
V01H2knCzVMOD6rBI6rezV9oQ25e0FQ3Z+eDFDdX7nOyppr8cBDfbbKbnHxc
74hZUpWmuNvMsNPlLE5aPY5Ym6Ox1dYaY+7c3It91DPhwgPsFFcanbf8dY1H
H+NKo3u2jBNuey7ybRmn1rrrWgalptadBtW8ZGrdbydZ637funkkEiECXlZW
RkLBd77zncbGRu7mS5YseeaZZ9iL//7v/3737t33bDf/zW9+86RN79690/lt
tD2CxNuO4OafutycR8tlTXVzdyM46ubuk+ZiNbtbzJl9Eyt/ZqD3GmQt5ule
ks56x3ml0Z9naXRtU3fv2ejuqK6eY5qS4lr3LKXWfY1a6z4ncK37Wu9ad/Os
k5Lz0k5KOhsme2Dxhx9u3vYR3fzTTz9dtmwZexyPx0lk4wd22Aw1BtnMp9XN
b6bWzQ/p3Hyrxs3rlYG8VpN2zzrMuuEfl1gF7WLSfJpzutwpxVQ2lnbSR1k9
hCJMvafLks7OpFsN3uVad680etCWca7x6KmsdT+lVuboG1wEqHW/rtS6u4av
uaox9bXuylXTkXaScPOUw4OqT0RlM9QY2dnZ7cvN83zc3GMeZfYXGjdXBqg5
TdrZZHP5sDkraGft2ZWkuZMxl8X8LbrttBx8tLVtY4ulWroG2M5Jhu6dRpcK
3ecKE3nk8qQsV8s4Vpsk7taklnHbzG251DLOYzz6NtcOrUVr3Z24WqzWukuS
7lHrft+6OXnw8ssvE4Xcvn37a6+9RsICd/PHHnvsL//yL79Deeihh1588cV7
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
c/PzSbv5Ink/Kbr5BKF/kXXYPEtz2LyfO90jB0kx48OSPq8OL+o8+Nof+p0j
izwg69URRYqqa0/WKLXuGbqdpJNGn5G4qbvXZlKJLU7LOF6iowssQWvdv3Rq
3fd41bqfl/I++lr3wMPXlIJM/8uhXQM3b2mCRNT27ubHUuTmYuMOpUn7sJm1
PTLPS2PNXTkg1tdIFXNbyclu7fmB1ywf726uZ/qcI3s59liVdN2kHsnQP0zc
LE5sJaQtdM9c4JlGn7TSd/KaEFG9xqPzWvfswLXu6ixLba371abUuisVSo1w
c9AyaONtStz8Vurc/GaT3HyRj5sv0bu5Mm7Sy827jpYGqKmHzc2Cdo2b8zPm
LAPOxJzY9xN9q57IqHrce/36TUvSH7WT6f/53CeWpDNDFw6kBzR0/0J3r35x
CdPo2pZxTat1zwxU667fSAerdXeGrym17iQ++18OoJ2SVjff28JuHlbcfJvO
zVd6uLmZ69H1LxIbwSmHzd1nJLV1mCxUEisnPv50ryNPCetpYVm2PuTaS0Ou
qXU7rlr33hM8d5JNmI3usZk0Mz7TPUp0tIGlCbXuu/W17k5xZuJa9xu6jI9H
rbv/5dCugZunhea6+bqUuPntVNW0czc/oHPzHA83XyS3NvJxc3YySDxszveZ
LIr2cEVRUcxfo7nyZ1iuvPuRp/uce3FI0R9HVL8w2BykSx6Qvz434BpRdS7p
ZD2bcY5l0pMwdK+j6HZ65U13R3chje7Xh9PV4sO87blFMx49hbXuXza/1t1j
+BrcHLQm95ebzzVjy/Ck3Fw3QE10c7Gg/dm3naT5UwOqfvuWmTRnVeuPvX5W
0vA+Vf8jrN90v0MWeUCed0s6y6TzM+nE0H9H0+hKobvPUXSvQvfXfNPo7hag
ShpdnbymaxnnrnXvO+5682vdlY00H7jpTDH+JFCtOwnO/pcDaKd06tQpKyuL
bOPZX+8HN8/mbr5H4+Zz5TpMt5t7NYJTCtp7sl2lOGLyAydXzq38ub7nyGKn
I9kif32q5xFzybZOJP21EUXauh1NGl08UyMcqOH94oZSQxfT6L180+hek9e0
49HVWvcdza11/8KjONPM+/jXuruGryk1mcrl0JF2knDztMAianZ2Nvtrytz8
Vttw8xMaN98ouLk7lmrd3Byg5poH5D5s7jTroEnzrqw+U+hr9Kxt5c8IVv5k
r3P/0+0IW2bapd+1l0dUkw89R3MuPJnOMul/0u3o3O3c3VPReR9O8Sg6z63o
mwhp73yu0I2zdEfUrS1Y6+7VhFOKqImGr7G42hCGm4PWo3PnzlkU/kzSbj4h
rW6+3c/NJ3i4OSs06p9VrLq5cj9TN9z8D3Sy+VO9z3kVtCvHzFkpu17J37rz
y1fPkvXzlw6z9V9drpIlSvpve9yRyt3tA+lehv6c98w1/6Po/v3ilDR6d1en
5QQt45pR624FfNfwNf9a9/k+te4769fYw9dIcBYvB7h5h+Hhhx/Oo7C/dhg3
P+zt5mt3lRMrnL0613TzXQnc3OpftIwPN7cawbFjkkojuL6+SXMWITsPvmbl
ynseeXmYOSfipXeKSJB5giZ9nskw1/MDr5FFHjzb95xj67akm2n0TDXgiNFG
09Tdt19ckDQ6+QUxQTt5TWlHmSiw+NS6L7Vr3T9NtKsMWOseZPiacjl0pJ1k
qtw8Ho8bhlr8D7xgvZd5RG3Tbl4mu3lh092cGCJRxVW6WMrdfNJKcbi5M0BN
PDspHTb3jqJsn8nT5US6iXq/PLz6mX7XiI//jqw3jzzR8xz583e2pBNhNyV9
uCXpQQ1daefuPoqeqKP7u2zP5p1G1x4g0rSM26I24bTHo6e+1l0tTNLVuru7
fLDyJLg5aE2IjMyZM4fH23twc+7mYyQ3/5Pg5n6HzamYPzWgio1LY2L+6zev
Esu2lLy3peSWj3c21yN0sceKpP+PkEnnhs4K3dlR9OYaOi10f+Xdanca/Q3f
NHqQyWtSy7hU17pb9ageh0aVe7NK+2W+lyaRWbkc4OYdg45a056smy/R7Sel
3sL23B+xSbvTCE4eyKtJmtPw+Id+55iVk90gs3Li40zMfRbZQD5DizBFQyeO
L9a6u0+jJy50d/WLI+HFTKOPTDqN7tUyLmCt+6xVuU2pdT/T9Fp3Lun+l0O7
JiVuTsR89uzZYldJxoULF/r16+d+/dGjR8ePH//+++/Pmzevvr4+xd9Se6Cl
ato1bj6/vbj5dNPNnRJNdpOTnZ1U6jPFQOqTACJbLxIPzcDY5xyz8ucHFzlW
3uPc4z3O/qbr4Sczrv6265Gn+15jkv47IZn+MjV0XuvuGLq7yn20EFrdzeLk
QndrZq6wbes3Xk2s6LMq4obNPXlNGo8ecgqTmlTrvkupdT+VoNb9tKvW/YK7
1t2W9PpGuDloPVJQ0948N69pXTd/19fNe8tu/qbOzT2btAtuzk6aPyImzYVE
OVNyIuOPvnL2sTeu/rrbnd/2rCKLPCB/JU8+Ikg6eb2YSWeGzgrd/yMpQw98
FF3bLy5xGj3R5DVNrfvYFqt1ZwOSlM5Ockkqq3UnP2P+lwNop8DNiScmdPPx
fO4Pd3PepH264+YZHvMlWR0mF3OWLjcri6h6P9Xn3AuDi8j2kvzJFgk4ZJHn
n5LNneWJVEkX0ujdXOcl/Qrdp7gK3YV+cZ5pdI+Dk14t4+Z4BJam1bpLu0r/
WndT0hPXuvtfDu2a5rv5jRs3JkyYQBxccfNQKDRq1Ci3m5eWlg4aNKimpoY8
Xrp06dq1a1voW2vLdHw3P5aEm8/ibr4qgZuTfc4goWuHtcm0u8Apm8yX3yli
GXNTzEfYYk5z5aaVdzksLUvSD1uSbifTuaFrcuguQ/dr5+46is5yK+5Cd6lf
nHcafWKAcZbOsUThnmfr1LqrEVUOqnBz0JrAzZN186f7mE3aScwU3ZwfNrcK
2u2T5lbSnIo5UWxu5cTBf9vL9PHfsNWDLvuv5HnyArIekTPpoqGzQvfghs4k
3W3oShpdMXS10H2UZuxagjS6vXlOajy6ptZdd1d2nK7WfWoyte6nr8DNOyZw
c9PNt1luPl93RlJ0c3OA2ih5gBp3cyE2untxdB58jZ0uV8ScRJWXhlc//3YR
Wc/0vSYu88nB1iIvEyX9+YHXyDbSrHXXGbpyXlKtxvQpdE8mjT7Wpx2ld8u4
4LXu03xq3Y/41bpbxZlyjyPp+KSQ9PG/HNo1zXfzVatWHT9+XJnGSFiwYMHB
gwfdbh6Px+vq6tjjxYsXr1mzpiW+rzZOG3bzhtZ08/nyVnOqsNXkbi7uM5Um
7Vb1kXZKL0ua01L2l+kBcy7mxMGZj/++99Wn+98hf/6u+1lR0om5P0GWUO7e
dEP3Kk+SZ65Jhe5KYsUjjT7OaxCPq8WHezy6UOt+Mi217qEGuDloPdqkm0da
3837Km4uF22+Lro5HaBGtpe0Sbtpu3+Q3fypAVWsPfsvXt7Pk+ZczB995axi
5f9trkp7SZ5uSvrrkqSnxNDd7dy1R9G1he7JpdE9WsY1v9b9gwW+te4rg9a6
k4DsfzmAdkrHcPMLWjc/K7p5Y/PdXB1uzgeo8S3lRH1sJHGAnTF3enEIYs6y
Ob91rd8J6/c9zxFbZ/l0n1r3zoOvKXMelcYXmqPo/oXu/ml07/7D/i3jmlDr
zoavkV3l1kS7yoNsV+nT40iodfe/HNo1qTpvrrg5sfUlS5aUl5dra9oJRUVF
s2fPfv/99ysqKlL8LbUHWtLNB7a2m+eqbv5Zsm6+QbPVZIeDTDenXTs0Tdrt
RnBe3YZZ0vzFIWa50ZO9zoli/t9dDj/R+6pZn/m2NaCHLCLpZLky6VIOnYRW
0dD5VHSv3r/8KLq2PElNo3vs2byyKt6DeNTdmmY8+lYrnM7mafQka93dYzKC
17rDzUFr0g7c/EIT3TyrBdzcNUBNU9DOusARMf+lcNKcibmZLndbeXdz/Zou
9ljr6V6Gbkq6y9D9O8UFzKGLR9H1he5CGr2rbxo92Vr3Lt617u4pHu5ad/eh
0elr5c5Odq07icb+lwNop3Q0N89Lzs1XczffKud6XL2FmZsPmZxP3HxQVj5z
8yEz7CbtU8zr1DlsLpRisqQ5EWd2xpyL+QuDi0gkIWJumjhN6DyVcVVc5Bm2
yEe5rZspdXbKxjb0p/uYveMSGLquWZxyFN2/0J2n0Xt6p9Hd/Yc9W8b51Lpv
b3atuzQtSFvr7ki6/+XQrgnu5p9//nmxTW1trfJ5RDevrq4eOXJkKBTycfOC
goJNmzYNGzZs//79LfsdtknuCzc/4ufmzn3OTb5uPlfv5k4gdVVmOknzHmbc
Y83f2BlzR8x7XbUmAbEd3SCNpP+3ztBZszi3oVvbOY96SCm0jlcL3XkanXf6
7U4Hozulj640utrUPdEBIqXoscm17gmrkgLWutfVw81B6wE3T8LNfQaoiW7+
1lWeNCduzqvZiVnLYu4o+a/fEpbO05mh/5Ybuq7K/bHXz7JOcQmnrblz6Gqz
ON+j6AHT6MrkNa+WcQlq3RP2ddeWTrl6L2tr3clPC4nD/pcDaKc8/PDD2dnZ
ba9Pe2Ua3DwnqJsPzFKHmytbyh66gnbm5krGnIn5swPusCDjtZ7sY9o6k/Tf
2ZKupNG1hu7fLE4aDBSw0N0jje5VouM/1TG1te47g9S6X5Rq3ZXLoSPtJMlF
PXrWGfIj7b+mrijcunUrd3P35xHdfNasWcuXLz/z/7N359FRHWfe+HPOnPP+
kTfvOZn5zcw7eudM3vdMZiYzk5mJjQxeAbN5wWJf22CzCyGQEEiI3YC8xDgC
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
Zt3J38im5QCbp0bs3aGWzjb/RfPTG5sLfmqweTGzubzdQw9ppy7mr07jm+YK
lbOKxG+fFLTRuedJ6Yi7UuiaBw6br+4Vzeco2uhzX7psbaMvXntZ88II27Pu
IaRv3WeedSevDdv+uGXXRdNySKUnSdjclaTDHWrx23yZxeaFJptzt13QC9TC
h7SHyhe9Pe2RyZ/wA+3Bneahykmb5v1nXGOvx0Iv8oxHtc6QThQf/ranfMSd
b6APjgidNdDHLGoYPbeWCX1U4RnpRsVoD2+KISX+KE7dm9ciR8ZFuSxjq8Oz
7ldhc9g8iUnMHWrjHbZ5hcM2JwufVADyiOWYzYvMNu8zvsJsc+NAO980JwZ/
cGI9e/WyvMgnUJ4/EOK5znx7uIEemm9/ZGoN30Dvn1vTZ0IFG3GnPDffs6Yv
dONhcdZBd/N5cfbb6MJxKUdm3U0bM2HzlEk6zLQnyObzhDZ/3mjzZQ2DjTY3
DbQP5c4vGsSrPD9chbLomRjs24aWNjrf8TE10HmhD8ytpDWHH3EndUYmdPGI
jmI+Z4V4PkfRRlfcvKa4JMg6675OY9b9Tcmse119s2I5+DqwuStJt5n2X2rY
/KXIo+Zyi81ZA0hoc9MFamPm19JD2gdNryRAfmjiQWpzdjz7wIJw07zvpKpH
p18jr/78i9M6Ezr5/M7veVob6JFyGm6gT9ZtoMd1lJBoSEmnjW46Mo4iPdxG
t3U9uuk6y0hF5WfdV79+Ujjr/s012Bw2T14SM9OeDJu/4w2bG3ZWhmzePfAR
u0DNcEi7rGk+NGTzCfWqV4jn3fR5zjXQhQfEkaLNdqD3jHTPBSPulqvW1EKP
OugemFdLhR6lja53ZJzWrPsq1az7W3uuqpcD4tOkj81/rWfz9UqbE0ISS5Ly
uEBu85yIzSdFbD5w6qHwQXDGzeb8+UU8zGnxoYXosRnXHp5aE+z78HXJ1EaP
r4E+LiJ0/pg4/Z2SsmfI6G30tU2LXmkqlN28Jpt1f9OxWfc3PriqXg6+Dmzu
SmBzqc1ft9j8FYPNZ9FC+rMoNh/MbD7hoGGgPVQ/KbrJE92joUe74Gu64BXk
+aQoDXTFfDt5kAsK3bgDPR6hC3cpGq5d0zkybmHn3KPi+CDFrLvyXHfDhnTZ
rPvF2ibFcvB1YHMPBjY32Tw3DpsPMF5uTh44ycNn95DNiZfNx7OHmubdQja3
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
j+TUdLbOZ6om2+kz22M5FYTnWdMq+FODGM8HTa9kRVXWQB8p34QeVej2rsyw
FFh6Va6hja59rvvzxln3i7C53ObCvonwTZqGhoaioiLyT/Lx4cOHX3zxxcR9
dZ6Kfr1Nrs1/mV42nyG1OTuknW+aW1V+/9jOl8HmknPhFK1zAc+nd/KcXazG
81y4/ZxUcusO9IQI3X4b3d6RcaHKv+tj2Nxn4ctaXV3dtGnTli5dWlxcnJ+f
f/LkSfZpsHlCbT6ioJLYPNx9Ftqc32zOmuam8SHj86RV6MFn0QjPH55aY+vk
dlZhSGFhp8ONmFMrbqBHdqCTGjJaJvSnNYSu2Ipup42uODJOc9bdtGpS6UkS
Nnc8rKjqV1TY3GTz5xJgc1pF6SHtvSdUPcQdJsxevdlrUvBl5jl78OMuVgtO
tlta57LJdgHPQ7OOI4pqB06vpPPt7FIMQQOd8Vz2kCZ5TtOaU7K20UVCp230
OGfdL1yCzaU2F/ZNhG/S1NfXnzp1in58/vz5vLy8BH1p3oxOvYXNE2Xz0J1B
PUJPlfRKyn4Wm9ND2qnNFSpnNhfw3DjZft+o8t6W1rl647ldnvedWEGKedaM
GgJzWQM9RqHH0EaPevNaNKTvhM39Fr7UX7p0afPmzS0tLW1tbbt27Vq1ahX7
NNg8qs1f0LA5e6ScZsfmnYe0h8oguzeNTbPT8zDpw6RU6JGq1Xt8+Gi4zqvP
LTwX3tXL85ydDsfzfMwicQOdCb1zxF00iiOcxpENusfVRldejy6cdTetmlR6
koTNHQ8rqvoVFTaPzebT7No832jzKUaST+p89Qq95DyXtM6th8JZJttJCbXw
XL793FYDXS70eOaUFPdamo6My4+00U2z7ssss+7na2HzKPvNhQwXvsnn9ddf
f/XVVx34MvwTnXoLmyfB5sETPESXm8tsblD5mPquw053G36a53ksrXPJZDup
1eTJmfKcdaaEPO+fW9N3QgXbfs430B+dGuZ5zEIfId6KLhK6rTa6etb9mYad
B2Bzb+Xs2bObjCHv8J8gK/VNTU25ubmNjY30h1lZWdmRkId52NxBm0/kbJ4V
eqQk7CWPbYIL1CwD7f0ij5fBh8mJ4YdJodD5B0viesO5cIzn0U4bjs5z4wFx
fAERjLgrhS4bwlQNuke9G11yZFzUWXfT6kilJ0mynMfPPz5rVZP6lfPMedic
JraiaqqomZmZrKLu3LkTNg/b/M3E23xS2OakHoa/qznZTPJeEyMvnudsY2Pk
wY+1zoO7zseIW+fCKjqC8TzHHs/HLpY30JU9dMWckvq4j6i70cVHxj0fvB5d
Met+Djb/vz/av39/UyTWXycGmx88eLC4uLiurs7hL8nVOFJvA4EAq7f0JjXY
PKE2F16gxtuch/ndo6q7DC6/I+sIeUkn2yOt8/sfP21tnUefbOd43uvJCtaZ
EvLcNN8+kOM530CPXeiyNnrorwDNNnpgXq3+rPuvYHOPhfw1ccQY8g7/CXxZ
u3DhwuHDh+nH9fX1eXl57DAN9M1jsfkrsdv8Md7ms8I2p5vN6UB738nVD3E1
kDxDPmh8nrQKnT1YRjkXrkBwLpwtno+eW8vm22UN9PiFLnuAVLfRFUfGWa9H
Z7PupmWVSk+SsLnd6BdV/YoKmyfC5o9MPNT3yY/651TwNqeXm5P6Sephn8kc
yScaXqSc0jZNuJAaN54bWueiA9vVrXO+e05eQp73l/Hc0kAfM7+2k+dqodsa
dI+hjf7sVznc9eiKWfdzNals84KSj158u0X9enbDxd27d1dFYuW5XZsfOHCg
qKgo9Q6Cc6Teom+eEJuPjWLze0M2f+CJ6h6czXmV3zemnqn8jseC/yQ/tE62
m1rnUQ5sN7XOucl28upluVVNk+ekpEsb6IpN6CahzxELXb+Nrrh5TXFk3C/3
w+Y+C1/qSTXLz8+/evVqW1vb9u3b165dyz4NNte0+bNx2PyxKYeyIjPtJpvT
C9R4m1ub5g9yd0EKhM71fcwbz/OibDwXPliOEvJ8Qec2ScF8e6h0jFlQy4RO
eG46Js4kdMVWdNlOyaht9Oiz7j83z7r/6RvDg1MqPUnC5o6HFVX9iprmNl/r
qs15mD/ICumE+u5PVJMX5bm4dR565Os//drDobH28F3nmq1zfrhd0j1X85y8
huZVmubb+Qa6QujKNnqjvTb6is5vgbLjPqLOup+FzTdE2SVky+bklyIwr66u
dvIr8Ul06i1s7qzNHxxzkNi8z/gKtc3DF6gZm+ZmmD8WVPldQ0/fPbKa8vye
0dXq1jkdaxfcdZ4tvkGYb52zjef8ZLsuz9UN9GhCF16JHnXQ3dpGj2HWHTb3
XUylft++fYsWLZo3b15JScnly5fZ+7C5WzYfYrR5n4lV3YObzcsfyuk8cCPY
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
s2Y1NzdfvHixtbXVyaXodGBzV5JeNj/oOZuTh7c+kaEjNs1OYN6dgzl5kYoq
G2s3bDmfHtxy/ohoy3mUsXb+0Wtu58ZzOtkeeujqfOIaOL1Sn+fiEXc9oeu0
0RW3W+ZqHBl3+kIsNvdFUYXNPRjYPPk2f2DMaWLz+wOnqc3DA+2Spvndo8Mv
8jG9VU1qc8mWc/VF50Kb8we2x8bzzu65Zb49a0aNQOjWBrqe0ONso7/721hs
7ot6m+aBzRNg8wZ7Ns+T2pyULGpzWse6Di0XNtCDj5eisfZ+2TWysXZ7rXPR
xnMhz8mLFH/xfDvfQOdH3Oec0WzrKISu30Y3HRmnXg7W1NXVTZs2benSpcXF
xfn5+SdPnnR4QToX2NyVwObO2bwhFptnd9qcbTPvYYQ5ed0XqM4cdKSbYss5
dxwc23LeOXck2xYkb53LJtvps1bnse3cPJKZ51ahcyPu4h66etBdvRs9hpvX
fhaLzf1SVGFzDwY2T5DNH9OweY/xgqY5tTnfNGc27zJQsOXcbHNuy3lvq82V
Y+3W1rl6rN1qcwXPFfPtqhF3odCjbUXnz4szt9G5b+qSVww290u9TfPA5sm1
+ScGmxeEnyr7TAruDacXqIVvNg89W94/pppI/K4h5eyRkjXQeZ7LxjL7TakR
jrWrL+odZtkvyYrDaOPG84Bxsp3xXLr93LhBUjHiHkXowvFL+W50RRu9I2TY
nZFkZGSo18ulS5c2b97c0tLS1ta2a9euVatWJXBxxhfY3JXA5kKbr4zJ5lO0
bf5oTg15Euv5RAWzec8J9dZt5rSK0sdCYnPC9s76afneJn8cXPiW81zxlnPx
WLuF55bWeedk+4iiWl2eczvQrT100z50qdDlbfToR8YJb16LIP3Uhdu2KmqH
f4oqbO7BwOYx23yULZtPjWJzVdN8VHis/c6Qzcln3j9G6zg4g82niGwub50/
HGqdd54I5wTPtRroNoUeZxv9nZDNWb3NzMyManO/1Ns0D2yeNJsPJKqd/MnQ
2TW8zQdEbM5foMY2mxObdwnZPFjHxop5rrD5I3GMtQ+3FIfwxvOi2vBke1Gt
deM5e4yU8fxJy3MjP+KuI3QH2ugc0ju4skbClsPZs2c3GUPeMa2dpqam3Nzc
xkZz890jgc1dCWyeWJvP4Gw+tdPmj1hsLmuas5ZNeMv5WG7LOW/zHJHNI8fB
CeeOorbO6WQ7a52PMrbOR8wJ83wkva1SyXO+gW4SuvWkuKhtdAePjFPY3O9F
FTb3YGBzD9rcBPNuo8I8t245ZzbvYbR5+Di48arj4NRj7eSlcyJcPDwXNtAT
IXRZG5283tl3na+3gUCALQe/19s0D2zuis3JIlXbnG42JwwnNu86/DR9nrzf
wvPMQUeI3+Vj7RabRxtrt951bm2dCybb7fJc1EDnR9zFQi+xI3RFG52bw5Qt
B/IYdsQY8g55/8KFC4cPH6afU19fn5eX59mTNGBzVwKbJ9rmA1U2LzfZPLjT
3AJz+mTYdajF5pMjxdNyVHu/yVXE5g9NqYq+5VzZOqeHwglb56pz4UJ1Vd1A
FwrduhVdczd6zEfGnTovnWn3e1GFzT0Y2NyjNudgTl9aW84dsXm0y9Ts8rzz
aLhI2eeFTj7gb1gz8Dya0KNsRddoo7+zr1W2HPxeb9M8mZmZpaWl5DGe/hA2
j8Xm5mt547J5H5PNBwRtTksZz/PO7ef8WCZrnUu2nD9msbnqRCNJ63z0vAbB
ZLuI5+x0OMpznQZ67EKPqY1uWg5Rd0eSUpafn3/16tW2trbt27evXbuWvk9W
UFOT+bZ0dwObuxJaUdmtlLC5KzZ/cGJ4oN3aNCe1lJbT8JbzYeU9NY5qNxwH
p94TZLd1buQ5PReOTbYbeK7RQBcK3boVPYZZd2vVFc66fym3uSzCourBigqb
ezCBQKA0FPYObO45m4+so61zNtZuvuXcchwcPaqd/EbSo9o1tpzzY+0xtM6F
PB+ozfPoQneijb5NbnNZ/FJv0zwZGRlfhkJ/CJsrbL547WVi85nPfe64zR98
soLYvM/kanaBGj0ILmzzYafZ86SA59bWD3u8nBbccv4As7l8y7l4rF3eOmeT
7fTESLPN9XluuaLXsAldKXThVnS7bXTTctB5kty3b9+iRYvmzZtXUlJy+fJl
+mZRUVFlZaWzazPOwOauhPxPiK+osHkibP7QuI+IzQfMqBLavPfk+vtCTXPi
7u7jBE3z+x4PnircafPxwadB2zbn5464By1r63yEXus8+mS7vIEuFDp/WNzQ
/EqdNnr8s+4x2LxDVFQ9WFFhcw+GYGT9+vWs3nakrs2Xeczm9wVO8xeoBW0e
OgiOH2gPwby+K7H5yDo61t5pc8WW89BR7XfLj2q3bjkX2lxxIpwmz0mp7zux
gvwHIf9kNud5zh8QF9x+rhB6YdxCF7XRY7B5h0/qbZoHM+2es3nkIDhSrO4a
Wk5sfvfIavIwKeQ5bZ0Hx9oniB8vSb16gB4HF3rCNG85j3Zau6l1Pkp9KFzc
PGcPitJj4pQnF6nPixO20dXLQZb29vbm5mbHFmFi4pTNyRfb1tam8ybSgZl2
N2w+wGTzSWGb8wPtnTAfE7x7N/jP0Qab9xJdQ6lrc1o8JTbXaJ03WCfbH8v+
9HHLXRgqnoum3E3HuRva6DEdGRd11v3Lc7cUy0ER7xdV2NyDSZ+Zds/ZfLTB
5uxmcwPMRwVh3nVEXVfaOte0+YTwNWqE5wKbax8HJ7jo3H7rnPGcbTy3zrf3
m1ShbqDbErqtQfdtv4nF5h1+qLdpHtg8Pps3RrX5IB2bP2G2ec+Ize8M2Tz4
MCni+d0jTtND4UxbzvnWj+I4ONWJRsamj2Ws3dw6t16pps9z63w7baAzoY8o
qHxiYW0MQo/aRlcvB1/HEZuTAr5u3bo9e/ZEfZPP559/XlBQ4OQX45/A5smz
+XSBzfuGbH7P8HJi8/vHVFttHjxG+PFwIQ3egsH2BCmvOH+Mu0ZN8Y1NnbF2
xYHtisl2YQNdyHNrD912Gz2OWfc/xmpz7wc292Bgcy/YvNvwyEA7a5ozmI+s
u2tEkOfdRgbfzBwSbq9bj4MzHdV+7yjBlvN+No+DizLWHu3Advp6bHqNdbI9
yvZz7RF3LaFLkB6PzRGPBzZPiM2fidvm4802vzdic8bzB8bW3xsIXrIWbv1Y
Thvmbf6Q/Dg41ZZzyVi7unUeI88lQpduQrcKXbIVXdFGVy8HXyd+m587d+6F
F14gyuYZLnyTT0tLy7Jly2BzGtjcFZt35Tabm3aa084O+Se1eeagIz2M16gJ
rzjXt7mNsfbZNbLWuXWyXcZzqdDlSDe10e0hXTbrHqm6sLnC5sePHy8tLV26
dGlZWdmNGzdMP7tr1665kaxevTrxX1AqBDb3gs0zB5dLbT6i7q7hIZ6HWudd
h1f/5LEjXQYJjmrXsbn8ODjxWHv/yGntVpvbap3TjeemyXZ+uN10fnv0BrpD
Qt8Km6doYPNk23yW2eaPcTbvG9osSW1O6tVdQ4I270ZsHqjneX5/hOfE5l2s
Np9suKW394Tg5el9JlapbS7bcq4Yaxe3zuW3/wh4HnW+nRtx1xe6fhtdvRx8
nfht/tZbbx07duzNN9/kGS58k8/GjRsPHz4Mm9PA5sm2+ZSIzQcd4Ucu+aZ5
2OZjwud13G+8Rk1o8/4Wm8uGjvTH2h8TnQhnap2Hz2yPxvMYhC5EunXWXb0h
3Vp+YXOZzVtaWkhVvHTpUnt7+/vvv79u3TrTJ6xcubKiouJGKDg5WTOwuXds
fnfoSVVg8xFmm/NHtWvZXHgcXI4TW871WueyyXYTzzUb6AqhRz/O3Yh02DxV
A5t7weakABKbkzpjsnmXAUfuzDpCz9Yw85zafHTQ5uQJs4fiqPYp3FHt3HFw
whONhnBjmUKbG1vn4QPb6V3nUVvnQp5rNtDNm9AdErp6Ofg6Tu03FzJcZnPC
9k2bNl29ehU2p4HNk2Hz/Og255vm1Ob3MZuPkdt8WqfNw1ec59aoh46GCnsc
dsbaxYfCKXiuJ3QZ0ofmVYo3pMc06w6by2x+6NChNWvW0I/r6upycnJMAJ81
a1Zzc/PFixdbW1ut/zoiDGyefJvfH4fNyU/JbG6+4jyqzePecm6rdS6bbI+Z
57pCV7bRYfNUTUZGxs6dO3FOu/s2H91p8wdNNh/d+Txp3XjeJXTROf2u44MS
mwuPapeeaFRo7vuYLm7gez20dR6869zSOpfx3HTvuQ7P+TPihEKfYBS65lZ0
8jIth1R6ktS3+f79+5sisf46+jZvaGhYunRpS0tLOtucVlTcoeaKzXsYbc5v
NudtTp4PyTMk+eFdQ8I2J8XTtCEoRpvLtpxrjbWbW+eG686j8lxH6JI2uvXm
NdtIj9ThP56FzcU2P3Xq1JIlS+jHJ06cyM7OJkJnP0s+njZtGqmfxcXF+fn5
J0+eTM4X5fcQjPD1tgM2T7zNiZqJzR8YW+2wzU1XnDtkc8WWc32b85Pt5GW2
uZLng5Q8j1PoW38Nm6dmMjMzYXOv2HxqfV92gRpnc1LNzDznNp6bbG440ShU
taJco6Z9HJxwrJ08RhKb22qdC3n+pCbPRSPu9Ji4KEKXIN20HFLpSZIs6sEz
PjP9N7S+Rs85u3v37qpIrDzXt/krr7zy+uuvl5eXHzp0KC8vj3xw69atjjSL
6budsLm7Nuc3m7OB9rtD5ZS80y10lua99CxNq81zwjZ/lLf5tBrrFeeDjTaP
9bR2s81JOTW3zqPyXFPoEqQH5tWaZt3tnhp3EjbfcHH//v2XImEVtb29vaio
6I033jh69Ojy5cunT5/e0ND5FxD5zM2bN7e0tLS1te3atWvVqlUufZU+SyAQ
KCwshM1T0OYjnbS5asu5daw92mS7YOO5Ds91Gug2hQ6bp2ow0+6yzfMlNh8X
rFp3Rmx+N7O5ZbI92PoZGG79mE8bzpFfoxZt16TOlnPViXDaPCdPgzKe2xK6
4JwiDaGrl4Ovo29zp2baN2zY8HwozzzzTE5ODvkgDS/pwEy712zObzYPVtFI
OSU/FNh8sh2bF8Rrc/Iy2Hxeg3DX+UC+da7DcztC19yQrnlDemrbfHDOvqnP
Napf4xad2717N7M5/yucO3fu5ZdfXrNmTVVVVX5+PtG68DcinM/NzW1sNB9V
iliDmfZUtfn9j58mNn9gzGnNK87NNo91y7m6dU7KPm2dCzaeW3jObj/vN6ki
Ks/tCT3yF83bsHmKBjaP0+aFCbZ5sOKNqjfw3Ng6JzbvYrR5b+MV5w8rrzhX
2Vxry3ksY+08z8lfFp2T7bZ4Ho/QS2BzJ21Ofi++4Z7OM+2wuZs2HyuxuXGg
nVRUJ23OH9ahbfPOsfZC1Vg7KaeG+9Ri4rmzSFcf7Q6bE5sLK2pra2ttbS39
uKamZvHixfzPXrhw4fDhw/Tj+vr6vLw8HAenE9g8JW1OqnGPJ6uJze8bVa6+
4lx6jZqezaVj7XKeqzaea/LcOaHD5qka2Nz7Ng8WtFBNo5PtptY5tfl9zOYT
BVecR7W5+Bq1aLecm8bazTbX4Dn5m8K08dy691z4EGiaqNQSugjp6uXg6yTT
5kVFRZWVleyHsDkLbO64zQlUic2JahU2v0tpc/qIGPzhqOAdlF0j91wYbD7V
bPN+k6uIzR+aUmXL5sLj4PS3nJNyKjgUzsjzKEJfaEfo9pFuOtodNpfZvLGx
sbCw8NtvvyUfl5WV7d27l75Pv7FJPJ6fn08qZ1tb2/bt29euXZvUr823gc1h
c4PNRWPtfSdW2T4OTtk6l022C3lOXgTmVOiE6joN9KhCHwKbp3pgc7dsPti+
zYWt87DNH682XXHO25xecf4wu+I8X+8aNcVxcDzP55tPa1e0zk0Ph+zYdjbZ
ruK5soEem9DVy8HXccrmiK3A5gmy+eMSmw/SsHl4s3kgFps/omlz+8fBibec
W8baSTmlh8LJJtu1eJ4spMPmMpuT7NmzZ8GCBUuWLHn11VeJwemb7Bub+/bt
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
7iDP1cshodmwYcMrr7zy2WefvfHGGyUlJfQcGweThjaXJUFFVaeiwubesXk3
zuZ3cTbvwtm8tx9szracR7d54oVuKuzu2jyhRTV+mx8/fry0tJQ8LpaVldGm
SUommfUWNofNdWzed2IVsXnfSVUO21xvy7mt1jnjOb/3XCZ0d22e0Hrb3t5+
+/bt2P7dCxcu0IPQV6xY8eKLL8b8Z3BxGAA295zNJ4Rtfjez+bA68ZbzyDVq
/ONlzDYfFIfNR0W1ua3j4KKdCKc52a5zOpx6OSQ058+fv3btGv34q6++evrp
p0mhI6XAqV8/zW3uVlGFzV2zeUBuc+Mh7cGK6jWbz5baPPYt524g3V2bJ7So
xmlz4sqCgoJLly6RZ873339/3bp1jvypPBK36i1sDpsnzua2jmp/OLvKKZuz
k9utP2Xiubs2T1y9bWtrGz58+E9/+tOon9m7d++/+qu/+ru/+7sf/OAHP/zh
D++9997PP/+c/hT54I477qBI149HhgFgc1/YPNObNje0zu3bXH4cHLF5QHki
nGbrPCrP1cshmSG1aN++faQakCLgyC+Yhjb3QlGFzb1u8+FpbHOZ03UIr0d7
7+w373C6qMZp80OHDhG30o/J42JOTs7Nmzfj/1O5GC/UW9gcNnfL5raPg0tA
69w7+807nKu3x44de+CBB/78z/88qs3b29u///3vl5eXs3eWLl06ZsyYjtCO
m8zMzBha+YmeaNVMVlZWdnY2vXuiAzb3ss2Hs1vOI8fBRa5Rs2Hz6Qm0+fCi
WmJz8mXasnlsp7Xrt87VPDctB9dPFSbPbOz5Lc6koc29UFTJXwekopaWltIf
wubetfnI4KD7nXHbfJDE5tYS6oDNI6V1SMEZ8t+B/DN2mzvy8rbNaZwqqnHa
/NSpU0uWLKEfnzhxglQJuw0dr8UL9TYQCNA96ewd2Nx5m+fA5vFuOY+5da7m
uadsThN/vc3Ly9u2bVtubm5Um1dVVX33u9/lR98XLFhQXFx8/vz5e+6556uv
vorhd0/0RKtm0Df3lM17R2xOSha1+U8GlHeJ2PwuT9v8mrM2V5/Wbqt1ruC5
ejkkNCdPnlTspmlpaYmtsLCQJ6WB0z4T/7flXiMKU8fmXiiq6Jt7zuaWy827
hHYJecTmg/KqyNdC/mnL5jaOg0su1d21eUKLqr7Nd+zYUR5JU1MT/dfb29uL
iooIY48ePbp8+fLp06c3NJj/AvJXvFBv0TeHzf1kczs8F156buK5uzZPaL3V
sfnWrVt//OMfk4r66aef7t+/f9myZYTqJ06cmDJlyg9+8IN7QonzGwWOT7Rq
Bjb3h82HiWw+OrE2H2p6sEy6zdVbzm21zg08f8oTNj9+/Phzzz33m9/85sqV
K+xNUgdINSMFhxSl2C6gYUlDm5viSlGFzT1u88xOm9fd7arNR6SezRe4bPOE
FlVi835P7mN/tcleQ2dJK+q5c+defvll8qxYVVWVn59PtB7zH8aDcaXewuaw
uY7NH86uITbv9WRwX2d/l2xut3U+SH7pORO6uzZPaL3VsXlxcfFf//Vf/9u/
/dtf/MVf/Nmf/Vl2dvZnn30W8++oiIMTrZqBzf1i80zLNWpSm09MEZtH3XJu
q3Uu5Ll6OSQ6zc3NO3funD9//qxZs5566qmFCxfOmDGjpKTkwIEDirtpNAOb
0yS5qMLmXrP5vczmIw027+pnm9s+qj09bN6RyKIap81bW1tra2vpxzU1NYsX
L47nD+PZJLnewuawuc9sbpPnbLjddOk5fbk+0564esvb/OjRoxON+fTTT8n7
ffr0+cUvftER+oZAVlbWsmXL4v6CEj7RqhnY3Ms2/wm1+dA6wXFwKW9zjS3n
dm1u5bl6OSQt5Knv1KlTZ86ccXDKMQ1t7oWiCpt72eb0AjX6iGi1+YOwuf9t
zuJ4UY3T5o2NjYWFhd9++y35uKysLMkTkomIF+otbA6be8fm6mvUYmud8w10
a/fcdZuzOF5veZufO3dukzFnz54l73//+9//wx/+QD/nxIkT3/3udy9duhTn
75voiVbNwOYetHl33uZZ6WtztuVcZfP4eK5eDr5OGtrcC0UVNvewzetg8/Sx
ueOJf6Z9z549CxYsWLJkyauvvkrqUpL//I7HC/UWNofNXba59hXnMbfOB8lP
bveOzR1P1Jn2qqqq//E//gd/20Xfvn1JgY3/t07oRKtmYHNf2LyL6ah2T9qc
PEMSm/ef8in/DBnF5opr1PS2nMfQOn/SqzZvb28/ffr03r1733nnnQ8++OAP
f/hDPBsS09DmHR4oqrC5R23OHhqNNs8cXE6K532PV/vO5vQatRHxXKOW6jZ3
tqLGb3OS27dvX79+PeY/g9fier2FzWFzL9hc5xq1OG3Ohtv5yXZP2dzZehvV
5lu3br3zzjv5dzZt2vS3f/u3Dn7bMxETrZrBHWp+tTm74tymzfsn2OaPKm1u
44pzfZvHwXPTcnD3SfIXoRw/fvyPf/xjRUXF7t27X3nllZh/tfS0OYtbRRV3
qHnd5sPENu9hsflDsLnPbe5sRXXE5qkat+ot7lCDzb1j8wRtOVdMtnvK5s7W
2zQP+uZetHmo3HWL2PxOzuZ36dm8d6w2H+wxm4+YfYb81yP/dNzmT3rP5iUl
JaZvM5LKxk/s2Eqa29ytoG/uKZsHLzf3rM2LYfPExtmKCpt7MOibw+ZesHlC
j4NTTLZ7yubO1lvvhHwJx48f/+1vf9vS0kLfScJ/ZNjcNzYfJrU52zLZw2rz
0GRmX/ds3slzuc3jPao9VWz+2muvvf322ydOnDh37typU6c+/PBD8k7Mvxps
7oWKCpt70OZ3hk7w6Dqijrypb3PyOEds3nPsJ87afOjsGvK1ZOVUmG0+L4rN
hxScIf8pyD9d9zgv08+9ZHNnKypsro4r9RY2h83TyuamyXZP2dzZeuudbNiw
YdeuXfv27Xv66afpWXPPP/98on9T2NzTNu8fsfnQuGxOShaxOfldfGdznaPa
Y9tyTl/q5ZD8fPHFF7t373799dffeecd8oAXz7ccYXMvVFTY3Fs2H26x+aDy
LgOO3Bfwsc0DCUO3PskDkVvXPWXzDkcrKmyujiv1FjaHzRNuc0evUYv5qHZT
69yDNu9wtN56JytWrKAf1NTUPPvss1euXIHN087mk1Q25644Tw+b6x3VHk/r
XL0cfB3Y3AsVFTb3iM27RWzeRWbzccHi6ZbNH1PafLSXbC4kOR2wJ6+KLxsU
y8HXgc3VcaXewuawuS9tHvdYuzdtnpJZt27d7t276TgQKW6krM2bNy/Rvyls
7prNZ2nbfIhHbT4SNncu7e3tn4oS8y8Im3uhosLmnrD5aKPNh8DmzsCc/hnY
iwj9w0+uKZZDMuN4RYXN1XGl3sLmsLljNhfxPBE2j7N17k2bO15vvZNbt259
9tlndXV19IdXr17dsmVLon9T2NyjNh+TeJvn+8PmOke1xzzWrl4OSc577703
a9asffv2/ZZLzL8abO6Figqbe9Pm5J+klnbztM0lx8Fx3WrK4eTYXNErJx+Q
H5KX1/abO1tRYXN1XKm3sDlsnp42p8fBecfmHU7XW3ezcuXK+cYsXry4tLS0
vLw8OX+AzMxM8tuRx3j6Q9jcczZ/LGzzLszm5JGSXXHuI5svSLDNY+K5aTm4
PoG5Y8cOUtkc+aXS1ubuFlVaUdmtlLA5bO6wzee7YHNZu5yq3LNnwXU4WlFh
c2HcrbeBQKA0FPYObA6bp7bN+ePgPGXzDkfrrbvZu3fvs88+e+jQoa+//vqT
Tz4hFWbLli2///3vFyxYUF1dnYQ/QEZGxpeh0B/C5h6x+X2weVranKStrc2R
Xydtbe5uUSX/E+IrKmzuIZuPCJbQKDafBJtHsTmDOR2nN728ZvMO5yoqbC6M
u/WWYGT9+vWs3nbA5rB5qtt8EHfRudds3uFcvXU3xcXFNTU17Id1dXVz587t
CJW7jz76KAl/AMy0e83mPUU2vxM2TxubO5W0tbm7RRUz7R60+d2weVJg7k2b
OxXYXBh36y1m2mHzNLQ5m2x/YeN59XJIjXwpSeJ+x5KSkuPHj7Mfnjx5cv78
+eSDXbt2HTlyJHG/Lwts7lmb3zX0NLH5HQNPGWw+PO1sPmL2GfIfkPwzJW2e
uIFAp2ze3t5u/Uao8E2PxN2iCpt73eZDU9DmieO5LZh7xOYJKqqwuTDu1lvY
HDZPT5vTyfb8Zb+vudSkWA5JSKJ3tWx66+APu//6R72Pml6PjP0tqcmO/BbW
kJo2e/bsVatWvffeey+99FJ+fv7hw4dJcZs7d25DgxkOiQhs7n2b38FsPixs
866wuUPHwamXQxKSuIFAR2xODL5u3bo9e/ZEfZPm6NGjy5cvX7JkyYYNG779
9tt4/vwxx92iCpt73+Z3wOYx2TwqzD1i8wQV1fhtTkoT+cMsXbq0rKzsxo0b
Mf9JPBV36y1sDps/lJY2p5PtZdsvqpdDEpLoXS3E5v/6SNV/DKwzvRJqc5I/
/elPH3300bZt28hjbXNzM3nnypUrSavbsLl3bN7XZPMh/rP5API1Tvl0RFGt
Oza3z3P1ckhCEjcQGL/Nz50798ILLxQUFPAMF75JQwpXUVFRY2Mj+Xjz5s2k
psXz548nLhZV2NwfNh8Km8fYNFfL1As2T1BRjdPmLS0tpGxeunSpvb39/fff
X7duXcx/Eq/FxXoLm8PmaWvzQd44pz3Ru1rcsjkJeZq9cOGCK20m2NxzNh9v
sPlPmM2HpqnNA/NqyX9A8ndKSto8cQOB8dv8rbfeOnbs2JtvvskzXPgmDXnm
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
UWFzj9u8C2zuAZtbiyqrqB2eKaqweXJiq97C5rA5bK5YDsL4ot6mT9rb263H
2sPmsDlsLlsODi605Ac2T3R0Kips7qLN7w/Z/J6QzekTY5eQzX8Cm2vb3NYh
7THbPLa1luTA5u5G+L8B2Bw2h80Vy8HBtYYkM7C5R23+OGzuV5t7JLC5K4HN
vWvz4ZzNh8DmfrK5FwKbezCwOWwOmyuWA+LT0Bt/2A9hc9gcNk+NwOauhN2h
Rn8Im8PmybG5gzxnvyC9QA02p4HNPRh2hxp7BzaHzWFzxO+hd6jRuyc6YHPY
HDZPlcDmroTeocYqKmwOm/vd5vqXm8PmqKhJDrtDjb0Dm8PmsDni92CmHTYX
27wQNvd3YHNXgpl22Bw2ly0HXwc292Aw0w6bw+aK5YD4NLC5D2w+CDaHzW0H
NnclsLnvbH4nbC6xud3LzWFzVNQkBzaHzWFzxXJAfBrY3B82Dz1MwuawuX5g
c1cCm8PmsLlsOfg6sLkHA5vD5rC5YjkgPg1s7iebD4XNYXPdwOauBDb3gc0H
weawue3Eb/PKysqVK1c+/fTTmzZtamxsNP3s8ePHS0tLly5dWlZWduPGjcR/
QakQ2Bw2h80VywHxaWBzb9r8XtgcNo8vsLkrgc29aPNRIpsPg81hcxuJ0+Y3
b94sLi6ura0lH7/33nvbtm3jf7alpaWgoODSpUvt7e3vv//+unXrkvRV+Tyw
OWwOmyuWA+LTwOY+s/mw4BMmbA6bRw1s7kpgc9jc1zYPwOaSxGnz69ev5+bm
kl+EfLx79+4NGzbwP3vo0KE1a9bQj+vq6nJycojlk/BF+T2wOWwOmyuWA+LT
ZGVlZWdn4w41n9l8BGwOm0cJbO5KMjMzSUVld/rA5v6w+WjYHDaPkvhn2j/+
+OP58+e/8sorTz31FG2gs5w6dWrJkiX04xMnTpAaQoSe6K8oBRIIBLJDYe/A
5rA5bI74Peibw+awuWw5+DqwuStB39zjNr8DNte2+cDpwf/aI8iTPGxux+a7
d++uiqSpqYn+6zdv3ly3bl1paemOHTsWLlx49OhR/hdvb28vKip64403yPvL
ly+fPn16Q4P5ryfEGvTNYXPYXLEcEJ8GNve0zR+FzWHzGAObuxLY3NM2Hwqb
w+Yxhtj8nmG/YU/7slefSV/t37+/KRL2r1dUVCxatIh+fOrUqcLCQuJx/tc/
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
LlsOCMKHL6qaFRU2h81hcwSJITr1FjaHzWFzxXJAPBVSu5YtW8bKWlNT05w5
cy5evHj79u1t27aVlZWxz4TNYXPYXLYcEISFL6r6FRU2h81hcwSxG816C5vD
5rC5YjkgnsrGjRsPHz7MbH7ixImVK1fSj69cuTJz5kz2mbA5bA6by5YDgrDw
RVW/osLmsDlsjiB2o1lvYXPYHDZXLAfEOzl27NimTZuuXr3KbP7xxx+TQkc/
vnHjRnZ29q1b4b9AYXPYHDZnwZMkIoypqOpXVNgcNofNEcRW9OstbA6bw+Ys
sLln09DQsHTp0paWFt7mH3zwwZYtW+jH7e3tpLKxDTuZmZmlkXz55ZfpYPNt
+66u3/rH2Gxe8NPPi0rP6tt8eEHlsJmVpB6SR8ohM89kTasQ2pxUv17jT5ts
ftfw6p9klf/44d//44MH1DbPHFx+19Bytc17PlFBfpdE23zwzDOE547bfMTs
M+S/IWyOuBJrUdWvqMTmVU+OPzN5wle5E87OnHh2zsRzCyedXzb5wnOTL5RO
ufjz7OpXp9ZumnZpa+6VX874Zm9e3f6Z9UcKGv4wu+mLwuaquS1nF7defLq1
dvn1K6tu1q292fCft1s2t914u61te1vb7ra2fW1tB9rajrS1fdbWVtnW9mVb
29nbbTW32765dfvqzVv1N242XL/Z1Hqj+dvrrS3k/7TebP62rbGl7VpzGxH6
1QaC9LbLdW2XrrbVXGmr/lPQ6ecv3T5bc/tMiOrB6nr+1hdnb5346lZl1c3y
0zdpgf39F8EHziOVpMYGzb7vSP22D0798sOvSZndF2L7B7+7vvtQ686Drb88
0Lpjf+u7H7Vu+23r1mCxbX19b+uWD1rL3v/2tZ3fbvzVtz/bePKF/zz5yrst
a99tWb2t5eWtLS+93fLim8TyLSteb/7ZluafbW5eXtb8fFlzyfo/LVj5xeKf
n5tb+sWc5eXFL3wxb+W5xWubF65unv/z5jmlf8or+WLms2cLf9aU9+zlqYs+
z1lydsazTdOfbsotacpZ1jR1aWP2U42TFzdOmHdpbMGJcXO++v/buxenqK48
D+Dzb+TvmH9g/oD5B9zaqpnMZvAVVALBAOIDMEIEjTEJJqzOWLrJJhu1EsvR
ZFwTE0wyJFrj+GB1gvjCaPDFQ0Fa6D30Hbs6PFqi3NstfD51KnW5t/v8+t6c
8+VcbJo/1vaHnX+s6X6h6sySdTdKXx1Y0ThQ9tpAefN4q2gZqNg08PKmgcrN
g5WvD67cMvjKlsHlDaHE2aqtg6FVvzneajJt1VuZ9vZ4q41a63hb/aitybZt
g2tz2zuDtW/+FM6lavPFde8OZltd/tb2r1azZfxqrHn7p+jL+tlodTktdB5a
3c935m/uzXlKvyhvFyxYkM3b6G8B//Bvv/vh338XUveH3/2+6/nfd/1HJn5L
nr+w8PkLi5/vfukPl6pfuFz/x6vNC3veWvjjjsXX31/Suy+TvUdX3Pnmlb7j
awdONw6e33z/Uuvw9R0jt99LDe4dS4WwPfzwYXsq1TGSOjky8n/DI91DD3qG
hm/dGxoMudo3OHK7f3yZev32SE9v6kpmjdrVMx6hnSE/u0ZOZu7Tv3/0o86w
NP3ixIP//X443K1/+u340nT8R53tQx9nAnPPkaGwOg2B+f5nQ+8dGtp9MJOZ
B+7/af/4Lfx/ZmNzz72QnG/9z7+S843/vrfl/XubQ3j+13h4Nu8az8/XHuXn
hj8NvrpjsHbrxaqWs2tDYmRyJuRPSKE1mbAK2VW24ezyhpMr1p8tb7oY4q4i
E6orNlwMMRjycDwYNw6UbRxYWte9qPbMiw03lm0YCLEZYjZE6AuvnAlJuziT
tFHYhoB9YdWjvK24ELbDnpI1/SWrrv9h5ZkQvEvqx59bun68k9BCb8saB5Y3
jufweGsaL7R49Zllr954aeNAaOVRy+RzeUsmojMpHQV1pg1WhrY5p73+r1ax
8adl9WfLGi+GJI/CfEKritob07St07bqR98LwnULLdp+bKuZpebevNh0d3fv
/LmwJ+xvbW3dvXv3yZMn29vbS0tLw0Yqlfryyy/b2tqiJw4NDS1dujTbz3PP
PXfukYKcyNNI/jUX5Co5zcQqWknOZzMP1S+++GK6RA1D6FyOJ34x83YOKvrs
VpxcVKIynVnJ23Az8s4778zKInZ+ztA5WbEgRYvhNN2bF9zNmze/+bmwJ+wP
CdaY0dDQsGjRorAxODh46tSpsBE98cqVK6tWrcr2M1vfOktKSmaln5kLY7K5
uTnhotG/hSVcNPlr+0lGwkWL4TStJOezmYfqd999F3eizts5mIDkY3yefLea
fJoSlenMSt7O1s3IvJ2hCbBsjs+E03RvXvxy39OeSqXKy8s7OzvDxo4dO/bu
3Zt92C/61plntOefCHnSIAzmPNM2z9H8IZO/2zxPDM/KM7/yh8wTd5v/1ea5
tk9z9fK/nvwXYbpDMZ3m03Sbf5C4N2fmsqE680SNaQ4+TbdFPgdn2O1Tvp6Y
up3uUEzfrQpymr/om7JE5YnNJG8n3IwU2wyNaT1p2Zy2bM5wb/7Myb03T2c+
W6O0tLSysrKlpWV4eDi7f8K3zvy32E98b55/mjzZpH5syOTpNv8SNE+3+UMm
+W5dvafp1r05v0huqM4wUWOag3NmahfkNF29xK6eROWJzSRvJ9+bF9UMnUsT
39UryNVzbz7njY6OZj9AI+tXPxf+R/9qenmO5n/ib3/72+kOPffcc7/+9a+n
OxoOhQc8wRPzH43j9Txb3bp603VbkLnJs2i6RP1NjjDAFixY8JuphP3h6JSH
Hns0pm7DZJn11xNTt67e03Sb5NUryNxk7pkyb9euXTvzofsMzdCYup0n+RZT
twW5egsyZthtWH64NweACT4HHin0dGSOK/QAhyJS6OkIAAAAAAAAAAAAAAAw
942NjY2Ojs75ovPkNAtVFMiSb3OmYqGKAjMkiOZMxUIV5dly4cKF9evXr1mz
ZuvWrdeuXUum6KlTpzZt2lRfX79z587+/v5Ya4VZsG3btoMHD2b3nDt3rqmp
qaqq6u233578waExFe3o6Ghpaamrq9u+fXsc13lyxciZM2dy/xhf3EUTGE4T
iiY5luCx5nyipifNwTmZqFMWTUtUKDLJR668TaZoJL7ILYa8TYtcJkmlUtXV
1V1dXenM1AsDJoGiIyMjlZWVP/74Y9jes2fPhx9+GF+tixcvvvbaa2FeZyfC
wMDAyy+/fOXKlYcPH4bSf/7znxMo2tfXV1FREf4bto8dO/b666/HXTEScnvd
unUxxdrkogkMpwlFkxxL8FhzPlHTk+bgnEzUKYumJSoUmeQjV94mlrfpOCO3
GPI2LXKZyokTJ6JZdv/+/cSKDg8PL1my5ObNm2H7wIEDbW1t8dV6//33v//+
+/feey87EU6fPr1p06Zou7e3d/ny5QkUvXPnzvnz56PtS5culZaWxl0xsn37
9hCkMa0kJxdNYDhNKJrkWILHmvOJmp40B+dkok5ZNC1RocgkH7nyNrG8TccZ
ucWQt2mRy1QOHz4cRsLGjRsXL15cXV3d09OTTN0vv/yyqqqqtbV19erV0c+L
YpU7EULpMNmj7QcPHpSUlKRSqbiL5tq9e/e7776bQMWQADt37rx161Z878Cc
UDSx4TThf2iSYwnymCeJms6Zg3M4UScUlahQbAoSufI2joqTiyYQuQXP27TI
ZZJ9+/YtXLjwb3/729DQUBgtO3bsSKDoyMjItm3bmpubQ/WampqOjo64K+ZO
hL/85S+7du2KtsfGxkKyxfQLO1Mm21dffVVZWXn79u24K/b19a1duzacWpIr
ycSGU7Zo8mMJ8pgniZrOmYNzOFFzi0pUKELJR668TSBv00lFbmHzNi1ymcqn
n366bt26aDuM/+XLl8f0I7hc//jHP1atWhVtnz9/vry8PCRMrBUn/KNA9k0j
YQIuXbo0gaKRo0ePVlRUxPdZJbkVW1tbd+/effLkyfb29tLS0rCRwA9XExtO
2aLJjyXIY54kavrn/44zVxM1t6hEhSKUfOTK25gqpguxiC1s3qZFLlPp6Oho
amqKtu/evbtkyZKRkZG4i4YJnn1PTvSrFnH/olDuRDh16lRjY2O0feXKleyk
iLVo8PXXX4dYi/UNV7kVQ3o3ZjQ0NCxatChsDA4Oxl00seGULZr8WII85kmi
pnPm4BxO1NyiEhWKUPKRK2/jk/witrB5mxa5TGVoaKisrKy7uzud+RSCjRs3
JlC0v79/5cqVYeSH7SNHjrz55ptxV8ydCKlUqry8vLOzM2zs2LFj7969CRTt
7e0tLS09d+7c4CNxV8xK8h2YiQ2nbNHkxxLkMU8SNZ0zB+dwoqanClWJCsUj
+ciVt0nmbTrmyC1s3qZFLtP4+9//XlFRUVNTU1tbGyZgMkWPHj26fv361atX
b9269fLly3GXm/z5EiFnKisrW1pahoeHEyj60UcflfzcgwcPYq2YleRKMp3U
cJrwU8ckxxLkNx8SNT3pQ9LmZKKmC31vnpao8DjJR668TSxv0wnem6cLkbdp
kcs0xsbGCvL37oeGhpIvGhkdHY3pAzQoyHAq4FiCCSQqs0iiQn7zbY7I2/jM
w2/fAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFNwP
P/ywbt26p+/nxIkTnZ2d0x09e/ZseMDTVwEoZhIVIBnyFph7ZiXZBgcHX331
1YcPH073gFQqVV9fHx72lIUAiplEBUiGvAXmnmyynTt3rrW1dcWKFW+99VZf
X1909MSJE3V1dZWVlYcOHdq0adN0nXzyySefffZZ7p7bt293dHT89a9/3bdv
X+j2+PHjBw4c+Pjjj2M9F4DCyl0rTg5ViQowW/LnbXpmkStvgaISJVtvb++y
ZcuOHTsWEqmtrW3z5s3h0E8//fTSSy+FZLt27dr69eurqqqm6yQcCj1kv9y7
d29DQ0OIu5BsJSUlV69eDTtDJ3l6AJgDsmvFyaEqUQFmUZ68Tc94EStvgaIS
JVuIoKampmjPjRs3Qhz19/cfOXIkyregvb19uly6efNmWVlZ9suQjaGr6N1B
Y2NjCxcuzL4RKCRneHCMJwNQUNm14uRQPXjwoEQFmC158naGi1h5CxSbKNk+
+OCDDz/8MLszJNXly5fDnj179kR7rl69GsVaKpXatm1bS0tLW1vbyMhI2HP+
/PnVq1dnn1tfX3/69Olo+86dO0uXLg35Fn1ZW1v7z3/+M5nzAkhedq04OVS3
b98uUQFmS568nXIRK2+B4hcl24EDB7Zs2RLtuXv37sKFC+/fv9/R0ZHd+e23
30Yryej3bsLG/v37ow+u7OrqqqmpiR4W/ZgxBFr0ZXt7+xtvvJGtFR7W3d2d
0IkBJC67VpwcqiEPJSrAbMmTt1MuYuUtUPyiZAuBU1pa2tPTE6IpRNbatWvT
mc+uXLZsWWdn5+3bt5ubm6OVZNi+d+9eOvMOosOHD4eNvr6+F198cXR0NOqw
rKzs5MmT0SOrq6tD/9H+0HMo0d/fX5DTBEhAdq04OVQlKsAsypO36akWsfIW
KH7ZZDt06FAIqJUrV4ZMu3HjRnT02LFjIc3Czl27dtXW1mafde3atfr6+iji
grq6ugsXLkTbX3/9dQi3xsbG8Pjjx49nn3Lp0qWGhoaEzgqgEHI/N3hyqEpU
gNmSP2/T00SuvAWeFaOjo7l/wLG3t7ezszPa/u6775qbm6Pt6BMvr1+/nn3k
0aNHP/jgg+yXIyMjd+/endD5Rx999NVXX8X10gGKT26oSlSA+MxkEStvgWfX
gwcPVq5cuX///kOHDlVXV0fv87l161ZjY2Pu35tIZz7OaMOGDdkfQk4WDjU1
NYWHxf6iAYqSRAVIzOTIlbfAs66vr++bb745cuRIT09PtGfXrl2vvPJKY8bn
n3+efeTly5ezbwqarKurKzwg7lcLUMwkKkBiJkSuvAUAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgKL1
/yfBazo=
    "], {{0, 456}, {1332, 0}}, {0, 255},
    ColorFunction->RGBColor],
   BoxForm`ImageTag["Byte", ColorSpace -> "RGB", Interleaving -> True],
   Selectable->False],
  BaseStyle->"ImageGraphics",
  ImageSize->Automatic,
  ImageSizeRaw->{1332, 456},
  PlotRange->{{0, 1332}, {0, 456}}]], "Output",
 CellChangeTimes->{3.631552550780752*^9},
 ImageSize->{1336, 456},
 ImageMargins->{{0, 0}, {0, 0}},
 ImageRegion->{{0, 1}, {0, 1}}]
}, Open  ]],

Cell["Optimal hyperparameters for each statistic:", "Text",
 CellChangeTimes->{{3.630818796522992*^9, 3.630818821244989*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"t", "=", 
      RowBox[{"Position", "[", 
       RowBox[{
        RowBox[{"stat", "/.", "perfL"}], ",", 
        RowBox[{"Min", "[", 
         RowBox[{"stat", "/.", "perfL"}], "]"}], ",", 
        RowBox[{"{", "2", "}"}], ",", 
        RowBox[{"Heads", "\[Rule]", "False"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"Join", "[", 
      RowBox[{
       RowBox[{"Log", "[", 
        RowBox[{"2", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"rsgrid", "\[LeftDoubleBracket]", 
            RowBox[{"t", "\[LeftDoubleBracket]", 
             RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"lsgrid", "\[LeftDoubleBracket]", 
            RowBox[{"t", "\[LeftDoubleBracket]", 
             RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], 
            "\[RightDoubleBracket]"}]}], "}"}]}], "]"}], ",", 
       RowBox[{"Log", "[", 
        RowBox[{"10", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"rsgrid", "\[LeftDoubleBracket]", 
            RowBox[{"t", "\[LeftDoubleBracket]", 
             RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"lsgrid", "\[LeftDoubleBracket]", 
            RowBox[{"t", "\[LeftDoubleBracket]", 
             RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], 
            "\[RightDoubleBracket]"}]}], "}"}]}], "]"}], ",", 
       RowBox[{"Extract", "[", 
        RowBox[{
         RowBox[{"stat", "/.", "perfL"}], ",", "t"}], "]"}]}], "]"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"stat", ",", 
      RowBox[{"{", 
       RowBox[{
       "\"\<RootMeanSquareError\>\"", ",", "\"\<MeanAbsoluteError\>\"", ",", 
        "\"\<OneMinusCorrelationSquared\>\""}], "}"}]}], "}"}]}], "]"}], "//",
   "TraditionalForm"}]], "Input",
 CellChangeTimes->{{3.630763682968245*^9, 3.630763818231238*^9}, {
  3.630816490377605*^9, 3.630816645184347*^9}, {3.6308191097440767`*^9, 
  3.630819132136757*^9}, {3.6308204224385853`*^9, 3.63082042993414*^9}, {
  3.631552592370583*^9, 3.63155260338206*^9}}],

Cell[BoxData[
 FormBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"-", "40.`"}], "12.`", 
      RowBox[{"-", "12.041199826559247`"}], "3.6123599479677737`", 
      "11.070932259705158`"},
     {
      RowBox[{"-", "40.`"}], "12.`", 
      RowBox[{"-", "12.041199826559247`"}], "3.6123599479677737`", 
      "8.811356556428452`"},
     {
      RowBox[{"-", "40.`"}], "12.`", 
      RowBox[{"-", "12.041199826559247`"}], "3.6123599479677737`", 
      "0.0023508807899758066`"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
  TraditionalForm]], "Output",
 CellChangeTimes->{3.631552604702499*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"estperf", "[", 
  RowBox[{
   RowBox[{"2.", "^", 
    RowBox[{"-", "40"}]}], ",", 
   RowBox[{"2.", "^", "12"}], ",", "KernelLaplacian"}], "]"}]], "Input",
 CellChangeTimes->{{3.630819267956245*^9, 3.630819281071238*^9}, {
  3.630820449249021*^9, 3.6308204494196663`*^9}, {3.630828579758449*^9, 
  3.630828586974497*^9}, {3.63155277205579*^9, 3.63155277241676*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"\<\"NumberOfSamples\"\>", "\[Rule]", "100"}], ",", 
   RowBox[{"\<\"RootMeanSquareError\"\>", "\[Rule]", "11.070932259705158`"}], 
   ",", 
   RowBox[{"\<\"MeanAbsoluteError\"\>", "\[Rule]", "8.811356556428452`"}], 
   ",", 
   RowBox[{"\<\"StandardDeviation\"\>", "\[Rule]", "11.000168175656407`"}], 
   ",", 
   RowBox[{"\<\"MedianAbsoluteError\"\>", "\[Rule]", "6.989257262451474`"}], 
   ",", 
   RowBox[{"\<\"MaximumAbsoluteError\"\>", "\[Rule]", "32.920604943253466`"}],
    ",", 
   RowBox[{"\<\"Correlation\"\>", "\[Rule]", "0.9988238679617264`"}], ",", 
   RowBox[{"\<\"CorrelationSquared\"\>", "\[Rule]", "0.9976491192100242`"}], 
   ",", 
   RowBox[{"\<\"OneMinusCorrelationSquared\"\>", "\[Rule]", 
    "0.0023508807899758066`"}]}], "}"}]], "Output",
 CellChangeTimes->{3.6315527774038363`*^9}]
}, Open  ]],

Cell["Performance on prediction set", "Text",
 CellChangeTimes->{{3.630818950042426*^9, 3.630818950986649*^9}, {
  3.630818988223613*^9, 3.6308189952206*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{"\[Lambda]", ",", "\[Sigma]"}], "}"}], "=", 
   RowBox[{"Power", "[", 
    RowBox[{"2.", ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "40"}], ",", "12"}], "}"}]}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.630816755304348*^9, 3.6308167752946577`*^9}, {
  3.6308168147542677`*^9, 3.630816817803626*^9}, {3.630828669557619*^9, 
  3.630828674070654*^9}, {3.631552817126635*^9, 3.631552817495411*^9}}],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"kk", "=", 
   RowBox[{"KernelLaplacian", "[", 
    RowBox[{
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indtrain", "\[RightDoubleBracket]"}], ",", 
     RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ll", "=", 
   RowBox[{"KernelLaplacian", "[", 
    RowBox[{
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indtrain", "\[RightDoubleBracket]"}], ",", 
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indpredict", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"krr", "=", 
   RowBox[{"KernelRidgeRegression", "[", 
    RowBox[{"kk", ",", 
     RowBox[{
     "ae", "\[LeftDoubleBracket]", "indtrain", "\[RightDoubleBracket]"}], ",", 
     RowBox[{"RegularizationStrength", "\[Rule]", "\[Lambda]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Loss", "[", 
  RowBox[{
   RowBox[{
   "ae", "\[LeftDoubleBracket]", "indpredict", "\[RightDoubleBracket]"}], ",", 
   RowBox[{"krr", "[", "ll", "]"}]}], "]"}]}], "Input",
 CellChangeTimes->{{3.630816681873713*^9, 3.630816748348625*^9}, {
  3.6308286829827633`*^9, 3.6308286879907227`*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"\<\"NumberOfSamples\"\>", "\[Rule]", "6102"}], ",", 
   RowBox[{"\<\"RootMeanSquareError\"\>", "\[Rule]", "9.495952397890166`"}], 
   ",", 
   RowBox[{"\<\"MeanAbsoluteError\"\>", "\[Rule]", "7.081722847526523`"}], 
   ",", 
   RowBox[{"\<\"StandardDeviation\"\>", "\[Rule]", "9.496536855432739`"}], 
   ",", 
   RowBox[{"\<\"MedianAbsoluteError\"\>", "\[Rule]", "5.603447886515482`"}], 
   ",", 
   RowBox[{"\<\"MaximumAbsoluteError\"\>", "\[Rule]", "80.97099950083339`"}], 
   ",", 
   RowBox[{"\<\"Correlation\"\>", "\[Rule]", "0.9990322881703484`"}], ",", 
   RowBox[{"\<\"CorrelationSquared\"\>", "\[Rule]", "0.998065512806882`"}], 
   ",", 
   RowBox[{"\<\"OneMinusCorrelationSquared\"\>", "\[Rule]", 
    "0.0019344871931179508`"}]}], "}"}]], "Output",
 CellChangeTimes->{3.6315528573347883`*^9}]
}, Open  ]],

Cell["Scatter plot", "Text",
 CellChangeTimes->{{3.630829157514904*^9, 3.630829158858457*^9}}],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"kk", "=", 
   RowBox[{"KernelLaplacian", "[", 
    RowBox[{
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ll", "=", 
   RowBox[{"KernelLaplacian", "[", 
    RowBox[{
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{
     "cm", "\[LeftDoubleBracket]", "indholdout", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{"{", "\[Sigma]", "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"krr", "=", 
   RowBox[{"KernelRidgeRegression", "[", 
    RowBox[{"kk", ",", 
     RowBox[{
     "ae", "\[LeftDoubleBracket]", "indproper", "\[RightDoubleBracket]"}], 
     ",", 
     RowBox[{"RegularizationStrength", "\[Rule]", "\[Lambda]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"ScatterPlot", "[", 
  RowBox[{
   RowBox[{
   "ae", "\[LeftDoubleBracket]", "indholdout", "\[RightDoubleBracket]"}], ",", 
   RowBox[{"krr", "[", "ll", "]"}]}], "]"}]}], "Input",
 CellChangeTimes->{{3.630829173185225*^9, 3.63082919771176*^9}, {
   3.631552887736743*^9, 3.631552897273694*^9}, 3.631552941912085*^9}],

Cell[BoxData[
 GraphicsBox[
  TagBox[RasterBox[CompressedData["
1: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

    "], {{0, 223}, {360, 0}}, {0, 255},
    ColorFunction->RGBColor],
   BoxForm`ImageTag["Byte", ColorSpace -> "RGB", Interleaving -> True],
   Selectable->False],
  BaseStyle->"ImageGraphics",
  ImageSize->Automatic,
  ImageSizeRaw->{360, 223},
  PlotRange->{{0, 360}, {0, 223}}]], "Output",
 CellChangeTimes->{3.6315529463448687`*^9},
 ImageSize->{364, 223},
 ImageMargins->{{0, 0}, {0, 0}},
 ImageRegion->{{0, 1}, {0, 1}}]
}, Open  ]]
}, Open  ]]
}, Closed]]
}, Closed]]
}, Open  ]]
},
WindowSize->{1659, 1300},
WindowMargins->{{0, Automatic}, {Automatic, -22}},
FrontEndVersion->"10.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (September 9, \
2014)",
StyleDefinitions->Notebook[{
   Cell[
    StyleData[StyleDefinitions -> "Default.nb"]], 
   Cell[
    StyleData["Section"], MenuCommandKey -> "1", FontFamily -> "Helvetica", 
    FontSize -> 24, FontWeight -> "Plain", FontSlant -> "Plain"], 
   Cell[
    StyleData["Subsection"], MenuSortingValue -> 10000, MenuCommandKey -> "2",
     FontFamily -> "Helvetica", FontSize -> 16, FontWeight -> "Bold", 
    FontSlant -> "Plain"], 
   Cell[
    StyleData["Subsubsection"], MenuSortingValue -> 10000, MenuCommandKey -> 
    "3", FontFamily -> "Helvetica", FontSize -> 15, FontWeight -> "Plain", 
    FontSlant -> "Plain"], 
   Cell[
    StyleData["Subsubsubsection"], MenuSortingValue -> 10000, MenuCommandKey -> 
    "4", FontFamily -> "Helvetica", FontSize -> 14, FontWeight -> "Plain", 
    FontSlant -> "Italic"], 
   Cell[
    StyleData["Subsubsubsubsection"], MenuSortingValue -> 10000, 
    MenuCommandKey -> "5", FontFamily -> "Helvetica Light Oblique", FontSize -> 
    12, FontWeight -> "Plain", FontSlant -> "Plain"], 
   Cell[
    StyleData["Text"], MenuSortingValue -> 10000], 
   Cell[
    StyleData["Title"], MenuCommandKey -> None], 
   Cell[
    StyleData["Chapter"], MenuCommandKey -> None], 
   Cell[
    StyleData["Subchapter"], MenuCommandKey -> None]}, 
  WindowSize -> {808, 668}, 
  WindowMargins -> {{236, Automatic}, {Automatic, 0}}, Visible -> False, 
  FrontEndVersion -> 
  "10.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (September 9, 2014)", 
  StyleDefinitions -> "PrivateStylesheetFormatting.nb"]
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[579, 22, 282, 3, 92, "Title"],
Cell[864, 27, 230, 6, 81, "Subtitle"],
Cell[1097, 35, 263, 5, 30, "Text"],
Cell[1363, 42, 584, 15, 28, "Input"],
Cell[CellGroupData[{
Cell[1972, 61, 140, 2, 28, "Input"],
Cell[2115, 65, 316, 4, 38, "Print"]
}, Open  ]],
Cell[2446, 72, 217, 4, 30, "Text"],
Cell[CellGroupData[{
Cell[2688, 80, 362, 5, 56, "Section"],
Cell[3053, 87, 148, 3, 28, "Input"],
Cell[CellGroupData[{
Cell[3226, 94, 108, 1, 37, "Subsection"],
Cell[3337, 97, 126, 1, 30, "Text"],
Cell[3466, 100, 2775, 75, 199, "Input"],
Cell[6244, 177, 173, 4, 30, "Text"],
Cell[6420, 183, 19942, 437, 830, "Input"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[26411, 626, 339, 4, 42, "Section"],
Cell[CellGroupData[{
Cell[26775, 634, 99, 1, 37, "Subsection"],
Cell[CellGroupData[{
Cell[26899, 639, 109, 1, 28, "Subsubsection"],
Cell[27011, 642, 224, 4, 30, "Text"],
Cell[27238, 648, 318, 8, 28, "Input"],
Cell[27559, 658, 98, 1, 30, "Text"],
Cell[27660, 661, 1387, 36, 97, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29084, 702, 113, 1, 28, "Subsubsection"],
Cell[29200, 705, 139, 1, 30, "Text"],
Cell[CellGroupData[{
Cell[29364, 710, 747, 18, 46, "Input"],
Cell[30114, 730, 537, 17, 28, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30688, 752, 553, 13, 28, "Input"],
Cell[31244, 767, 686, 17, 58, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[31979, 790, 114, 1, 28, "Subsubsection"],
Cell[32096, 793, 405, 9, 69, "Text"],
Cell[CellGroupData[{
Cell[32526, 806, 574, 12, 28, "Input"],
Cell[33103, 820, 59368, 980, 328, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[92520, 1806, 165, 2, 28, "Subsubsection"],
Cell[92688, 1810, 4264, 121, 233, "Input"],
Cell[96955, 1933, 163, 2, 30, "Text"],
Cell[97121, 1937, 274, 7, 28, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[97432, 1949, 116, 1, 28, "Subsubsection"],
Cell[97551, 1952, 3052, 86, 182, "Input"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[100652, 2044, 149, 2, 29, "Subsection"],
Cell[CellGroupData[{
Cell[100826, 2050, 119, 1, 28, "Subsubsection"],
Cell[100948, 2053, 259, 5, 30, "Text"],
Cell[101210, 2060, 982, 24, 46, "Input"],
Cell[102195, 2086, 1152, 28, 63, "Input"],
Cell[103350, 2116, 99, 1, 30, "Text"],
Cell[103452, 2119, 1700, 43, 63, "Input"],
Cell[105155, 2164, 99, 1, 30, "Text"],
Cell[105257, 2167, 1872, 51, 80, "Input"],
Cell[107132, 2220, 114, 2, 30, "Text"],
Cell[CellGroupData[{
Cell[107271, 2226, 340, 9, 28, "Input"],
Cell[107614, 2237, 97, 1, 28, "Output"]
}, Open  ]],
Cell[107726, 2241, 345, 11, 28, "Input"],
Cell[108074, 2254, 91, 1, 30, "Text"],
Cell[108168, 2257, 260, 6, 28, "Input"],
Cell[CellGroupData[{
Cell[108453, 2267, 130, 2, 28, "Input"],
Cell[108586, 2271, 169, 4, 28, "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[108816, 2282, 198, 3, 29, "Subsection"],
Cell[CellGroupData[{
Cell[109039, 2289, 102, 1, 28, "Subsubsection"],
Cell[109144, 2292, 125, 1, 30, "Text"],
Cell[CellGroupData[{
Cell[109294, 2297, 777, 19, 28, "Input"],
Cell[110074, 2318, 157, 4, 35, "Output"]
}, Open  ]],
Cell[110246, 2325, 106, 1, 30, "Text"],
Cell[110355, 2328, 325, 9, 28, "Input"],
Cell[110683, 2339, 120, 1, 30, "Text"],
Cell[110806, 2342, 375, 10, 28, "Input"],
Cell[111184, 2354, 103, 1, 30, "Text"],
Cell[111290, 2357, 429, 12, 28, "Input"],
Cell[111722, 2371, 163, 4, 28, "Input"],
Cell[111888, 2377, 104, 1, 30, "Text"],
Cell[CellGroupData[{
Cell[112017, 2382, 232, 6, 28, "Input"],
Cell[112252, 2390, 903, 20, 46, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[113192, 2415, 292, 7, 28, "Input"],
Cell[113487, 2424, 10186, 174, 238, "Output"]
}, Open  ]],
Cell[123688, 2601, 164, 3, 28, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[123889, 2609, 104, 1, 28, "Subsubsection"],
Cell[123996, 2612, 121, 1, 30, "Text"],
Cell[124120, 2615, 1035, 26, 63, "Input"],
Cell[125158, 2643, 279, 6, 30, "Text"],
Cell[125440, 2651, 2480, 64, 182, "Input"],
Cell[127923, 2717, 119, 1, 30, "Text"],
Cell[128045, 2720, 344, 8, 28, "Input"],
Cell[128392, 2730, 471, 14, 28, "Input"],
Cell[128866, 2746, 1406, 34, 97, "Input"],
Cell[CellGroupData[{
Cell[130297, 2784, 695, 17, 28, "Input"],
Cell[130995, 2803, 220865, 3627, 471, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[351909, 6436, 98, 1, 28, "Subsubsection"],
Cell[352010, 6439, 125, 1, 30, "Text"],
Cell[CellGroupData[{
Cell[352160, 6444, 2154, 52, 63, "Input"],
Cell[354317, 6498, 990, 27, 75, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[355344, 6530, 245, 6, 28, "Input"],
Cell[355592, 6538, 854, 19, 46, "Output"]
}, Open  ]],
Cell[356461, 6560, 158, 2, 30, "Text"],
Cell[356622, 6564, 388, 11, 28, "Input"],
Cell[CellGroupData[{
Cell[357035, 6579, 1179, 33, 80, "Input"],
Cell[358217, 6614, 851, 18, 46, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[359117, 6638, 107, 1, 28, "Subsubsection"],
Cell[359227, 6641, 248, 6, 28, "Input"],
Cell[359478, 6649, 551, 15, 28, "Input"],
Cell[360032, 6666, 1493, 36, 97, "Input"],
Cell[CellGroupData[{
Cell[361550, 6706, 744, 18, 28, "Input"],
Cell[362297, 6726, 83768, 1380, 471, "Output"]
}, Open  ]],
Cell[446080, 8109, 125, 1, 30, "Text"],
Cell[CellGroupData[{
Cell[446230, 8114, 2201, 53, 63, "Input"],
Cell[448434, 8169, 993, 27, 75, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[449464, 8201, 389, 8, 28, "Input"],
Cell[449856, 8211, 858, 19, 46, "Output"]
}, Open  ]],
Cell[450729, 8233, 158, 2, 30, "Text"],
Cell[450890, 8237, 482, 12, 28, "Input"],
Cell[CellGroupData[{
Cell[451397, 8253, 1234, 34, 80, "Input"],
Cell[452634, 8289, 855, 19, 46, "Output"]
}, Open  ]],
Cell[453504, 8311, 94, 1, 30, "Text"],
Cell[CellGroupData[{
Cell[453623, 8316, 1280, 37, 80, "Input"],
Cell[454906, 8355, 9216, 158, 238, "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]]
}, Closed]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)
