###############################################################
#run the program like this:
#          "perl run.pl proteinname programname username sequencedirectory"
#example:  "perl run.pl 1a0aA psicov baoji /home/baoji/TTT/data"
#       the name of the program can be :psicov, SPcon, SVMcon, SVMSEQ, NNcon, betacon, CCMpred, meta-psicov, freecontact, NN-BAYES
###############################################################
$s=$ARGV[0];            #***********name of the protein************
$program=$ARGV[1];      #*******************program*****************
$usrname=$ARGV[2];      #*******************username****************
$seqdir=$ARGV[3];       #****directory of the sequence in fasta*****
$libdir="/nfs/amino-home/zhng/zhanglab_programs/NN-BAYES/NN-BAYES";
$currentdir=`pwd`;
chomp($currentdir);
mkdir("$seqdir") if !-s "$seqdir";
#mkdir("$seqdir") if !-s "$seqdir";
###################################################################
print "$s\n";
print "$program\n";
print "$usrname\n";
print "$serdir\n";

#########################SEQUENCE prepare###################################################
@seqtxts=`cat $seqdir/seq.txt`;
$sequence="";
foreach $seqtxt(@seqtxts){
    goto pos6 if($seqtxt=~/\>/);
    $seqtxt=~s/\s//mg;
    $seqtxt=~s/\n//mg;
    $sequence=$sequence.$seqtxt;
  pos6:;
}
open(GGG,">$seqdir/RRR");
print GGG ">$s\n";
print GGG "$sequence";
close(GGG);

`mv $seqdir/RRR $seqdir/seq.txt`;
#############################################################################

#if(($program eq "RLS")){
#        $tag="prepare$program";
#        $jobname="$currentdir/record/$s/prepare.pl";
#        $errfile="$currentdir/record/$s/err\_$tag";
#        $outfile="$currentdir/record/$s/out\_$tag";
#        $walltime="walltime=99:00:00";
# 
#        $temp="prepare.pl";
#        $mod1=`cat $currentdir/$temp`;
#        $mod1=~s/\!ERRFILE\!/$errfile/mg;
#        $mod1=~s/\!OUTFILE\!/$outfile/mg;
#        $mod1=~s/\!WALLTIME\!/$walltime/mg;
#        $mod1=~s/\!PDBNAME\!/$s/mg;
#        $mod1=~s/\!USRNAME\!/$usrname/mg;
#        $mod1=~s/\!CURRENTDIR\!/$currentdir/mg;
#        $mod1=~s/\!SEQDIR\!/$seqdir/mg;
#
#
#    open(JOB,">$jobname");
#    print JOB "$mod1\n";
#    close(JOB);
#
#
#}






#####################run ten programs #########################

        $tag="$program\_$s";
        $jobname="$seqdir/$tag";
        $errfile="$seqdir/err\_$tag";
        $outfile="$seqdir/out\_$tag";
        $walltime="walltime=99:00:00";
        
        $temp="$program"."mod.pl";
        $mod1=`cat $libdir/$temp`;
        $mod1=~s/\!ERRFILE\!/$errfile/mg;
        $mod1=~s/\!OUTFILE\!/$outfile/mg;
        $mod1=~s/\!WALLTIME\!/$walltime/mg;
        $mod1=~s/\!PDBNAME\!/$s/mg;
        $mod1=~s/\!USRNAME\!/$usrname/mg;
        $mod1=~s/\!CURRENTDIR\!/$currentdir/mg;
        $mod1=~s/\!SEQDIR\!/$seqdir/mg;


    open(JOB,">$jobname");
    print JOB "$mod1\n";
    close(JOB);
     
       `chmod a+x $jobname`;
           
       print "qsub -q default $jobname\n";
   `qsub -q default $jobname`;
#    `perl $jobname`;
print "running $program\n";

exit();
