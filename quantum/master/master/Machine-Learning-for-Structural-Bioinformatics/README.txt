###############################################################################
#    INSTALLATION AND IMPLEMENTATION OF NeBcon (version 1.0, 2017/02/26)      #
#    This program belongs to Zhang Lab at University of Michigan	      #
#    If you have any questions, please contact "hebaoji@itp.ac.cn" or         #
#    "mortuza@umich.edu"						      #
###############################################################################

DISCLAIMER: NeBcon uses several scripting languages (e.g. awk, sed, cat). 
            Therefore, the package can be run ONLY in "LINUX" environment. Also, 
            you need to download and install perl and JAVA to run NeBcon.


1. What is NeBcon?

   NeBcon (Neural-network and Bayes-classifier based contact prediction) is an 
   algorithm for sequence-based protein contact prediction, built on multiple 
   contact prediction programs, which are machine-learinng, co-evolution and 
   meta-server based. It first uses the naive Bayes classifier to calculate the 
   posterior probability of multiple contact predictors. Neural Network is then 
   used to train the actual contact maps against the secondary structure, solvent 
   accessibility, Shannon entropy of multiple sequence alignments,in combination 
   with the posterior probability scores calculated from the predictors. 
   The benchmark result shows significant advantage of contact prediction over
   individual contact programs. The contact programs that are used in NeBcon are:

	  (a) SVMSEQ
	  (b) PSICOV
	  (c) CCMpred
	  (d) Freecontact
	  (e) STRUCTCH
	  (f) MetaPSICOV

2. Download required databases:
   
   a) RUN the "download_db.sh" bash script in the "./NeBconpackage" directory using 
      the following command to download and extract uniprot20, uniref90 and nr.

      sh download_db.sh

3. Guidelines to run NeBcon:

   a) Create an input directory for a specific protein (e.g. 1i3cA) and place the 
      fasta format of the protein sequence with name "seq.txt" in the input 
      directory. 

      (Example: Say, for the protein 1i3cA, an input folder, named 1i3cA, is 
       created at "/home/user/NeBconpackage/test/"
       That means, the "seq.txt" file of the protein 1i3cA should be placed for 
       this example is at: /home/user/NeBconpackage/test/1i3cA/ )

   b) run "nebcon.pl" perl script in the ./NeBconpackage directory using following 
      command:

   ./nebcon.pl -seqname <sequence_name> -datadir <data_dir> -runstyle <run_style>

   Here, for "-seqname", "-datadir" and "-runstyle" flags, provide following arguments
   respectively.

   <sequence_name> :Provide name of the sequence (1i3cA,1hxrA,etc.)
   <data_dir>	   :Provide path where the sequence file (seq.txt) is placed
   <run_style>	   :Provide the run style (either "serial" or "parallel") of the jobs. 
                    If it is "serial",the script will run jobs sequentially. If your 
                    system supports running parallel jobs in different nodes using 
                    PBS/torque job scheduling system, you may put "parallel"
   
    Example:
   -----------
   ./nebcon.pl -seqname 1i3cA -datadir /home/user/NeBconpackage/test/1i3cA -runstyle serial

4. Output files: 

    a) NeBcon program first generates output contact map files "XXX.dat" for the 
       six predictors, where XXX refers to the name of the predictor. Then, 
       the program generates final output files for NeBcon as shown in b.

    b) NeBcon output files:
     -- nnbayes.dat (for Carbon alpha contact map)
     -- nnbayesb.dat (for Carbon beta contact map)
     -- protein-step1 (Predicted beta fragments)
     -- protein-step2 (Provides the aligned score) 
     -- protein-step3 (Provides the reliable beta strands and score)

    c) Additional contact output files for QUARK:
      -- NeBcon program also generates contact map files "XXX.dat.quark" for 
         the predictors, including NeBcon. Here, XXX refers to the name of the
         predictors. These contact maps can be used in QUARK to predict 3D 
         structure of the proteins.

    d) The program also generates following files as byproducts that are used to 
       predict contact maps:
      -- protein.aln (Aligned homologous sequences from PSI-BLAST search)
      -- protein.solv (Predicted solvent accessibility by PSSpred)
      -- seq.dat.ss (Predicted secondary structure by psipred)
      -- protein.colstats (Aligned sequence statistics)


5. Example cases are provided in the folder "./NeBconpackage/test", where all the input and 
   output files for protein "1i3cA" and "1hxrA" are available.

6. The webserver of the program is available at: 
   http://zhanglab.ccmb.med.umich.edu/NeBcon/

7. If you use NeBcon, please cite:

   Baoji He, S.M. Mortuza, Yanting Wang, Hongbin Shen, Yang Zhang. NeBcon: Protein contact 
   map prediction using neural network training coupled with naïve Bayes classifiers. 
   submitted, 2017.

8. Notes:
   The original version of NeBcon in the paper used two additional programs (Betacon and 
   SVMcon), but this release only contains 6 programs due to the license restriction on 
   program release. However, our benchmark results show that the versions with and without 
   the programs after retraining perform comparably.
