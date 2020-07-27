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

   For __Practical Session: Machine Learning and Property Prediction__, please run these commands on [Wolfram Cloud](https://www.wolframcloud.com/):
   
   ```mathematica
   
   (*Please adjust the following path to where you unpacked the reference implementation code from the supplementary material.*)
   
   AppendTo[$Path,FileNameJoin[{"Path","to","library"}]]; (* Parent directory containing QMMLPack directory *)
   
   ```
   
- **Thursday-June-15**

  For __Practical Session: Machine Learning of Free Energy Surfaces__, please run these commands on Linux system (In order to compile the code, a C++ compiler and the mkl library will be needed): 
  
  _1._ Unpack the tar file:
                        
                        ```sh
                                        tar -xzvf Neural_network_practical_software.tar.gz
                        ```
  _2._ Change Command-Line-Interface to the directory created by unpacking and compile the source code. At the beginning, edit 'Makefile' and change the C and C++ compliers to the corresponding ones you have available on your sytem, e.g., 'gcc' and 'g++' or 'icc' if necessary. The complie the code by typing 
                        
                        ```sh
                                                             make
                        ```
  _3._ Create a training data set from the full dataset. One of two commands is avaiable for use:
                       
                       ```sh
                                         head -n ala-dip-data_all.txt > ala-dip-data.txt
                                         tail -nl ala-dip-data_all.txt > ala-dip-data.txt
                       ```
     Here n is the number of training points you wish to extract from the full dataset.
     
  _4_. Edit the 2nd, 3rd, 4th, and 5th lines in the file "INPUT.txt" if you want to change the calculation type, number of conjugate gradient steps, checkpointing frequency of weights, and number of conjugate gradient line-minmization steps. 
   
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

[PubChem](https://pubchem.ncbi.nlm.nih.gov) (Biological activities of small molecules) 



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
   
