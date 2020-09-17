
@short=();
@medium=();
@long=();

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
);
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

#@numbershort=`cat ~/NUMBER/result-short`;
#@numbermedium=`cat ~/NUMBER/result-medium`;
#@numberlong=`cat ~/NUMBER/result-long`;

#@numbershort=qw(
#0.242
#0.139
#0.361
#0.369
#0.262
#0.369
#0.357
#0.273
#0.106
#0.281
#0.178
#0.271
#0.298
#0.206
#0.223
#0.173
#0.4
#0.182
#0.348
#0.279
#0.373
#0.349
#0.433
#0.363
#0.39
#0.268
#0.282
#0.399
#0.252
#0.39
#0.298
#0.416
#0.367
#0.329
#0.374
#0.392
#0.182
#0.402
#0.331
#0.404
#0.209
#0.147
#0.231
#0.29
#0.294
#0.239
#0.268
#0.36
#0.26
#0.344
#0.337
#0.351
#0.277
#0.287
#0.255
#0.166
#0.412
#0.264
#0.188
#0.356
#0.201
#0.284
#0.189
#0.204
#0.399
#0.256
#0.31
#0.179
#0.312
#0.37
#0.445
#0.21
#0.397
#0.189
#0.238
#0.369
#0.337
#0.44
#0.212
#0.236
#0.266
#0.281
#0.193
#0.304
#0.361
#0.195
#0.15
#0.439
#0.345
#0.237
#0.391
#0.384
#0.41
#0.359
#0.348
#0.328
#0.405
#0.22
#);
#
#@numbermedium=qw(
#0.352
#0.193
#0.787
#0.419
#0.225
#0.655
#0.249
#0.37
#0.129
#0.348
#0.134
#0.572
#0.338
#0.3
#0.287
#0.242
#0.527
#0.235
#0.338
#0.317
#0.336
#0.674
#0.671
#0.455
#0.548
#0.243
#0.534
#0.38
#0.406
#0.55
#0.5659999999999999
#0.414
#0.433
#0.394
#0.476
#0.781
#0.22
#0.204
#0.535
#0.734
#0.162
#0.184
#0.036
#0.065
#0.376
#0.331
#0.493
#0.538
#0.404
#0.285
#0.526
#0.415
#0.611
#0.154
#0.339
#0.051
#0.752
#0.184
#0.219
#0.38
#0.189
#0.377
#0.191
#0.225
#0.542
#0.298
#0.357
#0.108
#0.249
#0.491
#0.468
#0.151
#0.424
#0.079
#0.111
#0.501
#0.697
#0.716
#0.166
#0.301
#0.11
#0.268
#0.305
#0.487
#0.643
#0.089
#0.113
#0.506
#0.406
#0.454
#0.65
#0.63
#0.446
#0.553
#0.519
#0.529
#0.792
#0.209
#);
#
#@numberlong=qw(
#0.8070000000000001
#0.544
#1.195
#1.133
#0.723
#1.209
#0.847
#0.727
#0.58
#0.8159999999999999
#0.728
#0.734
#1.099
#0.802
#0.702
#0.492
#1.15
#0.858
#1.204
#0.72
#1.112
#1.209
#1.205
#0.991
#1.237
#1.187
#1.24
#0.823
#0.78
#1.057
#0.983
#1.236
#0.945
#0.882
#1.114
#0.957
#0.803
#0.981
#0.967
#1.137
#0.723
#0.525
#0.471
#0.447
#1.045
#0.628
#1.175
#0.903
#0.835
#0.956
#1.215
#0.998
#0.864
#0.582
#0.713
#0.448
#1.181
#0.477
#0.49
#0.826
#0.494
#0.853
#0.556
#0.549
#1.095
#0.743
#0.715
#0.477
#0.8
#0.974
#1.286
#0.547
#1.35
#0.378
#0.6870000000000001
#0.88
#1.258
#0.9379999999999999
#0.673
#0.805
#0.48
#0.9409999999999999
#0.6909999999999999
#0.999
#1.308
#0.418
#0.511
#1.035
#1.014
#0.794
#0.923
#0.897
#0.875
#0.869
#1.406
#0.948
#1.204
#0.6870000000000001
#);



@fileList=qw(
!PDBNAME!
);
$count=0;
foreach $ss (@fileList)
{
chomp($ss);
##################################NUMBER######################################
$dir="!DIRNNBAYES!";
$mod1=`cat /nfs/amino-home/zhng/zhanglab_programs/QUARK_modified/NUMBER/runsta1.pl`;
$mod1=~s/\!PDBNAME\!/$ss/mg;
$mod1=~s/\!DIRNNBAYES\!/$dir/mg;
$jobname="$dir/FORcontactmap.pl";

    open(JOB,">$jobname");
    print JOB "$mod1\n";
    close(JOB);
 `chmod a+x $jobname`;
`perl $jobname`;



open(JOB,"$dir/ert-short");
<JOB>;
<JOB>;
<JOB>;
<JOB>;
<JOB>;
$line=<JOB>;
@temp=split(/\s+/,"$line");
$numbershort=$temp[3];
close(JOB);


open(JOB,"$dir/ert-medium");
<JOB>;
<JOB>;
<JOB>;
<JOB>;
<JOB>;
$line=<JOB>;
@temp=split(/\s+/,"$line");
$numbermedium=$temp[3];
close(JOB);

open(JOB,"$dir/ert-long");
<JOB>;
<JOB>;
<JOB>;
<JOB>;
<JOB>;
$line=<JOB>;
@temp=split(/\s+/,"$line");
$numberlong=$temp[3];
close(JOB);


















###########################################################################
print "$ss";
chomp($ss);
$tt="$ss";

$note=0;
open(WER,"$dir/seq.txt");
while($tyu=<WER>)
{
        chomp($tyu);
        $opo=length($tyu);
        if($opo>$note){$note=$opo;}

}
close(WER);
print "$tt	$note	";
#####################################################################################################
if($numberlong<0.5){$numberlong=0.75;}
$NUMBER=int($note*$numberlong);
print "$NUMBER ";
@contact1=();
@contact2=();
@contact3=();
$numbbetacon=0;
open(GGG, ">$dir/$ss-long");
open(TTT,"$dir/NN-BAYES$ss.map");

while($line=<TTT>)
{	
	chomp($line);
	@temp=();
	@temp=split(/\t+/,$line);
	if(($temp[1]-$temp[0])>24)
	{
		$contact1[$numbbetacon]=$temp[0];
		$contact2[$numbbetacon]=$temp[1];
		$contact3[$numbbetacon]=$temp[2];
		$numbbetacon++;
	}
}
close(TTT);
#print  "$numbbetacon	";
for($i=0;$i<$numbbetacon;$i++)
{

if($long[int($contact3[$i]/0.05)]>0.05)
{


	$alarm=0;
	for($j=0;$j<$numbbetacon;$j++)
	{
		if($contact3[$i]>$contact3[$j])
		{
			$alarm++;
		}
	}
	if($alarm==($numbbetacon-1))
	{
		$max=$contact3[$i];
	}
	elsif($alarm==($numbbetacon-$NUMBER))
	{
		$min=$contact3[$i];
	}
	
}
}
$maxlabel=$long[int($max/0.05)];
$minlabel=$long[int($min/0.05)];
for($i=0;$i<$numbbetacon;$i++)
{
        $alarm=0;
        for($j=0;$j<$numbbetacon;$j++)
        {
                if($contact3[$i]>$contact3[$j])
                {
                        $alarm++;
                }
        }
	if($alarm>=($numbbetacon-$NUMBER))
	{
	if($long[int($contact3[$i]/0.05)]>0.3)
	{
#	$temp1=(0.7-0.23)*$long[int($contact3[$i]/0.05)]/($maxlabel-$minlabel)+0.23-(0.7-0.23)*$minlabel/($maxlabel-$minlabel);	
		$temp1=(0.46-0.220)*$long[int($contact3[$i]/0.05)]/($maxlabel-$minlabel)+0.22-(0.46-0.22)*$minlabel/($maxlabel-$minlabel);
		print GGG "$contact1[$i]	$contact2[$i]	$temp1\n";
	}
	}
}
close(GGG);
###############################################################################################################




#####################################################################################################

$NUMBER=int($note*$numbermedium);
print "$NUMBER ";
########################################################################################################
@contact1=();
@contact2=();
@contact3=();
$numbbetacon=0;
open(GGG, ">$dir/$ss-medium");
open(TTT,"/$dir/NN-BAYES$ss.map");
#open(TTT,"/nfs/amino-home/baojihe/NEWDIS/record/$ss-medium-metainclude");
while($line=<TTT>)
{	
	chomp($line);
	@temp=();
	@temp=split(/\t+/,$line);
	if(($temp[1]-$temp[0])>11 and ($temp[1]-$temp[0])<=24)
	{
	$contact1[$numbbetacon]=$temp[0];
	$contact2[$numbbetacon]=$temp[1];
	$contact3[$numbbetacon]=$temp[2];
	$numbbetacon++;
	}
}
close(TTT);
#print "$numbbetacon ";
for($i=0;$i<$numbbetacon;$i++)
{
	
	$alarm=0;
	for($j=0;$j<$numbbetacon;$j++)
	{
		if($contact3[$i]>$contact3[$j])
		{
			$alarm++;
		}
	}
        if($alarm==($numbbetacon-1))
        {
                $max=$contact3[$i];
        }
        elsif($alarm==($numbbetacon-$NUMBER))
        {
                $min=$contact3[$i];
        }








#	if($alarm>=int($numbbetacon-0.2*$note))
#	{
#		print GGG "$contact1[$i]	$contact2[$i]	0.583\n";
#	}
#	elsif($alarm>=int($numbbetacon-0.3*$note))
#	{
#		print GGG "$contact1[$i]	$contact2[$i]	0.533\n";
#	}
#	elsif($alarm>=($numbbetacon-$NUMBER) and ($NUMBER<0.4*$note) and ($NUMBER>0.3*$note))
#	{
#		print GGG "$contact1[$i]	$contact2[$i]	0.484\n";
#	}
}
$maxlabel=$medium[int($max/0.05)];
$minlabel=$medium[int($min/0.05)];
#print "$maxlabel $minlabel";
for($i=0;$i<$numbbetacon;$i++)
{
        $alarm=0;
        for($j=0;$j<$numbbetacon;$j++)
        {
                if($contact3[$i]>$contact3[$j])
                {
                        $alarm++;
                }
        }

        if($alarm>=($numbbetacon-$NUMBER))
        {
        if($medium[int($contact3[$i]/0.05)]>0.4)
        {
	#	$temp1=(0.8-0.25)*$medium[int($contact3[$i]/0.05)]/($maxlabel-$minlabel)+0.25-(0.8-0.25)*$minlabel/($maxlabel-$minlabel);
                $temp1=(0.53-0.41)*$medium[int($contact3[$i]/0.05)]/($maxlabel-$minlabel)+0.41-(0.53-0.41)*$minlabel/($maxlabel-$minlabel);
                print GGG "$contact1[$i]	$contact2[$i]	$temp1\n";
        }
        }




#        if($alarm>=($numbbetacon-$NUMBER) and $maxlabel==$minlabel)
#        {
#                print GGG "$contact1[$i]	$contact2[$i]	0.50\n";
#        }
#	elsif($alarm>=($numbbetacon-$NUMBER) and $maxlabel!=$minlabel)
#	{
#		$temp1=(0.53-0.41)*$medium[int($contact3[$i]/0.05)]/($maxlabel-$minlabel)+0.41-(0.53-0.41)*$minlabel/($maxlabel-$minlabel);
#                print GGG "$contact1[$i]	$contact2[$i]	$temp1\n";
#	}
}




close(GGG);



###############################################################################################################





#####################################################################################################

$NUMBER=int($note*$numbershort);
print "$NUMBER\n";
########################################################################################################
@contact1=();
@contact2=();
@contact3=();
$numbbetacon=0;
open(GGG, ">$dir/$ss-short");
open(TTT,"$dir/NN-BAYES$ss.map");
#open(TTT,"/nfs/amino-home/baojihe/NEWDIS/record/$ss-short-metainclude");

while($line=<TTT>)
{	
	chomp($line);
	@temp=();
	@temp=split(/\t+/,$line);
if(($temp[1]-$temp[0])<=11)
{
	$contact1[$numbbetacon]=$temp[0];
	$contact2[$numbbetacon]=$temp[1];
	$contact3[$numbbetacon]=$temp[2];
	$numbbetacon++;
}	
}
close(TTT);
for($i=0;$i<$numbbetacon;$i++)
{
	$alarm=0;
	for($j=0;$j<$numbbetacon;$j++)
	{
		if($contact3[$i]>$contact3[$j])
		{
			$alarm++;
		}
	}
        if($alarm==($numbbetacon-1))
        {
                $max=$contact3[$i];
        }
        elsif($alarm==($numbbetacon-$NUMBER))
        {
                $min=$contact3[$i];
        }
#	if($alarm>=int($numbbetacon-0.2*$note))
#	{
#		print GGG "$contact1[$i]	$contact2[$i]	0.654\n";
#	}
#	elsif($alarm>=int($numbbetacon-0.3*$note))
#	{
#		print GGG "$contact1[$i]	$contact2[$i]	0.576\n";
#	}
#	elsif($alarm>=($numbbetacon-$NUMBER) and ($NUMBER<0.4*$note) and ($NUMBER>0.3*$note))
#	{
#		print GGG "$contact1[$i]	$contact2[$i]	0.501\n";
#	}
}
$maxlabel=$short[int($max/0.05)];
$minlabel=$short[int($min/0.05)];
for($i=0;$i<$numbbetacon;$i++)
{
        $alarm=0;
        for($j=0;$j<$numbbetacon;$j++)
        {
                if($contact3[$i]>$contact3[$j])
                {
                        $alarm++;
                }
        }


        if($alarm>=($numbbetacon-$NUMBER))
        {
        if($short[int($contact3[$i]/0.05)]>0.5)
        {
	#	$temp1=(0.85-0.25)*$short[int($contact3[$i]/0.05)]/($maxlabel-$minlabel)+0.25-(0.85-0.25)*$minlabel/($maxlabel-$minlabel);
                $temp1=(0.65-0.52)*$short[int($contact3[$i]/0.05)]/($maxlabel-$minlabel)+0.52-(0.65-0.52)*$minlabel/($maxlabel-$minlabel);
                print GGG "$contact1[$i]	$contact2[$i]	$temp1\n";
        }
        }





#        if($alarm>=($numbbetacon-$NUMBER) and $maxlabel!=$minlabel)
#        {
#                $temp1=(0.65-0.52)*$short[int($contact3[$i]/0.05)]/($maxlabel-$minlabel)+0.52-(0.65-0.52)*$minlabel/($maxlabel-$minlabel);
#                print GGG "$contact1[$i]	$contact2[$i]	$temp1\n";
#        }
#	elsif($alarm>=($numbbetacon-$NUMBER) and $maxlabel==$minlabel)
#	{
#		print GGG "$contact1[$i]	$contact2[$i]	0.55\n";
#	}
	
}


close(GGG);



###############################################################################################################









`cat $dir/$ss-short $dir/$ss-medium $dir/$ss-long>$dir/contact.map`;




#`mv /nfs/amino-home/baojihe/QUARK/$yy/seq.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/*seqfra.topse.bz2 /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/phi.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/protein.horiz /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/protein.ss2 /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/psitmp.chk /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/psi.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/pssm.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/rmsinp /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/seq.dat /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/seq.dat.ss /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/seqfra.ss2 /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/sol.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/topdh.topdh /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/turn.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/contact.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/homolist.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/homolistb.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/blast.out /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/cscore.txt /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/exp.dat /nfs/amino-home/baojihe/QUARK/$tt`;
#`mv /nfs/amino-home/baojihe/QUARK/$yy/contact.map /nfs/amino-home/baojihe/QUARK/$tt/contact.map`;
#`cp /nfs/amino-home/baojihe/QUARK/$yy/contact.map /nfs/amino-home/baojihe/QUARK/$tt/contact.map`;
$count++;
}
exit();
