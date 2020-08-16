###################################2014-12-6###################################################
###################################ZHANG LABS##################################################
####################################BAOJI HE###################################################
#!/usr/perl
$dir="!DIRNNBAYES!";
$wekadir="/nfs/amino-library/contact/NEW/weka-3-7-12";
$datadir="/nfs/amino-home/zhng/zhanglab_programs/QUARK_modified/NUMBER";
open(TTT,">$dir/final-contact.arff");
print TTT "\@relation ''\n";
for($i=1;$i<=401;$i++)
{
print TTT "\@attribute feature$i numeric\n";
}
print TTT "\@attribute class numeric\n";
print TTT "\@data\n";




@lists=qw(
!PDBNAME!
);
foreach $line (@lists)
{
print "$line";
	chomp($line);


##################################NATIVE######################################
###############################################################################
#
#
$note=0;
open(WER,"$dir/seq.txt");
while($tyu=<WER>)
{
        chomp($tyu);
        $opo=length($tyu);
        if($opo>$note){$note=$opo;}

}
close(WER);


@ss=();
for($l=0;$l<=$note;$l++)
{
	for($k=0;$k<4;$k++)
	{
		$ss[$l][$k]=0;
	}
}
if(-e "$dir/protein.ss2")
{
open(GGG,"$dir/protein.ss2");
}
else{open(GGG,"$dir/protein.ss2");}
<GGG>;
<GGG>;
while($tr=<GGG>)
{
	chomp($tr);
	@temp=();
	@temp=split(/\s+/,$tr);
	$ss[$temp[1]][1]=$temp[4];
	$ss[$temp[1]][2]=$temp[5];
	$ss[$temp[1]][3]=$temp[6];

}
close(GGG);



for($i=0;$i<100;$i++)
{
	print TTT "$ss[int($i*$note/100)][1],$ss[int($i*$note/100)][2],$ss[int($i*$note/100)][3],";
}






@solve=();
for($i=0;$i<$note;$i++)
{	
	$solve[$i]=0;
}
if(-e "$dir/exp.dat")
{
open(GGG,"$dir/exp.dat");
}
else{
open(GGG,"$dir/exp.dat");
}
<GGG>;
while($tr=<GGG>)
{
	chomp($tr);
	$tr=~s/^\s+|\s+$//g;
	@temp=();
	@temp=split(/\s+/,$tr);
	$temp[18]=0;
	if($temp[1]==0)
	{
		$solve[$temp[0]]=0.0;
	}
	else
	{
		for($l=1;$l<=17;$l++)
		{
			if($temp[$l]==1 and $temp[$l+1]==0)
			{$solve[$temp[0]]=$l*0.05;
				goto TRY;
			}
		}
	}
	TRY:;
	
}
close(GGG);

for($i=0;$i<100;$i++)
{
	print TTT "$solve[int($i*$note/100)],";
}

$loglength=log($note)/log(100);


$class=$conn/$note;

print TTT "$loglength,$class\n";
print "$note\n";


}
close(TTT);

`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $datadir/short.model -T $dir/final-contact.arff -p 0 >  $dir/ert-short`;

`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $datadir/medium.model -T $dir/final-contact.arff -p 0 >  $dir/ert-medium`;

`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $datadir/long.model -T $dir/final-contact.arff -p 0 >  $dir/ert-long`;






exit();
