#!/usr/bin/perl
use Math::Trig;

$t1=time();
########### setup  the environment and Working DIRectory ###
$ENV{'PATH'}="/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/pgi/linux86/bin";
$ENV{'LD_LIBRARY_PATH'}="/usr/local/lib:/usr/lib:/lib";

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

@ww=qw(
       0.05
       0.10
       0.15
       0.20
       0.25
       0.30
       0.35
       0.40
       0.45
       0.50
       0.55
       0.60
       0.65
       0.70
       0.75
       0.80
       0.85
       );

$librarydir=$ARGV[0]; ## changed"/nfs/amino-library";
################# directories #############################
`cp $librarydir/bin/solve .`;
`cp $librarydir/bin/SAprd/wgt/wgt.tar.bz2 .`; #from /home/yzhang/bin/SAprd/train/wgt31
`/bin/tar -jxvf wgt.tar.bz2`;

############# run psi-Blast ################
system("$librarydir/blast/bin/blastpgp -i protein\.fasta -Q protein\.mat3 -d $librarydir/nr/nr -o protein\.out -e 1e-3 -h 1e-3 -M BLOSUM62 -j 3 -m 6");

############# run solvent ##################
foreach $w(@ww){
    `./solve weight.$w protein`; #protein.neu
    open(neu,"protein.neu");
    <neu>=~/(\d+)/;
    $Lch=$1;
    for($i=1;$i<=$Lch;$i++){
	<neu>=~/(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
	$exp{$i,$w}=$5;
    }
    close(neu);
}
open(exp1,">exp.dat");
printf exp1 "$Lch  ";
foreach $w(@ww){
    printf exp1 " %5s",$w;
}
printf exp1 "\n";
for($i=1;$i<=$Lch;$i++){
    printf exp1 "%5d",$i;
    foreach $w(@ww){
	printf exp1 " %5d",$exp{$i,$w};
    }
    printf exp1 "\n";
}
close(exp1);

####### remove unuseful files ------------->
`rm solve`;
`rm wgt.tar.bz2`;
`rm weight*`;

$t2=time();
$dif1=$t2-$t1;
open(F1,">time_exp.txt");
printf F1 "$dif1";
close(F1);

exit();


