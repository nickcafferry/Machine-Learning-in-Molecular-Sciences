#!/usr/bin/perl

###############################################################
# Usage:  NNBYES.pl 
#     1, this program must be run after metapsicov
#     2, all input/output files should be in the current directory
# input  (8 predictions)
#     seq.txt
#     protein.ss2
#     protein.solv
#     protein.colstats
#
#     betaconprotein.map
#     CCMpredprotein.map
#     freecontactprotein.map
#     meta-psicovstage2protein.map
#     psicovprotein.map
#     SPconprotein.map
#     SVMconprotein.map
#     svmseq.dat
# output
#     CA.contact    (CA contact)
#     CB.contact    (CA contact)
####################################################################

######################
$pwd=`pwd`;
chomp($pwd);
$rcddir=$pwd;
$s="protein";

################ 
$wekadir="/nfs/amino-library/contact/NEW/weka-3-7-12";

#############################
print "generate short bayes ......\n";
$bindir="/nfs/amino-home/zhng/pdbinput/contact/bin";
system("perl $bindir/runshortBAYES.pl $s $rcddir"); 

#########Medium BAYES --->
print "generate medm bayes ......\n";
system("perl $bindir/runmediumBAYES.pl $s $rcddir");

#######LONG BAYES ---->
print "generate long bayes ......\n";
system("perl $bindir/runlongBAYES.pl $s $rcddir"); #>longbayesprotein

######combine BAYES ---->
print "merge all bayes ......\n";
system("cat $rcddir/shortbayes$s $rcddir/mediumbayes$s $rcddir/longbayes$s > $rcddir/BAYES$s.map");

# i j probability



####################################CA part##########################################################
#################################################################################
###############################################
system("$bindir/preNN_yz.pl $s $rcddir");

######################### long ########################################################
open(TTT,">$rcddir/final-long.arff");
print TTT "\@relation ''\n";
for($i=1;$i<=716;$i++){
    print TTT "\@attribute 'feature$i' numeric\n";
}
print TTT "\@attribute 'class' {'bad','good'}\n";
print TTT "\@data\n";

open(GGG,"$rcddir/long-$s");
while($line=<GGG>){
    chomp($line);
    @temp=();
    @temp=split(/\s+/,$line);
    $alarm=0;
    for($i=1;$i<=716;$i++){
	@temp1=();
	@temp1=split(/:/,$temp[$i]);
	print TTT "$temp1[1],";
    }
    if($temp[0] eq "0"){
	print TTT "good\n";
    }else{
	print TTT "bad\n";
    }
}
close(GGG);
close(TTT);

########################## medm ########################################################
open(TTT,">$rcddir/final-medium.arff");
print TTT "\@relation ''\n";
for($i=1;$i<=716;$i++){
    print TTT "\@attribute 'feature$i' numeric\n";
}
print TTT "\@attribute 'class' {'bad','good'}\n";
print TTT "\@data\n";

open(GGG,"$rcddir/medium-$s");
while($line=<GGG>){
    chomp($line);
    @temp=();
    @temp=split(/\s+/,$line);
    $alarm=0;
    for($i=1;$i<=716;$i++){
	@temp1=();
	@temp1=split(/:/,$temp[$i]);
	print TTT "$temp1[1],";
    }
    if($temp[0] eq "0"){
	print TTT "good\n";
    }else{
	print TTT "bad\n";
    }
}
close(GGG);
close(TTT);

############################ short ##########################################################
open(TTT,">$rcddir/final-short.arff");
print TTT "\@relation ''\n";
for($i=1;$i<=716;$i++){
    print TTT "\@attribute 'feature$i' numeric\n";
}
print TTT "\@attribute 'class' {'bad','good'}\n";
print TTT "\@data\n";
open(GGG,"$rcddir/short-$s");
while($line=<GGG>){
    chomp($line);
    @temp=();
    @temp=split(/\s+/,$line);
    $alarm=0;
    for($i=1;$i<=716;$i++){
	@temp1=();
	@temp1=split(/:/,$temp[$i]);
	print TTT "$temp1[1],";
    }
    if($temp[0] eq "0"){
	print TTT "good\n";
    }else{
	print TTT "bad\n";
    }
}
close(GGG);
close(TTT);

print "1111111\n";
#####################################################################################
system("java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/finalshort-short-meta150hd.model -T $rcddir/final-short.arff -p 0 >  $rcddir/ert");
system("sed -i 1,5d $rcddir/ert");

@opo=`cat $rcddir/ert`;
open(YUI,">ppp1");
foreach $opr (@opo){
    chomp($opr);
    @temp=();
    @temp=split(/\s+/,$opr);
    if($temp[3] eq "2:good"){
	print YUI "$temp[5]\n";
    }elsif($temp[3] eq "1:bad"){
	$temp[4]=1-$temp[4];print YUI "$temp[4]\n";
    }
}
close(YUI);
system("paste $rcddir/label$s-short ppp1 > $rcddir/$s-short-NN-BAYES");
`sed -i "s/*//g" $rcddir/$s-short-NN-BAYES`;

print "1111111aaa\n";

system("java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/finalmedium-medium-metainclude150hd24.model -T $rcddir/final-medium.arff -p 0 >  $rcddir/ert");
system("sed -i 1,5d $rcddir/ert");
@opo=`cat $rcddir/ert`;
open(YUI,">ppp1");
foreach $opr (@opo){
    chomp($opr);
    @temp=();
    @temp=split(/\s+/,$opr);
    if($temp[3] eq "2:good"){
	print YUI "$temp[5]\n";
    }elsif($temp[3] eq "1:bad"){
	$temp[4]=1-$temp[4];print YUI "$temp[4]\n";
    }        
}
close(YUI);
system("paste $rcddir/label$s-medium ppp1 > $rcddir/$s-medium-NN-BAYES");
`sed -i "s/*//g" $rcddir/$s-medium-NN-BAYES`;

`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/finallong-long-metainclude150hd25.model -T $rcddir/final-long.arff -p 0 >  $rcddir/ert`;
`sed -i 1,5d $rcddir/ert`;
@opo=`cat $rcddir/ert`;
open(YUI,">ppp1");
foreach $opr (@opo){
    chomp($opr);
    @temp=();
    @temp=split(/\s+/,$opr);
    if($temp[3] eq "2:good"){
	print YUI "$temp[5]\n";
    }
    elsif($temp[3] eq "1:bad"){
	$temp[4]=1-$temp[4];print YUI "$temp[4]\n";
    }
}
close(YUI);
`paste $rcddir/label$s-long ppp1 > $rcddir/$s-long-NN-BAYES`;
`sed -i "s/*//g" $rcddir/$s-long-NN-BAYES`;

`cat $rcddir/$s-short-NN-BAYES $rcddir/$s-medium-NN-BAYES $rcddir/$s-long-NN-BAYES>$rcddir/NN-BAYES$s.map`;


print "1111111222\n";
####################################CB part##########################################################
#################################################################################
open(TTT,">$rcddir/final-long.arff");
print TTT "\@relation ''\n";
for($i=1;$i<=717;$i++){
    print TTT "\@attribute 'feature$i' numeric\n";
}
print TTT "\@attribute 'class' {'bad','good'}\n";
print TTT "\@data\n";

open(GGG,"$rcddir/long-$s");
while($line=<GGG>){
    chomp($line);
    @temp=();
    @temp=split(/\s+/,$line);
    $alarm=0;
    for($i=1;$i<=717;$i++){
	@temp1=();
	@temp1=split(/:/,$temp[$i]);
	print TTT "$temp1[1],";
    }
    if($temp[0] eq "0"){
	print TTT "good\n";
    }else{
	print TTT "bad\n";
    }
}
close(GGG);
close(TTT);

###################################################################################3
open(TTT,">$rcddir/final-medium.arff");
print TTT "\@relation ''\n";
for($i=1;$i<=717;$i++){
    print TTT "\@attribute 'feature$i' numeric\n";
}
print TTT "\@attribute 'class' {'bad','good'}\n";
print TTT "\@data\n";

open(GGG,"$rcddir/medium-$s");
while($line=<GGG>){
    chomp($line);
    @temp=();
    @temp=split(/\s+/,$line);
    $alarm=0;
    for($i=1;$i<=717;$i++){
	@temp1=();
	@temp1=split(/:/,$temp[$i]);
	print TTT "$temp1[1],";
    }
    if($temp[0] eq "0"){
	print TTT "good\n";
    }else{
	print TTT "bad\n";
    }
}
close(GGG);
close(TTT);

############################################################################################3
open(TTT,">$rcddir/final-short.arff");
print TTT "\@relation ''\n";
for($i=1;$i<=717;$i++){
    print TTT "\@attribute 'feature$i' numeric\n";
}
print TTT "\@attribute 'class' {'bad','good'}\n";
print TTT "\@data\n";

open(GGG,"$rcddir/short-$s");
while($line=<GGG>){
    chomp($line);
    @temp=();
    @temp=split(/\s+/,$line);
    $alarm=0;
    for($i=1;$i<=717;$i++){
	@temp1=();
	@temp1=split(/:/,$temp[$i]);
	print TTT "$temp1[1],";
    }
    if($temp[0] eq "0"){
	print TTT "good\n";
    }else{
	print TTT "bad\n";
    }
}
close(GGG);
close(TTT);


############################################################################################
`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/finalshort-metaincludeCB11.model -T $rcddir/final-short.arff -p 0 >  $rcddir/ert`;
`sed -i 1,5d $rcddir/ert`;

@opo=`cat $rcddir/ert`;
open(YUI,">ppp1");
foreach $opr (@opo){
    chomp($opr);
    @temp=();
    @temp=split(/\s+/,$opr);
    if($temp[3] eq "2:good"){
	print YUI "$temp[5]\n";
    }elsif($temp[3] eq "1:bad"){
	$temp[4]=1-$temp[4];print YUI "$temp[4]\n";
    }
}
close(YUI);
`paste $rcddir/label$s-short ppp1 > $rcddir/$s-short-CB-NN-BAYES`;
`sed -i "s/*//g" $rcddir/$s-short-CB-NN-BAYES`;

`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/finalmedium-metaincludeCB24.model -T $rcddir/final-medium.arff -p 0 >  $rcddir/ert`;
`sed -i 1,5d $rcddir/ert`;
@opo=`cat $rcddir/ert`;
open(YUI,">ppp1");
foreach $opr (@opo){
    chomp($opr);
    @temp=();
    @temp=split(/\s+/,$opr);
    if($temp[3] eq "2:good"){
	print YUI "$temp[5]\n";
    }elsif($temp[3] eq "1:bad"){
	$temp[4]=1-$temp[4];print YUI "$temp[4]\n";
    }
}
close(YUI);
`paste $rcddir/label$s-medium ppp1 > $rcddir/$s-medium-CB-NN-BAYES`;
`sed -i "s/*//g" $rcddir/$s-medium-CB-NN-BAYES`;

`java -cp $wekadir/weka.jar:$wekadir/NeuralNetwork/NeuralNetwork.jar:$wekadir/netlib-java-0.9.3.jar:$wekadir/mtj-0.9.14.jar:$wekadir/nd4j-netlib-blas-0.0.3.5.5.2.jar:$wekadir/netlib-java-0.9.3-sources.jar:$wekadir/blas-0.8.jar weka.classifiers.functions.NeuralNetwork -l $bindir/finallong-metaincludeCB25.model -T $rcddir/final-long.arff -p 0 >  $rcddir/ert`;
`sed -i 1,5d $rcddir/ert`;
@opo=`cat $rcddir/ert`;
open(YUI,">ppp1");
foreach $opr (@opo){
    chomp($opr);
    @temp=();
    @temp=split(/\s+/,$opr);
    if($temp[3] eq "2:good"){
	print YUI "$temp[5]\n";
    }elsif($temp[3] eq "1:bad"){
	$temp[4]=1-$temp[4];print YUI "$temp[4]\n";
    }
}
close(YUI);
`paste $rcddir/label$s-long ppp1 > $rcddir/$s-long-CB-NN-BAYES`;
`sed -i "s/*//g" $rcddir/$s-long-CB-NN-BAYES`;

`cat $rcddir/$s-short-CB-NN-BAYES $rcddir/$s-medium-CB-NN-BAYES $rcddir/$s-long-CB-NN-BAYES>$rcddir/NN-BAYES$s-CB.map`;

##############################################################################################
#########################################BETASTRANDS############################
`perl /nfs/amino-library/contact/NEW/NN-BAYES/BETASTRAND.pl $s $rcddir`;

################## sort contacts ####################
open(a,"NN-BAYES$s.map");
$n=0;
undef %conf;
while($line=<a>){
    if($line=~/(\d+)\s+(\d+)\s+(\S+)/){
	$n++;
	$I{$n}=$1;
	$J{$n}=$2;
	$conf{$n}=$3;
    }
}
close(a);
@conf_keys=sort{$conf{$b}<=>$conf{$a}} keys %conf;
open(b,">CA.contact");
print b "$n\n";
for($i=1;$i<=$n;$i++){
    $k=$conf_keys[$i-1];
    printf b "%5d %5d %8.3f\n",$I{$k},$J{$k},$conf{$k};
}
close(b);	

##############
open(a,"NN-BAYES$s-CB.map");
$n=0;
undef %conf;
while($line=<a>){
    if($line=~/(\d+)\s+(\d+)\s+(\S+)/){
	$n++;
	$I{$n}=$1;
	$J{$n}=$2;
	$conf{$n}=$3;
    }
}
close(a);
@conf_keys=sort{$conf{$b}<=>$conf{$a}} keys %conf;
open(b,">CB.contact");
print b "$n\n";
for($i=1;$i<=$n;$i++){
    $k=$conf_keys[$i-1];
    printf b "%5d %5d %8.3f\n",$I{$k},$J{$k},$conf{$k};
}
close(b);	

print "run_nnb.pl is complete <--------------------\n";

exit();
