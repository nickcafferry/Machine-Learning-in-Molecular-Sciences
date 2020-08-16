
#############################
# use: runshort.pl $s $recorddir
# input
#    $recorddir/seq.txt
#    $recorddir/betacon$s.map
#    $recorddir/
#    $recorddir/
#    $recorddir/
#    $recorddir/

#continues BAYES distribution for short range
#
#
#BETACON ------->
#x<=0.1
#y(x)=-0.00389756879431655+x*3.75195958801788+x*x* 32.3202537735203
#
#x<=0.3
#y(x)=0.6363059861212-3.72888494584414*x+ 48.5514853248378*x*x-34.649367071792*x*x*x
#
#x<=0.7
#
# a0+a1*x+a2*x^2+a3*x^3
#a0  = 6.94195680707792 
#a1  = -31.9158298802802
#a2  = 60.4510391472207 
#a3  = 4.60151683687695 
#
#Polynomial fit of dataset: Table1_5, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.701 to x = 0.88
#a0  = 734.641231431666 +/- 245.563264797785
#a1  = -1,972.4649311099 +/- 623.457664363598
#a2  = 1,355.6710715542 +/- 394.349360036877
#
#x>0.88
#y=100*x-40
#
#SVMcon ------->
#
#x<0.15
#y(x)=0
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.151 to x = 0.55
#a0  = 0.0264685165288823 +/- 0.127319472391968
#a1  = 0.00396791080036509 +/- 1.22475356734944
#a2  = -1.9022523845525 +/- 3.67594724270873
#a3  = 8.53321829712089 +/- 3.47976051668216
#
#
#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.551 to x = 0.85
#A (amplitude) = 0.00136774288353631 +/- 0.000644774565764597
#t (lifetime) = 0.0950875691679536 +/- 0.553009736766026
#y0 (offset) = 0.525066104401501 +/- 0.163297282227666
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.851 to x = 1.0
#a0  = 1,699.28161589656 +/- 2,121.1660930581
#a1  = -4,104.96199157424 +/- 4,742.5129587767
#a2  = 2,492.57014342203 +/- 2,649.07503142252
#
#
#
#
#
#SVMSEQ
#
#
#x<0.075
#y(x)=0
#
#
#
#
#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.076 to x = 0.119
#A (amplitude) = 0.112613899364766 +/- 0.063649987626575
#t (lifetime) = 0.0350323044962899 +/- 4.14735817155449
#y0 (offset) = -0.813494911946344 +/- 0.27897737926099
#
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.121 to x = 0.4
#a0  = 0.444192252325618 +/- 2.23699429139119
#a1  = 12.9346814664305 +/- 18.2546222414349
#a2  = 47.9714042127314 +/- 34.6844960356483
#
#
#
#
#
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.401 to x = 0.7
#a0  = -172.97848169189 +/- 70.7187749376936
#a1  = 630.487515706827 +/- 263.997362974811
#a2  = -452.495503555982 +/- 242.068604922378
#
#
#
#x>0.7
#
#y=47
#
#
#
#
#
#SPcon
#
#
#
#x<0.045
#y(x)=0
#
#
#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.046 to x = 0.15
#A (amplitude) = 0.0221941522002161 +/- 0.00501984308596627
#t (lifetime) = 0.0440311950399056 +/- 1.4309405120533
#y0 (offset) = -0.0678050554117862 +/- 0.0158437926549544
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.151 to x = 0.3
#a0  = -4.88834780973805 +/- 1.11648911284828
#a1  = 41.0185149927563 +/- 10.1532635669152
#a2  = -41.1018638562563 +/- 22.4302391351772
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.301 to x = 0.5
#a0  = 32.3419276702124 +/- 11.6349125455006
#a1  = -186.147012065984 +/- 58.9389051195271
#a2  = 316.968587454229 +/- 73.4292319496397
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.501 to x = 0.65
#a0  = -363.195129297271 +/- 611.986900851866
#a1  = 1,065.65084352036 +/- 2,135.20780612192
#a2  = -618.703852197497 +/- 1,854.04018803847
#
#
#
#x>0.65 
#
#
#y=70
#
#
#
#
#
#
#
#psicov
#
#
#
#Y standard errors: Unknown
#From x = 0.001 to x = 0.199
#B (y-intercept) = 0.252023846117594 +/- 0.0414264487625582
#A (slope) = 2.59505984905259 +/- 0.359721103185939
#
#
#Linear Regression fit of dataset: Table1_4, using function: A*x+B
#Y standard errors: Unknown
#From x = 0.2 to x = 0.3
#B (y-intercept) = -0.107658431178291 +/- 0.270617849731576
#A (slope) = 4.80567702610557 +/- 1.07637347899729
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.301 to x = 0.6
#a0  = 4.63836513767291 +/- 3.16757950256076
#a1  = -20.3877551658759 +/- 14.4260636200597
#a2  = 33.7000071309418 +/- 15.9586184513431
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.601 to x = 0.905
#a0  = 62.1219157745159 +/- 36.7227847248138
#a1  = -171.221377142444 +/- 98.4935218618701
#a2  = 129.958152506048 +/- 65.3325731156669


#ccmpred


#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.002 to x = 0.4
#a0  = 0.94288534696563 +/- 0.0509301956510523
#a1  = -0.673322429070218 +/- 1.09445213490676
#a2  = -4.88594800034327 +/- 6.31785346584081
#a3  = 29.606291654739 +/- 10.3322815043523



#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.402 to x = 0.6
#A (amplitude) = 0.0099911194770084 +/- 0.026461240890495
#t (lifetime) = 0.0960535098451115 +/- 4.24568564400124
#y0 (offset) = 1.18358230934204 +/- 0.873755344639322


#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.6 to x = 1.002
#a0  = -38.1808075224409 +/- 46.307634131781
#a1  = 97.1184210970579 +/- 117.988783553169
#a2  = -39.5697458986459 +/- 73.9691271678607

#evfold

#x<0.086
#y=0
#Linear Regression fit of dataset: Table1_4, using function: A*x+B
#Y standard errors: Unknown
#From x = 0.088 to x = 0.15
#B (y-intercept) = 0.686824201222051 +/- 0.180611933616279
#A (slope) = -0.844091115257036 +/- 1.49979703873549

#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.152 to x = 0.2
#A (amplitude) = 0.00917996107815535 +/- 0.00838695819747644
#t (lifetime) = 0.0358624961798678 +/- 4.22065181004944
#y0 (offset) = -0.0773881938674222 +/- 0.200861234779846

#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.202 to x = 0.3
#a0  = -9.86785035151232 +/- 10.99820405304
#a1  = 61.4345731183195 +/- 88.4417272567927
#a2  = -6.37802699995871 +/- 175.946535329818


#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.3 to x = 0.434
#a0  = 54.7050810949053 +/- 163.50486135775
#a1  = -316.144478858358 +/- 902.887188504307
#a2  = 530.19440255344 +/- 1,236.17812970252
#x>0.44
#y=4



###################################2014-12-6###################################################
###################################ZHANG LABS##################################################
####################################BAOJI HE###################################################
#!/usr/perl
$s=$ARGV[0];
$rcddir=$ARGV[1];
@lists=qw(
 $s
);
$uplimit=11;
$downlimit=6;
for($uiopp=0;$uiopp<1;$uiopp++){
    $line="$s";
    chomp($line);
    #print "$line";

    $note=30;
    open(WER,"$rcddir/seq.txt");
    while($tyu=<WER>){
        chomp($tyu);
        $opo=length($tyu);
        if($opo>$note){$note=$opo;}
	
    }
    close(WER);

    @pred=();
    for($k=0;$k<8;$k++){
        for($i=0;$i<=$note;$i++){
	    for($j=0;$j<=$note;$j++){
		$pred[$k][$i][$j]=0.0;
	    }
        }
    }

    ############################BETACON###################################################
    $pdbname="betacon$line.map";
    print "---> $rcddir/$pdbname\n";
    if(!-e "$rcddir/$pdbname"){print "WARNING!!!!!!!!!!!BETACON\n";}
    open(GGG,"$rcddir/$pdbname");
    
    $numbbetaconini=0;
    while($para1=<GGG>){
	chomp($para1);
	@temp=();
	@temp=split(/\s+/,$para1);
	$trleng=@temp;  
	
	if ($trleng>3){
	    $numbbetaconini++;
	    for($i=0;$i<$trleng;$i++){
		$pred[0][$numbbetaconini][$i+1]=$temp[$i];
	    }
	}
	
    }
    close(GGG);

    ##########################################svmcon ######################################
    $pdbname="SVMcon$line".".map";
    if(!-e "$rcddir/$pdbname"){print "WARNING!!!!!!!!!!!!!!!SVMcon\n";}
    open(GGG,"$rcddir/$pdbname");
    $numbsvmconini=0;
    while($para1=<GGG>){
	chomp($para1);
	$para1=~s/^\s+|\s+$//g;
	@temp=();
	@temp=split(/\s+/,$para1);
	if ($temp[2]==0 && $temp[3]==8){
	    $pred[1][$temp[0]][$temp[1]]=$temp[4];
	    $pred[1][$temp[1]][$temp[0]]=$temp[4];
	}
	
    }
    close(GGG);

    #############################################svmseq test######################################
    $pdbname="svmseq.dat";
    if(!-e "$rcddir/$pdbname"){print "$line	!!!!!!!!!!!!!!WARNING!!!!!!!!!!!!!!!!!!!!!!!SVMSEQn!\n";}
    open(GGG,"$rcddir/$pdbname");
    <GGG>;
    $numbsvmseqini=0;
    while($para1=<GGG>){
	chomp($para1);
	$para1=~s/^\s+|\s+$//g;
	@temp=();
	@temp=split(/\s+/,$para1);
	$ee=@temp;
	$pred[2][$temp[0]][$temp[1]]=$temp[2];
	$pred[2][$temp[1]][$temp[0]]=$temp[2];
    }
    close(GGG);
    
    ###########################################spcon test######################################
    $pdbname="SPcon$line.map";
    if(! -e "$rcddir/$pdbname"){print "WARNING!!!!!!!!!!!!!!SPCON\n";}
    open(GGG,"$rcddir/$pdbname");
    $numbspconini=0;
    while($para1=<GGG>){
	chomp($para1);
	$para1=~s/^\s+|\s+$//g;
	@temp=();
	@temp=split(/\t+/,$para1);
	$pred[3][$temp[0]][$temp[1]]=$temp[2];
	$pred[3][$temp[1]][$temp[0]]=$temp[2];
    }
    close(GGG);

    #############################psicov#########E#################################################
    $pdbname="psicov$line.map";
    if(! -e "$rcddir/$pdbname"){print "$line	WARNING!!!!!!!!!!!!!!!!!!!!!!!!PSICOV\n";}
    open(GGG,"$rcddir/$pdbname");
    $numbpsicovini=0;
    while($para1=<GGG>){
	chomp($para1);
	$para1=~s/^\s+|\s+$//g;
	@temp=();
	@temp=split(/\s+/,$para1);
	$trleng=@temp;
	if($trleng>1){
	    $pred[4][$temp[0]][$temp[1]]=$temp[2];
	    $pred[4][$temp[1]][$temp[0]]=$temp[2];
	}
    }
    close(GGG);
    
    #############################ccmpred#########E#################################################
    $pdbname="CCMpred$line.map";
    if(!-e "$rcddir/$pdbname"){print "WARNING!!!!!!!!!!!BETACON\n";}
    open(GGG,"$rcddir/$pdbname");
    $numbbetaconini=0;
    while($para1=<GGG>){
	chomp($para1);
	@temp=();
	@temp=split(/\t+/,$para1);
	$trleng=@temp;  
	if ($trleng>3){
	    $numbbetaconini++;
	    for($i=0;$i<$trleng;$i++){
		$pred[5][$numbbetaconini][$i+1]=$temp[$i];
	    }
	}
    }
    close(GGG);

    ############################################evfold#####################################################
    $pdbname="freecontact$line.map";
    if(! -e "$rcddir/$pdbname"){print "$line	WARNING!!!!!!!!!!!!!!!!!!!!!!!!PSICOV\n";}
    open(GGG,"$rcddir/$pdbname");
    $numbpsicovini=0;
    while($para1=<GGG>){
	chomp($para1);
	$para1=~s/^\s+|\s+$//g;
	@temp=();
	@temp=split(/\s+/,$para1);
	$trleng=@temp;
	if($trleng>1)
	{
	    $pred[6][$temp[0]][$temp[2]]=$temp[5];
	    $pred[6][$temp[2]][$temp[0]]=$temp[5];
	}
    }
    close(GGG);

    ##################################meta######################################33
    $pdbname="meta-psicovstage2$line.map";
    if(! -e "$rcddir/$pdbname"){print "$line  WARNING!!!!!!!!!!!!!!!!!!!!!!!!PSICOV\n";}
    open(GGG,"$rcddir/$pdbname");
    $numbpsicovini=0;
    while($para1=<GGG>){
	chomp($para1);
	$para1=~s/^\s+|\s+$//g;
	@temp=();
	@temp=split(/\s+/,$para1);
	$trleng=@temp;
	if($temp[2]==0 and $temp[3]==8){
	    $pred[7][$temp[0]][$temp[1]]=$temp[4];
	    $pred[7][$temp[1]][$temp[0]]=$temp[4];
	}
    }
    close(GGG);
    
    ########################################################big matrix####################################
    #betacon:0;;svmcon:1;svmseq:2;spcon:3; psicov 4

    ###########################################iTRAIN#######################################################e
    open(WWW,">$rcddir/shortbayes$s");
    for($i=1;$i<=$note;$i++){
	for($j=$i+1;$j<=$note;$j++){
	    if(($j-$i)>=$downlimit and($j-$i)<=$uplimit){ 
		##ith jth  con non
		$temp=0.099441346*svmseq($pred[2][$i][$j])*spcon($pred[3][$i][$j])*psicov($pred[4][$i][$j])*ccmpred($pred[5][$i][$j])*evfold($pred[6][$i][$j])*meta($pred[7][$i][$j])/0.900558654;
		$temp=1-1/($temp+1);
		if($temp>1){
		    print "WRONG";
		}
		$rt1=betacon($pred[0][$i][$j]);
		$rt2=svmcon($pred[1][$i][$j]);
		$rt3=svmseq($pred[2][$i][$j]);
		$rt4=spcon($pred[3][$i][$j]);
		$rt5=psicov($pred[4][$i][$j]);
		print WWW "$i	$j	$temp\n";
	    }
	}
    }
    close(WWW);
}
exit();

#*betacon($pred[0][$i][$j])*svmcon($pred[1][$i][$j]) !!! Turn this on after betacon and svmcon test


sub betacon{
@listmp=@_;
$number=$listmp[0];
#BETACON
#x<=0.1
#y(x)=-0.00389756879431655+x*3.75195958801788+x*x* 32.3202537735203
#
#x<=0.3
#y(x)=0.6363059861212-3.72888494584414*x+ 48.5514853248378*x*x-34.649367071792*x*x*x
#
#
#x<=0.7
#
# a0+a1*x+a2*x^2+a3*x^3
#a0  = 6.94195680707792 
#a1  = -31.9158298802802
#a2  = 60.4510391472207 
#a3  = 4.60151683687695 
#
#
#Polynomial fit of dataset: Table1_5, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.701 to x = 0.88
#a0  = 734.641231431666 +/- 245.563264797785
#a1  = -1,972.4649311099 +/- 623.457664363598
#a2  = 1,355.6710715542 +/- 394.349360036877
#
#
#
#
#x>0.88
#
#y=100*x-40
#
if($number<0.1)
{
	$temp1=-0.00389756879431655+$number*3.75195958801788+$number*$number*32.3202537735203;
}
elsif($number>=0.1 and $number<=0.3)
{
	$temp1=0.6363059861212-3.72888494584414*$number+48.5514853248378*$number*$number-34.649367071792*$number*$number*$number;
}
elsif($number>0.3 and $number<0.7)
{
	$temp1=6.94195680707792-31.9158298802802*$number+60.4510391472207*$number*$number+4.60151683687695*$number*$number*$number;
}
elsif($number>=0.7 and $number<=0.88)
{
	$temp1=734.641231431666-1972.4649311099*$number+1355.67107*$number*$number;
}
else
{	
	$temp1=100*$number-40;
}
return $temp1
}
#################################################################################################
sub svmcon{
@listmp=@_;
$number=$listmp[0];
#svmcon


#x<0.15
#
#
#y(x)=0
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.151 to x = 0.55
#a0  = 0.0264685165288823 +/- 0.127319472391968
#a1  = 0.00396791080036509 +/- 1.22475356734944
#a2  = -1.9022523845525 +/- 3.67594724270873
#a3  = 8.53321829712089 +/- 3.47976051668216
#
#
#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.551 to x = 0.85
#A (amplitude) = 0.00136774288353631 +/- 0.000644774565764597
#t (lifetime) = 0.0950875691679536 +/- 0.553009736766026
#y0 (offset) = 0.525066104401501 +/- 0.163297282227666
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.851 to x = 1.0
#a0  = 1,699.28161589656 +/- 2,121.1660930581
#a1  = -4,104.96199157424 +/- 4,742.5129587767
#a2  = 2,492.57014342203 +/- 2,649.07503142252
#
if($number<=0.15)
{
	$temp1=0.0;
}
elsif($number>0.15 and $number<=0.55)
{
	$temp1=0.0264685165288823+0.00396791080036509*$number-1.9022523845525*$number*$number+8.53321829712089*$number*$number*$number;
}
elsif($number>0.55 and $number<0.85)
{
	$temp1=0.525066+0.0013677429*exp($number/0.095088);
}
elsif($number>=0.85 and $number<=1.0)
{
	$temp1=1699.28161589656-4104.96199157424*$number+2492.57014*$number*$number;
}

return $temp1
}
##################################################################################################


sub svmseq{
@listmp=@_;
$number=$listmp[0];
#
#SVMseq
#
#x<0.075
#y(x)=0
#
#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.076 to x = 0.119
#A (amplitude) = 0.112613899364766 +/- 0.063649987626575
#t (lifetime) = 0.0350323044962899 +/- 4.14735817155449
#y0 (offset) = -0.813494911946344 +/- 0.27897737926099
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.121 to x = 0.4
#a0  = 0.444192252325618 +/- 2.23699429139119
#a1  = 12.9346814664305 +/- 18.2546222414349
#a2  = 47.9714042127314 +/- 34.6844960356483
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.401 to x = 0.7
#a0  = -172.97848169189 +/- 70.7187749376936
#a1  = 630.487515706827 +/- 263.997362974811
#a2  = -452.495503555982 +/- 242.068604922378
#
#
#
#x>0.7
#
#y=47
#
if($number<=0.075)
{
	$temp1=0.0;
}
elsif($number>0.075 and $number<0.12)
{
	$temp1=-0.813494911946344+0.112613899364766*exp($number/0.0350323044962899);
}
elsif($number>=0.12 and $number <=0.4)
{
	$temp1=0.444192252325618+12.9346814664305*$number+47.9714042127314*$number*$number;
}
elsif($number>0.4 and $number<=0.45)
{
	$temp1=20*$number+6;
}
elsif($number>0.45 and $number <=0.7)
{
	$temp1=1664.37-6767.177*$number+6876.737*$number*$number+189.727*$number*$number*$number;
}
else
{
	$temp1=360;
}
return $temp1
}
###############################################################################################
sub spcon{
@listmp=@_;
$number=$listmp[0];
#SPcon
#
#
#
#x<0.045
#y(x)=0
#
#
#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.046 to x = 0.15
#A (amplitude) = 0.0221941522002161 +/- 0.00501984308596627
#t (lifetime) = 0.0440311950399056 +/- 1.4309405120533
#y0 (offset) = -0.0678050554117862 +/- 0.0158437926549544
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.151 to x = 0.3
#a0  = -4.88834780973805 +/- 1.11648911284828
#a1  = 41.0185149927563 +/- 10.1532635669152
#a2  = -41.1018638562563 +/- 22.4302391351772
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.301 to x = 0.5
#a0  = 32.3419276702124 +/- 11.6349125455006
#a1  = -186.147012065984 +/- 58.9389051195271
#a2  = 316.968587454229 +/- 73.4292319496397
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.501 to x = 0.65
#a0  = -363.195129297271 +/- 611.986900851866
#a1  = 1,065.65084352036 +/- 2,135.20780612192
#a2  = -618.703852197497 +/- 1,854.04018803847
#
#
#
#x>0.65 
#
#
#y=70
#
#
#
#
if($number<0.045)
{
	$temp1=0.0;
}
elsif($number>=0.045 and $number <0.13)
{
	$temp1=-0.0678050554117862+0.0221941522002161*exp($number/0.0440311950399056);
}
elsif($number>=0.13 and $number<0.3)
{
	$temp1=6.3905-114.1222*$number+653.5775*$number*$number-1015.7993*$number*$number*$number;
}
elsif($number>=0.3 and $number<=0.5)
{
	$temp1=32.3419276702124-186.147012065984*$number+316.968587454229*$number*$number;
}
elsif($number>0.5 and $number<=0.65)
{
	$temp1=-363.195129297271+1065.65084352036*$number-618.703852197497*$number*$number;
}
else
{
	$temp1=70;
}
return $temp1
}
#######################################################################################################

sub psicov{
@listmp=@_;
$number=$listmp[0];
#
#PSICOV
#
#psicov
#
#
#Linear Regression fit of dataset: Table1_4, using function: A*x+B
#Y standard errors: Unknown
#From x = 0.001 to x = 0.199
#B (y-intercept) = 0.252023846117594 +/- 0.0414264487625582
#A (slope) = 2.59505984905259 +/- 0.359721103185939
#
#
#Linear Regression fit of dataset: Table1_4, using function: A*x+B
#Y standard errors: Unknown
#From x = 0.2 to x = 0.3
#B (y-intercept) = -0.107658431178291 +/- 0.270617849731576
#A (slope) = 4.80567702610557 +/- 1.07637347899729
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.301 to x = 0.6
#a0  = 4.63836513767291 +/- 3.16757950256076
#a1  = -20.3877551658759 +/- 14.4260636200597
#a2  = 33.7000071309418 +/- 15.9586184513431
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.601 to x = 0.905
#a0  = 62.1219157745159 +/- 36.7227847248138
#a1  = -171.221377142444 +/- 98.4935218618701
#a2  = 129.958152506048 +/- 65.3325731156669

if($number<0.2)
{
	$temp1=2.59505984905259*$number+0.252023846117594;
}
elsif($number>=0.2 and $number<0.3)
{
	$temp1=-0.107658431178291+4.80567702610557*$number;
}
elsif($number>=0.3 and $number<=0.6)
{
	$temp1=4.63836513767291-20.3877551658759*$number+33.7000071309418*$number*$number;
}
elsif($number>0.6)
{
	$temp1=-524.352+2190.809*$number-3016.4502*$number*$number+1384.423*$number*$number*$number;
}


return $temp1
}




#######################################################################################################

sub ccmpred{
@listmp=@_;
$number=$listmp[0];
#
#ccmpred


#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.002 to x = 0.4
#a0  = 0.94288534696563 +/- 0.0509301956510523
#a1  = -0.673322429070218 +/- 1.09445213490676
#a2  = -4.88594800034327 +/- 6.31785346584081
#a3  = 29.606291654739 +/- 10.3322815043523



#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.402 to x = 0.6
#A (amplitude) = 0.0099911194770084 +/- 0.026461240890495
#t (lifetime) = 0.0960535098451115 +/- 4.24568564400124
#y0 (offset) = 1.18358230934204 +/- 0.873755344639322


#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.6 to x = 1.002
#a0  = -38.1808075224409 +/- 46.307634131781
#a1  = 97.1184210970579 +/- 117.988783553169
#a2  = -39.5697458986459 +/- 73.9691271678607


if($number<=0.4)
{
	$temp1=0.94288534696563-0.673322429070218*$number-4.88594800034327*$number*$number+29.606291654739*$number*$number*$number;
}
elsif($number<0.6)
{
	$temp1=1.18358230934204+0.0099911194770084*exp($number/0.0960535098451115);
}
elsif($number>=0.6)
{
	$temp1=-38.1808075224409+97.1184210970579*$number-39.5697458986459*$number*$number;
}


return $temp1
}




####################################################################################################################
sub evfold{
@listmp=@_;
$number=$listmp[0];
$number=(0.0625*$number+0.15625);
if($number>1){$number=1;}
if($number<0){$number=0;}

#


#evfold

#evfold

#x<0.086
#y=0
#Linear Regression fit of dataset: Table1_4, using function: A*x+B
#Y standard errors: Unknown
#From x = 0.088 to x = 0.15
#B (y-intercept) = 0.686824201222051 +/- 0.180611933616279
#A (slope) = -0.844091115257036 +/- 1.49979703873549

#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.152 to x = 0.2
#A (amplitude) = 0.00917996107815535 +/- 0.00838695819747644
#t (lifetime) = 0.0358624961798678 +/- 4.22065181004944
#y0 (offset) = -0.0773881938674222 +/- 0.200861234779846

#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.202 to x = 0.3
#a0  = -9.86785035151232 +/- 10.99820405304
#a1  = 61.4345731183195 +/- 88.4417272567927
#a2  = -6.37802699995871 +/- 175.946535329818


#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.3 to x = 0.434
#a0  = 54.7050810949053 +/- 163.50486135775
#a1  = -316.144478858358 +/- 902.887188504307
#a2  = 530.19440255344 +/- 1,236.17812970252

#x>0.44
#y=4
if($number<0.086)
{
	$temp1=0;
}
elsif($number<0.15)
{
	$temp1=0.686824201222051-0.844091115257036*$number;
}
elsif($number>=0.15 and $number<=0.2)
{
	$temp1=-0.0773881938674222+0.00917996107815535*exp($number/0.0358624961798678);
}
elsif($number<0.3)
{
	$temp1=-9.86785035151232+61.4345731183195*$number-6.37802699995871*$number*$number;
}
elsif($number<0.434)
{
	$temp1=54.7050810949053-316.144478858358*$number+530.19440255344*$number*$number;
}
else
{
	$temp1=4;
}


return $temp1
}






















#

#############################################################333
sub meta{
@listmp=@_;
$number=$listmp[0];
#x<0.3
#Y=0.14438+11.40397*x+33.07645*x*x
#x<0.7 and x>0.3
#Y=27.1887-126.690735*x+209.7388*x*x
#x>0.7
#Y=1511.5763-3944.4639+2664.484*x*x
if($number<0.3)
{
	$temp1=0.14438+11.40397*$number+33.07645*$number*$number;
}
elsif($number>=0.3 and $number<0.7)
{
	$temp1=27.1887-126.690735*$number+209.7388*$number*$number;
}
elsif($number>=0.7)
{
	$temp1=1511.5763-3944.4639*$number+2664.484*$number*$number;
}



return $temp1;
}
