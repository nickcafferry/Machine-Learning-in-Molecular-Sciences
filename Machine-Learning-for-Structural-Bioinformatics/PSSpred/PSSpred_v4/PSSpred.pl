#!/usr/bin/perl
use File::Basename;
use Cwd 'abs_path';

################################################################
#
# This is a script program for protein secondary structure
# prediction (PSSpred) based on multiple weight neural-network
# training. It first collects multiple homologous sequences using 
# PSI-BLAST. Amino-acid frequence and log-odds data with Henikoff
# weights are then used to train SS separately based on the Rumelhart
# back-propagation of erros method. The final SS prediction is a 
# combination of 7 neural network SS predictors. 
# Comments should be addressed to zhng@umich.edu.
#
# usage: PSSpred.pl seq.txt
#
# 1, seq.txt is fasta file at datadir (the only input file)
#
# 2, output file:
#    seq.dat
#    seq.dat.ss
#
# 3, PSSpred.pl is split into three steps:
#    Step 1: prepare and run PSI-BLAST
#    Step 2: prepare mtx, pssm.txt, profw, freqccw, freqccwG
#    Step 3: run PSSpred and output files
# 
################################################################

###### you only need to change directory settings in following line #######
$db="/nfs/amino-library/nr/nr"; #where NR sequence database is
##############################################################################



























########### you donot have to modify the lines below#################
$PSSpreddir=dirname(abs_path(__FILE__)); #where PSSpred files are
$blastdir="$PSSpreddir/bin"; #where blast program is

################# directories #############################
if($ARGV[0]=~/(\S+)/){
    $fasta=$1;
}else{
    printf "please give the fasta file\n";
    printf "PSSpred.pl seq.txt\n";
    exit();
}
if(!-s "$fasta"){
    printf "fasta file ($fasta) does not exist, quit!\n";
    exit();
}

################ check nr database ###################
if (!-s "$db.pal")
{
    printf "ERROR! Cannot find (PSI-)BLAST library at $db.\n";
    printf "Please set the \$db variable in PSSpred.pl to point it to nr database download from ftp://zhanglab.ccmb.med.umich.edu/download/nr.tar.gz\n";
    exit();
}

################ check system ######################
$system    = $^O;
unless (lc($system) eq "linux")
{
    printf "ERROR! Your operating system $system is unsupported at this time\n";
    printf "Currently only 64bit linux is supported\n";
    exit();
}

################ check data folder #################
#$pwd=`pwd`;
#chomp($pwd);
#if ($pwd eq $PSSpreddir)
#{
    #printf "ERROR! Please run ".abs_path($0)." program outside $PSSpreddir folder to avoid file over-write.\n";
    #exit();
#}

########### setup  the environment and Working DIRectory ###
#$ENV{'PATH'}="/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/pgi/linux86/bin";
#$ENV{'LD_LIBRARY_PATH'}="/usr/local/lib:/usr/lib:/lib";

%ts=(
     'GLY'=>'G',
     'ALA'=>'A',
     'VAL'=>'V',
     'LEU'=>'L',
     'ILE'=>'I',
     'SER'=>'S',
     'THR'=>'T',
     'CYS'=>'C',
     'MET'=>'M',
     'PRO'=>'P',
     'ASP'=>'D',
     'ASN'=>'N',
     'GLU'=>'E',
     'GLN'=>'Q',
     'LYS'=>'K',
     'ARG'=>'R',
     'HIS'=>'H',
     'PHE'=>'F',
     'TYR'=>'Y',
     'TRP'=>'W',

     'ASX'=>'B',
     'GLX'=>'Z',
     'UNK'=>'X',

     'G'=>'GLY',
     'A'=>'ALA',
     'V'=>'VAL',
     'L'=>'LEU',
     'I'=>'ILE',
     'S'=>'SER',
     'T'=>'THR',
     'C'=>'CYS',
     'M'=>'MET',
     'P'=>'PRO',
     'D'=>'ASP',
     'N'=>'ASN',
     'E'=>'GLU',
     'Q'=>'GLN',
     'K'=>'LYS',
     'R'=>'ARG',
     'H'=>'HIS',
     'F'=>'PHE',
     'Y'=>'TYR',
     'W'=>'TRP',

     'a'=>'CYS',
     'b'=>'CYS',
     'c'=>'CYS',
     'd'=>'CYS',
     'e'=>'CYS',
     'f'=>'CYS',
     'g'=>'CYS',
     'h'=>'CYS',
     'i'=>'CYS',
     'j'=>'CYS',
     'k'=>'CYS',
     'l'=>'CYS',
     'm'=>'CYS',
     'n'=>'CYS',
     'o'=>'CYS',
     'p'=>'CYS',
     'q'=>'CYS',
     'r'=>'CYS',
     's'=>'CYS',
     't'=>'CYS',
     'u'=>'CYS',
     'v'=>'CYS',
     'w'=>'CYS',
     'x'=>'CYS',
     'y'=>'CYS',
     'z'=>'CYS',

     'B'=>'ASX',
     'Z'=>'GLX',
     'X'=>'CYS',
     );

@AA20=qw(
	 A
	 R
	 N
	 D
	 C
	 Q
	 E
	 G
	 H
	 I
	 L
	 K
	 M
	 F
	 P
	 S
	 T
	 W
	 Y
	 V
	 ); # pssm order

@AA21=qw(
	 A
	 R
	 N
	 D
	 C
	 Q
	 E
	 G
	 H
	 I
	 L
	 K
	 M
	 F
	 P
	 S
	 T
	 W
	 Y
	 V
	 X
	 ); # pssm order, 21 AA with "X" added, X=gap


%secondary=(
	    '1'=>'C',
	    '2'=>'H',
	    '4'=>'E',
	    'C'=>'1',
	    'H'=>'2',
	    'E'=>'4',
	    );

#goto pos10;
#####
# Step1: prepare and run PSI-BLAST
#####

#########make fasta input from 'seq.txt' #########################
open(fasta,">protein.fasta");
printf fasta "> protein\n";
open(seqtxt,"$fasta");
$Lch=0;
while($line=<seqtxt>){
    goto pos1 if($line=~/^>/);
    if($line=~/(\S+)/){
	$sequence=$1;
	$L=length $sequence;
	for($k=1;$k<=$L;$k++){
	    $Lch++;
	    $a=substr($sequence,$k-1,1);
	    foreach $A(@AA20){
		goto pos120 if($A eq $a);
	    }
	    $a="G";
	  pos120:;
	    $seqQ{$Lch}=$a;
	    printf fasta "$a";
	    if(int($Lch/60)*60==$Lch){
		printf fasta "\n";
	    }
	}
    }
  pos1:;
}
printf fasta "\n";
close(seqtxt);
close(fasta);

########### run psi-blast #######################
system("rm -f pssm.txt");
system("rm -f blast.out");
system("rm -f psitmp.chk");
if(!-s "pssm.txt" || !-s "blast.out" || !-s "psitmp.chk"){
    printf "running Psi-blast .....\n";
    `$blastdir/blastpgp  -b 1000 -j 3 -h 0.001 -d $db -i protein.fasta -C psitmp.chk -Q pssm.txt > blast.out`;
}

########### make mtx ----------->
`cp protein.fasta psitmp.fasta`;
`echo psitmp.chk > psitmp.pn`;
`echo psitmp.fasta > psitmp.sn`;
`$blastdir/makemat -P psitmp`;
`cp psitmp.mtx mtx`;

#####
# Step2: prepare input files for PSSpred
#####
########## generate profile from blast.out ##############################
# profw,    profile with henikoff weight
# freqccw,  frequence file with henikoff weight
# freqccwG, frequence file with nehikoff weight with gap countted
#########################################################################
$blosum62="
   A  R  N  D  C  Q  E  G  H  I  L  K  M  F  P  S  T  W  Y  V  B  Z  X  *
A  4 -1 -2 -2  0 -1 -1  0 -2 -1 -1 -1 -1 -2 -1  1  0 -3 -2  0 -2 -1 -1 -4 
R -1  5  0 -2 -3  1  0 -2  0 -3 -2  2 -1 -3 -2 -1 -1 -3 -2 -3 -1  0 -1 -4 
N -2  0  6  1 -3  0  0  0  1 -3 -3  0 -2 -3 -2  1  0 -4 -2 -3  3  0 -1 -4 
D -2 -2  1  6 -3  0  2 -1 -1 -3 -4 -1 -3 -3 -1  0 -1 -4 -3 -3  4  1 -1 -4 
C  0 -3 -3 -3  9 -3 -4 -3 -3 -1 -1 -3 -1 -2 -3 -1 -1 -2 -2 -1 -3 -3 -1 -4 
Q -1  1  0  0 -3  5  2 -2  0 -3 -2  1  0 -3 -1  0 -1 -2 -1 -2  0  3 -1 -4 
E -1  0  0  2 -4  2  5 -2  0 -3 -3  1 -2 -3 -1  0 -1 -3 -2 -2  1  4 -1 -4 
G  0 -2  0 -1 -3 -2 -2  6 -2 -4 -4 -2 -3 -3 -2  0 -2 -2 -3 -3 -1 -2 -1 -4 
H -2  0  1 -1 -3  0  0 -2  8 -3 -3 -1 -2 -1 -2 -1 -2 -2  2 -3  0  0 -1 -4 
I -1 -3 -3 -3 -1 -3 -3 -4 -3  4  2 -3  1  0 -3 -2 -1 -3 -1  3 -3 -3 -1 -4 
L -1 -2 -3 -4 -1 -2 -3 -4 -3  2  4 -2  2  0 -3 -2 -1 -2 -1  1 -4 -3 -1 -4 
K -1  2  0 -1 -3  1  1 -2 -1 -3 -2  5 -1 -3 -1  0 -1 -3 -2 -2  0  1 -1 -4 
M -1 -1 -2 -3 -1  0 -2 -3 -2  1  2 -1  5  0 -2 -1 -1 -1 -1  1 -3 -1 -1 -4 
F -2 -3 -3 -3 -2 -3 -3 -3 -1  0  0 -3  0  6 -4 -2 -2  1  3 -1 -3 -3 -1 -4 
P -1 -2 -2 -1 -3 -1 -1 -2 -2 -3 -3 -1 -2 -4  7 -1 -1 -4 -3 -2 -2 -1 -1 -4 
S  1 -1  1  0 -1  0  0  0 -1 -2 -2  0 -1 -2 -1  4  1 -3 -2 -2  0  0 -1 -4 
T  0 -1  0 -1 -1 -1 -1 -2 -2 -1 -1 -1 -1 -2 -1  1  5 -2 -2  0 -1 -1 -1 -4 
W -3 -3 -4 -4 -2 -2 -3 -2 -2 -3 -2 -3 -1  1 -4 -3 -2 11  2 -3 -4 -3 -1 -4 
Y -2 -2 -2 -3 -2 -1 -2 -3  2 -1 -1 -2 -1  3 -3 -2 -2  2  7 -1 -3 -2 -1 -4 
V  0 -3 -3 -3 -1 -2 -2 -3 -3  3  1 -2  1 -1 -2 -2  0 -3 -1  4 -3 -2 -1 -4 
B -2 -1  3  4 -3  0  1 -1  0 -3 -4  0 -3 -3 -2  0 -1 -4 -3 -3  4  1 -1 -4 
Z -1  0  0  1 -3  3  4 -2  0 -3 -3  1 -1 -3 -1  0 -1 -3 -2 -2  1  4 -1 -4 
X -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -4 
* -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4  1 
";
undef %B;
@lines=split("\n",$blosum62);
foreach $line(@lines){
    if($line=~/A  R  N  D  C  Q  E  G  H  I  L  K  M  F  P  S  T  W  Y  V  B  Z  X/){
	@aa=split(" ",$line);
    }else{
	if($line=~/(\S)\s+(.+)/){
	    $a=$1;
	    $b=$2;
	    @bb=split(" ",$b);
	    for($i=1;$i<=23;$i++){
		$B{$a,$aa[$i-1]}=$bb[$i-1];
	    }
	}
    }
}

for($cut=1;$cut<=2;$cut++){
    if($cut==1){ #without cutoff, for profw
	$cut1=1000;
	$cut2=1000;
    }else{       #with cutoff, for freqccw, frewccwG
	$cut1=0.001;
	$cut2=98;
    }
    
    ######## read blast.out ------------>
    undef %am;
    open(blast,"blast.out");
    while($line=<blast>){
	if($line=~/Results from round\s+(\d+)/){
	    $ROUND=$1;
	}
    }
    seek(blast,0,0);
    
    $it=0;
    while($line=<blast>){
	if($line=~/Results from round\s+$ROUND/){
	    while($line=<blast>){
		if($line=~/Expect =\s*(\S+)/){
		    $ev=$1;
		    <blast>=~/Identities =\s*\S+\s+\((\S+)\%/;
		    <blast>;
		    $id=$1;
		    if($ev<$cut1 && $id < $cut2){
			$it++; #number of aligned sequences
			while($line=<blast>){
			    if($line=~/Quer\S+\s*(\d+)\s+(\S+)\s+(\S+)/){
				$i1=$1;
				$seq1=$2;
				<blast>;
				<blast>=~/Sbjc\S+\s*(\S+)\s+(\S+)\s+(\S+)/;
				$seq2=$2;
				$seq2=~s/\*/X/mg;
				$seq2=uc($seq2);
				<blast>;
				###
				$L=length $seq1;
				$m1=$i1-1;
				for($i=1;$i<=$L;$i++){
				    $q1=substr($seq1,$i-1,1);
				    $q2=substr($seq2,$i-1,1);
				    $m1++ if($q1 ne '-');
				    if($q1 ne '-' && $q2 ne '-'){
					$am{$it,$m1}=$q2;
				    }
				}
				###
			    }else{
				goto pos1a;
			    }
			}
		    }
		  pos1a:;
		}
	    }
	}
    }
    close(blast);
    ######## include query sequence ---------->
    $it++;
    for($i=1;$i<=$Lch;$i++){
	$am{$it,$i}=$seqQ{$i};
    }
    
    goto pos11;
    ###### output MSA for check:
    for($j=1;$j<=$it;$j++){
	for($i=1;$i<=$Lch;$i++){
	    $a=$am{$j,$i};
	    if($a!~/\S/){
		$a="-";
	    }
	    print "$a";
	}
	printf "\n";
    }
  pos11:;

    ####### calculate Henikoff weight $w{i_seq} without gap ----------->
    ##### nA{A,i_pos}: number of times A appear at the position:
    $w_all=0;
    undef %w;  #Henikoff wight
    undef %nA; #number of time A appear at i
    undef %r;  #number of different A at i
    for($i=1;$i<=$Lch;$i++){
	$a="";
	for($j=1;$j<=$it;$j++){
	    if($am{$j,$i}=~/\S/){
		$nA{$am{$j,$i},$i}++; #number of time A appear at i
		if($a!~/$am{$j,$i}/){
		    $a.=$am{$j,$i};
		}
	    }
	}
	$r{$i}=length $a; #number of different A at i
    }
    ##### henikoff weight w(i)=sum of 1/rs:
    for($i=1;$i<=$it;$i++){
	for($j=1;$j<=$Lch;$j++){
	    ####### r: number of different residues in j'th position:
	    $r1=0;
	    foreach $A(@AA20){
		$r1++ if($nA{$A,$j}>0);
	    }
	    if($am{$i,$j}=~/\S/){ # gap neglected, means lower weight for gapped alignment sequence
		$s2=$nA{$am{$i,$j},$j};
		$w1=1.0/($r1*$s2); #1/r*s
		$w{$i}+=$w1;
	    }
	}
	$w_all+=$w{$i};
    }
    #### normalization of w(i):
    for($i=1;$i<=$it;$i++){
	$w{$i}/=$w_all; #normalized to 1
    }
    #^^^^^ Henikoff weight finished ^^^^^^^^^^^^^^^^^
    
    #exit();

    ########### weighted frequence #################
    undef %log1; #frequence with Helikof weight
    for($i=1;$i<=$it;$i++){
	for($j=1;$j<=$Lch;$j++){
	    $A=$am{$i,$j};
	    $log1{$j,$A}+=$w{$i}; #log1 will be renormalized anyway
	    #$log1{$j,$A}+=1; #log1 will be renormalized anyway
	}
    }
    #^^^^^^^^^ Henikoff frequence finished ^^^^^^^^^^^^^
    
    if($cut==1){
	######### output prof ------------->
	undef %S1w; # profile by direct sum
	for($i=1;$i<=$Lch;$i++){
	    foreach $A(@AA20){
		for($j=1;$j<=$it;$j++){
		    #$S1{$i,$A}+=$B{$am{$j,$i},$A};
		    $S1w{$i,$A}+=$B{$am{$j,$i},$A}*$w{$j}*$it;
		}
		$S1w{$i,$A}/=$it; #equal to $S2
	    }
	}
	open(mtx1,">profw");
	printf mtx1 "%5d    ",$Lch;
	foreach $A(@AA20){
	    printf mtx1 "     %s    ",$A;
	}
	printf mtx1 "\n";
	for($i=1;$i<=$Lch;$i++){
	    printf mtx1 "%3d $seqQ{$i} %3d",$i,$i;
	    foreach $A(@AA20){
		printf mtx1 " %9.6f",$S1w{$i,$A};
	    }
	    printf mtx1 "\n";
	}
	close(mtx1);
    }else{
	######### output freqccw ------------->
	open(freq1,">freqccw");
	printf freq1 "%5d    ",$Lch;
	foreach $A(@AA20){
	    printf freq1 "     %s    ",$A;
	}
	printf freq1 "\n";
	for($i=1;$i<=$Lch;$i++){
	    printf freq1 "%3d $seqQ{$i} %3d",$i,$i;
	    $norm1=0;
	    foreach $A(@AA20){
		$norm1+=$log1{$i,$A};
	    }
	    foreach $A(@AA20){
		printf freq1 "%10.7f",$log1{$i,$A}/$norm1;
	    }
	    printf freq1 "\n";
	}
	close(freq1);
	
	########################################
	########## replace gap by "X" --------->
	########################################
	for($i=1;$i<=$Lch;$i++){
	    for($j=1;$j<=$it;$j++){
		if($am{$j,$i}!~/\S/){
		    $am{$j,$i}="X";
		}
	    }
	}
	
	####### re-calculate Henikoff weight $w{i_seq} with gap ----------->
	##### nA{A,i_pos}: number of times A appear at the position:
	$w_all=0;
	undef %w;  #Henikoff wight
	undef %nA; #number of time A appear at i
	undef %r;  #number of different A at i
	for($i=1;$i<=$Lch;$i++){
	    $a="";
	    for($j=1;$j<=$it;$j++){
		if($am{$j,$i}=~/\S/){
		    $nA{$am{$j,$i},$i}++; #number of time A appear at i
		    if($a!~/$am{$j,$i}/){
			$a.=$am{$j,$i};
		    }
		}
	    }
	    $r{$i}=length $a; #number of different A at i
	}
	##### henikoff weight w(i)=sum of 1/rs:
	for($i=1;$i<=$it;$i++){
	    for($j=1;$j<=$Lch;$j++){
		if($am{$i,$j}=~/\S/){ # gap neglected, means lower weight for gapped alignment sequence
		    $s2=$nA{$am{$i,$j},$j};
		    $w1=1.0/($r{$j}*$s2); #1/r*s
		    $w{$i}+=$w1;
		}
	    }
	    $w_all+=$w{$i};
	}
	#### normalization of w(i):
	for($i=1;$i<=$it;$i++){
	    $w{$i}/=$w_all; #normalized to 1
	}
	#^^^^^ Henikoff weight finished ^^^^^^^^^^^^^^^^^
	
	########### weighted frequence #################
	undef %log;  #frequence
	undef %log1; #frequence with Helikof weight
	for($i=1;$i<=$it;$i++){
	    for($j=1;$j<=$Lch;$j++){
		$A=$am{$i,$j};
		$log{$j,$A}+=1;
		$log1{$j,$A}+=$w{$i}; #log1 will be renormalized anyway
	    }
	}
	#^^^^^^^^^ Henikoff frequence finished ^^^^^^^^^^^^^
	
	######### output freqccwG ------------->
	open(freq1,">freqccwG");
	printf freq1 "%5d    ",$Lch;
	foreach $A(@AA21){
	    printf freq1 "     %s    ",$A;
	}
	printf freq1 "\n";
	for($i=1;$i<=$Lch;$i++){
	    printf freq1 "%3d $seqQ{$i} %3d",$i,$i;
	    $norm1=0;
	    foreach $A(@AA21){
		$norm1+=$log1{$i,$A};
	    }
	    foreach $A(@AA21){
		printf freq1 "%10.7f",$log1{$i,$A}/$norm1;
	    }
	    printf freq1 "\n";
	}
	close(freq1);
    }
}

#####
# Step3: run PSSpred and output results
#####
$nprog=7;
for($i=1;$i<=$nprog;$i++){
    printf "Running PSSpred$i ...\n";
    system("$PSSpreddir/PSSpred$i $PSSpreddir/wgt$i output$i.ss");
}

###### combine different output ------->
for($i=1;$i<=$nprog;$i++){
    open(ss,"output$i.ss");
    $Lch1=0;
    while($line=<ss>){
	if($line=~/(\d+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/){
	    $Lch1++;
	    $pp{$Lch1,$i,2}=$4;  #helix
	    $pp{$Lch1,$i,4}=$5;  #extend
	    $pp{$Lch1,$i,1}=$6;  #coil
	}
    }
    close(ss);
}

for($i=1;$i<=$Lch;$i++){
    undef %p;
    for($j=1;$j<=$nprog;$j++){
	$p{2}+=$pp{$i,$j,2};
	$p{4}+=$pp{$i,$j,4};
	$p{1}+=$pp{$i,$j,1};
    }
    $p{2}/=$nprog;
    $p{4}/=$nprog;
    $p{1}/=$nprog;
    @p_keys=sort{$p{$b}<=>$p{$a}} keys %p;
    $sec{$i}=$p_keys[0];
    $rel{$i}=int(0.5+10*($p{$p_keys[0]}-$p{$p_keys[1]}));
    $rel{$i}=9 if($rel{$i}>9);
}

######## SMOOTH ################
%sec=smooth($Lch,%sec);

open(seq,">seq.dat");
open(ss,">seq.dat.ss");
printf ss "$Lch   coil  helix  beta\n\n";
for($i=1;$i<=$Lch;$i++){
    printf seq "%5d   %3s%5d%5d\n",$i,$ts{$seqQ{$i}},$sec{$i},$rel{$i};
    
    undef %p;
    for($j=1;$j<=$nprog;$j++){
	$p{2}+=$pp{$i,$j,2};
	$p{4}+=$pp{$i,$j,4};
	$p{1}+=$pp{$i,$j,1};
    }
    $p{2}/=$nprog;
    $p{4}/=$nprog;
    $p{1}/=$nprog;
    printf ss "%4d %1s %1s %6.3f %6.3f %6.3f \n",
    $i,$seqQ{$i},$secondary{$sec{$i}},$p{1},$p{2},$p{4};
}
close(seq);
close(ss);

##### clean files ################
@tt=qw(
       psitmp.fasta
       psitmp.pn
       psitmp.sn
       psitmp.mn
       psitmp.aux
       
       mtx
       pssm
       profw
       freqccw
       freqccwG
       );

foreach $t(@tt){
    #`rm $t`;
}

exit();

sub smooth{
    my($Lch,%sec)=@_;
    ####### smooth the predictions ############
    # --2-- => -----
    for($i=1;$i<=$Lch;$i++){
	if($sec{$i} eq "2"){
	    if($sec{$i-1} ne "2"){
		if($sec{$i-2} ne "2"){
		    if($sec{$i+1} ne "2"){
			if($sec{$i+2} ne "2"){
			    $sec{$i}=1;
			}
		    }
		}
	    }
	}
    }
    # --22-- => ------
    for($i=1;$i<=$Lch;$i++){
	if($sec{$i+0} ne "2"){
	    if($sec{$i+1} ne "2"){
		if($sec{$i+2} eq "2"){
		    if($sec{$i+3} eq "2"){
			if($sec{$i+4} ne "2"){
			    if($sec{$i+5} ne "2"){
				$sec{$i+2}=1;
				$sec{$i+3}=1;
			    }
			}
		    }
		}
	    }
	}
    }
    return(%sec);
}
