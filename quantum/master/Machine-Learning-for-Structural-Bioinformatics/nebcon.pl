#!/usr/bin/perl
#
use Math::Trig;

############################################################
# This script will generate 6 individual jobs for contact predictions
# NeBcon program is run inside METAPSICOVmod. It will start to run
# after all other contact predictions are complete. At the end of 
# METAPSICOVmod, there is one script that convert all contact prediction
# to the format that can be called by QUARK
############################################################

######### you do not need to change the below ##############
$Q="default";
$user=$ENV{USER}; # user name
use File::Basename;
use Cwd 'abs_path';
$bindir=dirname(abs_path(__FILE__)); #where scripts and programs are
my $system    = $^O;

unless (lc($system) eq "linux")
{
    printf("Your operating system $system is unsupported at this time\n");
    printf("Currently only Linux is supported\n");
    exit();
}

################parse arguments
$totarg=0;
foreach $w(@ARGV)
{
    $totarg++;
}
if($totarg<3)
{
    &print_help();
    exit();
}
$flagmand[0]=0;
$flagmand[1]=0;
$flagmand[2]=0;

for($i=0;$i<$totarg-1;$i++)
{
    $str1=substr($ARGV[$i+1],0,1);
    if($str1 eq "-")
    {
        next;
    }
    if($ARGV[$i] eq "-seqname")
    {
        $s=$ARGV[$i+1];
        $flagmand[0]=1;
    }
    elsif($ARGV[$i] eq "-datadir")
    {
        $data_dir=abs_path($ARGV[$i+1]);
        $flagmand[1]=1;
    }
    elsif($ARGV[$i] eq "-runstyle")
    {
        $run_style=$ARGV[$i+1];
        $flagmand[2]=1;
    }
}

if($flagmand[0]==0)
{
    &print_help();
    print "Warning!Please set -seqname\n\n";
    exit();
}
if($flagmand[1]==0)
{
    &print_help();
    print "Warning!Please set -datadir\n\n";
    exit();
}
if($flagmand[2]==0)
{
    &print_help();
    print "Warning!Please set -runstyle\n\n";
    exit();
}





@FF=qw(
       SPCON
       PSICOV       
       SVMSEQ
       METAPSICOV
       );

$recorddir="$data_dir/../record"; #for record all log files and intermiddiate job files
`mkdir -p $recorddir`;
foreach $F(@FF){
    $modfile="$bindir/$F"."mod";
    $jobmod=`cat $modfile`;
    
    ###
    $tag="$F\_$s"; # unique name
    $jobname="$recorddir/$tag";
    $errfile="$recorddir/err_$tag";
    $outfile="$recorddir/out_$tag";
    if($F=~/PSIC/ || $F=~/SPCON/){ #SPcon, psicov, metapsicov
	$walltime="walltime=15:00:00,mem=15000mb"; #need more space for nr
    }else{
	$walltime="walltime=15:00:00,mem=4000mb";
    }
    #$node="nodes=1:ppn=1:zhanglib";
    $node="nodes=1:ppn=1";
    ###
    #------- jobname ------>
    $mod=$jobmod;
    $mod=~s/\!ERRFILE\!/$errfile/mg;
    $mod=~s/\!OUTFILE\!/$outfile/mg;
    $mod=~s/\!WALLTIME\!/$walltime/mg;
    $mod=~s/\!NODE\!/$node/mg;
    ##
    $mod=~s/\!TAG\!/$tag/mg;
    $mod=~s/\!S\!/$s/mg;
    $mod=~s/\!USER\!/$user/mg;
    $mod=~s/\!Q\!/$Q/mg;
    $mod=~s/\!DATA_DIR\!/$data_dir/mg;
    $mod=~s/\!BIN_DIR\!/$bindir/mg; 
    $mod=~s/\!RECORDDIR\!/$recorddir/mg;
    open(job,">$jobname");
    print job "$mod\n";
    close(job);
    `chmod a+x $jobname`;
    
    if ($run_style eq "parallel"){
      pos42:; 
      $bsub=`qsub -q $Q $jobname`;
      chomp($bsub);
      if(length $bsub ==0){
	sleep(20);

	goto pos42;
      }
    }

     else{
       printf "$jobname\n";
       system("$jobname");
    }

    $date=`/bin/date`;
    chomp($date);
    open(note,">>$recorddir/note.txt");
    print "$jobname\t at $date $bsub\n";
    print note "$jobname\t at $date $bsub\n";
    close(note);
    #sleep(1);
  pos1:;
}
exit();

sub print_help
{
    printf 
        "NeBcon USAGE:
=====================
Mandatory arguments:
=====================
./nebcon.pl -seqname <sequence_name> -datadir <data_dir> -runstyle <run_style>

======================
Tips for arguments:
======================
<sequence_name> :Provide name of the sequence (1i3cA,1hxrA,etc.)
<data dir>	:Provide path where the sequence file (seq.txt) is placed
<run_style>	:Provide the run style (either \"serial\" or \"parallel\") of the jobs. If it is \"serial\", the script will run jobs sequentially.
                 If your system supports running parallel jobs in different nodes using PBS/torque job scheduling system, you may put \"parallel\"

An example case:
=====================
./nebcon.pl -seqname 1i3cA -datadir /home/user/NeBconpackage/test/1i3cA -runstyle serial

";
}
