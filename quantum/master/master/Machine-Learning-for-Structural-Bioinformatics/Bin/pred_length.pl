#!/usr/bin/perl

##############################################################################
# This program is to predict number of contact based on exp.dat.ss and exp.dat
# (from /nfs/amino-home/zhng/zhanglab_programs/QUARK_modified/NUMBER/runsta1.pl)
#
# usage: pred_length.pl $datadir
#
# input:
#    seq.dat.ss
#    exp.dat
# output:
#    ert-long
#    ert-medm
#    ert-short
##############################################################################

$dir=$ARGV[0];
#$wekadir="!BIN_DIR!/bin/weka-3-7-12"; ## Changed. see later
#$bindir="/nfs/amino-home/zhng/zhanglab_programs/QUARK_modified/NUMBER";
$bindir=$ARGV[1];  #"!BIN_DIR!/bin";
$wekadir=$ARGV[2];

############# prepare input file for NN ####################
open(TTT,">$dir/final-contact.arff");

print TTT "\@relation ''\n";
for($i=1;$i<=401;$i++){
    print TTT "\@attribute feature$i numeric\n";
}
print TTT "\@attribute class numeric\n";
print TTT "\@data\n";

#### seq.dat.ss ------->
@ss=();
for($k=0;$k<4;$k++){
    $ss[0][$k]=0;
}

open(GGG,"$dir/seq.dat.ss");
$Lch=0;
while($line=<GGG>){
    if($line=~/(\d+)\s+(\S)\s+(\S)\s+(\S+)\s+(\S+)\s+(\S+)/){
	$Lch++;
	$ss[$1][1]=$4;
	$ss[$1][2]=$5;
	$ss[$1][3]=$6;
    }
}
close(GGG);

for($i=0;$i<100;$i++){
    $a=int($i*$Lch/100);
    $a1=$ss[$a][1];
    $a2=$ss[$a][2];
    $a3=$ss[$a][3];
    print TTT "$a1,$a2,$a3,";
}

##### exp.dat ----------->
@solve=();
for($i=0;$i<$Lch;$i++){	
    $solve[$i]=0;
}
open(GGG,"$dir/exp.dat");
<GGG>;
while($tr=<GGG>){
    chomp($tr);
    $tr=~s/^\s+|\s+$//g;
    @temp=();
    @temp=split(/\s+/,$tr);
    $temp[18]=0;
    if($temp[1]==0){
	$solve[$temp[0]]=0.0;
    }else{
	for($l=1;$l<=17;$l++){
	    if($temp[$l]==1 and $temp[$l+1]==0){
		$solve[$temp[0]]=$l*0.05;
		goto TRY;
	    }
	}
    }
  TRY:;
}
close(GGG);

for($i=0;$i<100;$i++){
    #print "$solve[int($i*$Lch/100)],";
    print TTT "$solve[int($i*$Lch/100)],";
}
$loglength=log($Lch)/log(100);
$class=$conn/$Lch;

print TTT "$loglength,$class\n";
print "Lch, log(Lch), class = $Lch, $loglength, $class\n";

close(TTT);


############ run NN to generate 'ert-range' ----------->
`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/NUMBER/short.model -T $dir/final-contact.arff -p 0 >  $dir/ert-short`;

`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/NUMBER/medium.model -T $dir/final-contact.arff -p 0 >  $dir/ert-medium`;

`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/NUMBER/long.model -T $dir/final-contact.arff -p 0 >  $dir/ert-long`;

exit();
