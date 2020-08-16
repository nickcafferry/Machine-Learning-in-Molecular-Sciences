#!/usr/bin/perl

####################################################################
# this program is to convert contact predictions to QUARK_format.
# (from /nfs/amino-home/zhng/zhanglab_programs/QUARK_modified/NUMBER/number.pl)
#
# usage:
# >contact_quark.pl $dir/svmseq.dat $dir/seq.dat.ss $dir/exp.dat $dir/svmseq.dat.quark
#
# input:
#   $inputdir/svmseq.dat 
#   $inputdir/seq.dat.ss 
#   $inputdir/exp.dat 
#
# output:
#   $outputdir/svmseq.dat.quark
####################################################################

$cont_ori=$ARGV[0];   #original contact file 
$seqdatss=$ARGV[1];   #seq.dat.ss
$expdat=$ARGV[2];     #exp.dat
$cont_quark=$ARGV[3]; #output contact file

for($i=0;$i<=2;$i++){
    if(!-s "$ARGV[$i]"){
	print "error: without $ARGV[$i]\n";
	exit();
    }
}

################# directories #############################
$random=int(10000000000*rand);
#$random=12345;
$work_dir="/tmp/zhng/$random";
`/bin/rm -fr $work_dir`;
`/bin/mkdir -p $work_dir`;
chdir "$work_dir";

system("cp $cont_ori contact.map.ori");
system("cp $seqdatss seq.dat.ss");
system("cp $expdat   exp.dat");

@short=qw(
0.00541338582677165
0.0829825616355983
0.136125654450262
0.155737704918033
0.246786632390745
0.287719298245614
0.389830508474576
0.467289719626168
0.548022598870056
0.591194968553459
0.566176470588235
0.635593220338983
0.66412213740458
0.798561151079137
0.833333333333333
0.872093023255814
0.829787234042553
0.936708860759494
0.9375
0.75
); # $short[$i] is the prediced accuracy at each give bin i, conf{i}

@medium=qw(
0.00496048715404878
0.0733486943164363
0.138540899042004
0.193548387096774
0.292207792207792
0.351598173515982
0.425714285714286
0.481781376518219
0.582329317269076
0.609625668449198
0.622754491017964
0.725352112676056
0.780487804878049
0.752
0.855555555555556
0.814814814814815
0.902439024390244
0.826923076923077
0.975609756097561
1
);

@long=qw(
0.00403667608557753
0.0148478337555719
0.0226780297558862
0.0424104317002152
0.0696963076250819
0.10062893081761
0.125246548323471
0.155511811023622
0.195744680851064
0.249208025343189
0.283505154639175
0.336336336336336
0.367741935483871
0.439703153988868
0.486486486486487
0.566532258064516
0.626728110599078
0.698717948717949
0.777580071174377
0.925981873111782
);


############### estimate number in each range ---------------->
print "predict n_contact ..........\n";
system("/nfs/amino-home/zhng/pdbinput/contact/bin/pred_length.pl $work_dir");

@ranges=qw(
    long

    short
    medium
  );

print "merge contact from different ranges \n";
foreach $range(@ranges){
    open(JOB,"ert-$range");
    while($line=<JOB>){
	if($line=~/(\d+)\s+(\d+)\s+(\S+)\s+(\S+)/){
	    print "$line";
	    $r{$range}=$3;
	}
    }
    close(JOB);
}
if($r{long}<0.5){
    $r{long}=0.75;
}
print "n/L(short,medm,long)=: $r{short}, $r{medium}, $r{long}\n";
#exit();

############# get Lch #########################################################
open(GGG,"seq.dat.ss");
$Lch=0;
while($line=<GGG>){
    if($line=~/(\d+)\s+(\S)\s+(\S)\s+(\S+)\s+(\S+)\s+(\S+)/){
	$Lch++;
    }
}
close(GGG);

############## long contact ##################################################
foreach $range(@ranges){
    $n_range_pred=int($Lch*$r{$range});
    print "--------range=$range, n_$range=$n_range_pred--------\n";
    
    ######## conf_max, conf_min ------------>
    undef %con;
    $n_range_tot=0;
    open(TTT,"contact.map.ori");
    open(GGG, ">contact.map.$range");
    while($line=<TTT>){	
	if($line=~/(\d+)\s+(\d+)\s+(\S+)/){
	    $ii=$1;
	    $jj=$2;
	    $conf1=$3;
	    $co=abs($ii-$jj);
	    if($co>24){
		$range0="long";
	    }elsif($co>11){
		$range0="medium";
	    }else{
		$range0="short";
	    }
	    if($range0 eq $range){
		$I[$n_range_tot]=$ii;
		$J[$n_range_tot]=$jj;
		$conf[$n_range_tot]=$conf1;
		$n_range_tot++;
		
		$con{$n_range_tot}=$conf1;
	    }
	}
    }
    if($n_range_pred>$n_range_tot){
	$n_range_pred=$n_range_tot;
    }
    @con_keys=sort{$con{$b}<=>$con{$a}} keys %con;
    
    $k=$con_keys[0];
    $max=$con{$k};
    $k=$con_keys[$n_range_pred-1];
    $min=$con{$k};

    print "conf_max=$max, conf_min=$min\n";
    
    ######## acc_max, acc_min ------------>
    if($range eq "long"){
	$maxlabel=$long[int($max/0.05)]; #maximum accuracy
	$minlabel=$long[int($min/0.05)]; #minimum accuracy
    }elsif($range eq "medium"){
	$maxlabel=$medium[int($max/0.05)];
	$minlabel=$medium[int($min/0.05)];
    }else{
	$maxlabel=$short[int($max/0.05)];
	$minlabel=$short[int($min/0.05)];
    }
    print "acc_max=$maxlabel, acc_min=$minlabel\n";
    
    ############################################
    #                    acc-acc_min           #
    # conf2=(0.46-0.22)----------------- -0.22 #
    #                   acc_max-acc_min        #
    ############################################
    for($i=0;$i<$n_range_tot;$i++){
	if($conf[$i]>=$min){
	    $conf2=-1;
	    if($range eq "long" && $long[int($conf[$i]/0.05)]>0.3){
		$conf2=(0.46-0.22)*($long[int($conf[$i]/0.05)]-$minlabel)/($maxlabel-$minlabel)+0.22;
	    }elsif($range eq "medium" && $medium[int($conf[$i]/0.05)]>0.4){
		$conf2=(0.53-0.41)*($medium[int($conf[$i]/0.05)]-$minlabel)/($maxlabel-$minlabel)+0.41;
	    }elsif($range eq "short" && $short[int($conf[$i]/0.05)]>0.5){
		$conf2=(0.65-0.52)*($short[int($conf[$i]/0.05)]-$minlabel)/($maxlabel-$minlabel)+0.52;
	    }
	    if($conf2>0){
		print GGG "$I[$i]	$J[$i]	$conf2\n";
	    }
	}
    }
    close(TTT);
    close(GGG);
}
print "QUARK_convert is done!\n";

####################### merge all contact ranges ######################################
`cat contact.map.short contact.map.medium contact.map.long > contact.map`;
#`cat contact.map.short contact.map.medium contact.map.long |sort -k 3 -n -r > contact.map`;

system("cp contact.map $cont_quark");

#exit();
`rm -fr $work_dir`;
exit();
