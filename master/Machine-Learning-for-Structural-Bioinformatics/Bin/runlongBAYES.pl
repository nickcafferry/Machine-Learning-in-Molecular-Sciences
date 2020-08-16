##continues bayes distribution
#
#CCMPRED
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.0 to x = 0.2
#a0  = 0.896255057728973 +/- 0.0164692984104598
#a1  = -2.35586366717141 +/- 0.367774494222598
#a2  = 10.8082746909714 +/- 1.73378265080083
#
#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.202 to x = 0.5
#A (amplitude) = 0.0872384216351662 +/- 0.0301178341194828
#t (lifetime) = 0.10474205156979 +/- 0.678519825003485
#y0 (offset) = 0.316211200747219 +/- 0.23769953903516
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.502 to x = 1.002
#a0  = -83.9948065233891 +/- 278.259483142488
#a1  = 220.663365089953 +/- 1,152.84139272144
#a2  = -58.9457584517951 +/- 1,560.0321683778
#a3  = -12.8330164204775 +/- 690.405851626323
#
#PSICOV
#
#
#X=0 to X=0.1
#divided function
#y0+A*exp(x/t)
#y0=0.275255
#A=0.12037
#t=0.03859
#
#X=0.1 to X=0.5
#
#a+b*x+c*x^2+d*x^3
#a=3.3419
#b=-33.76
#c=223.007
#d=-103.94
#
#From X=0.5 to X=0.905
#
#divided function a+b*x+c*x^2+d*x^3
#a=-429.809
#b=1888.286
#c=-2587.17446
#d=1274.5397
#
#X>0.905
#divide =140
#
#
#evfold
#
#x<0.05
#y=0
#x<0.15
#y=0.4
#x<0.25
#Gauss fit of dataset: Table1_4, using function: y0+A*sqrt(2/PI)/w*exp(-2*((x-xc)/w)^2)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.152 to x = 0.25
#A (amplitude) = 2.0786933806688 +/- 0.474414897316957
#xc (center) = 0.258438742369294 +/- 0.00768982508900604
#w (width) = 0.0784753124308227 +/- 0.0109183115346599
#y0 (offset) = -0.0207423137044649 +/- 0.768555689304271
#
#x<0.4
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.252 to x = 0.408
#a0  = -792.361340751585 +/- 635.950822960975
#a1  = 7,672.79021972537 +/- 5,893.12403805539
#a2  = -23,714.7979820719 +/- 18,019.267411448
#a3  = 24,150.6205662205 +/- 18,186.4184178161
#
#
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.402 to x = 0.502
#a0  = -21,775.1734636286 +/- 31,381.6950215688
#a1  = 145,373.355816504 +/- 209,934.343378197
#a2  = -321,967.9394427 +/- 467,071.067132062
#a3  = 237,037.269411006 +/- 345,596.407688223
#
#
#
#x>0.5
#y=10.5
###################################2014-12-6###################################################
###################################ZHANG LABS##################################################
####################################BAOJI HE###################################################
#!/usr/perl
$s=$ARGV[0];
$rcddir=$ARGV[1];
@lists=qw($s);
$uplimit=2300000;
$downlimit=25;
#foreach $line (@lists)
for($uiopp=0;$uiopp<1;$uiopp++)
{
	$line="$s";
	chomp($line);
	#print "$line";
##################################NATIVE######################################
#$pdbname=lc(substr($line,0,4)).uc(substr($line,4,1)).".pdb";
#$pdbname="$line".".pdb";
#if(!-e "$PDBdir/$pdbname"){$pdbname=substr($line,0,5)."_".substr($line,6,1).".atm";}
#@NW=`~/bin/NWalign ~/betacon/data/$line.dat $PDBdir/$pdbname 2`;
#$NWline=@NW;
#$seq=$NW[$NWline-5];
#$cors=$NW[$NWline-4];
#$pdb=$NW[$NWline-3];
#$note=0;
#@label=();
##print "$seq";
##print "$cors";
##print "$pdb";
#$len1=length($seq);
##print "$len1\n";
#for($i=1;$i<$len1;$i++)
#{
#        if(substr($seq,$i-1,1)==substr($pdb,$i-1,1) and (substr($cors,$i-1,1) eq ":"))
#                {
#                                $label[$note]=$i;
#                                $note++;
#                          #               print "$i";
#                 }
#}
#$lenlabel=@label;
#
#
#        @pdbcorrx=();
#        @pdbcorry=();
#        @pdbcorrz=();
#        @countca=();
#        $paraca="CA";
#     #   $pdbname=lc(substr($line,0,4)).uc(substr($line,4,1)).".pdb";
#$pdbname="$line".".pdb";
#if(!-e "$PDBdir/$pdbname"){$pdbname=substr($line,0,5)."_".substr($line,6,1).".atm";}
#      
#  if(!-e "$PDBdir/$pdbname"){exit();}
#        open(RRR,"$PDBdir/$pdbname");
#                $note=0;
#                while($para1=<RRR>)
#                {
#                        chomp($para1);
#                        @temp=();
#                        @temp=split(/\s+/,$para1);
#                        if($temp[2] eq $paraca)
#                        {
#                                $pdbcorrx[$note]=$temp[5];
#                                $pdbcorry[$note]=$temp[6];
#                                $pdbcorrz[$note]=$temp[7];
#                                $countca[$note]=$label[$note];
#                                $note++;
#                        }
#
#                }
#        close(RRR);
##print "$note ";
#        $conn=0;
#        @native1=();
#        @native2=();
#        for($i=0; $i<=$note-2;$i++)
#        {
#                for($j=$i+1;$j<=$note-1;$j++)
#                {
#                        $deltax=$pdbcorrx[$i]-$pdbcorrx[$j];
#                        $deltay=$pdbcorry[$i]-$pdbcorry[$j];
#                        $deltaz=$pdbcorrz[$i]-$pdbcorrz[$j];
#                        $distance=$deltax**2+$deltay**2+ $deltaz**2;
#                     if(($distance<=64.0) and ($countca[$j]-$countca[$i]>=$downlimit) and ($countca[$j]-$countca[$i]<=$uplimit))
#                        {
#                                $native1[$conn]=$countca[$i];
#                                $native2[$conn]=$countca[$j];
#                                $conn++;
#                        }
#                }
#        }

#############################################################################


$note=30;
open(WER,"$rcddir/seq.txt");
while($tyu=<WER>)
{
        chomp($tyu);
        $opo=length($tyu);
        if($opo>$note){$note=$opo;}

}
close(WER);
#print " $note\n";
###############################################################################
#
@pred=();
for($k=0;$k<8;$k++)
{
        for($i=0;$i<=$note;$i++)
        {
                  for($j=0;$j<=$note;$j++)
                 {
                         $pred[$k][$i][$j]=0.0;
                }
        }
}
############################CCMPRED###################################################

  $pdbname="CCMpred$line.map";
if(!-e "$rcddir/$pdbname"){print "WARNING!!!!!!!!!!!BETACON\n";}
 open(GGG,"$rcddir/$pdbname");

      $numbbetaconini=0;
      while($para1=<GGG>)
        {
              chomp($para1);
              @temp=();
              @temp=split(/\t+/,$para1);
			$trleng=@temp;  

            if ($trleng>3)
                {
			
                        $numbbetaconini++;
			for($i=0;$i<$trleng;$i++)
			{
				
				$pred[0][$numbbetaconini][$i+1]=$temp[$i];
			}
             }

     }


close(GGG);



#########################################################################################

#


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
                if($trleng>1)
                {
			$pred[1][$temp[0]][$temp[1]]=$temp[2];
			$pred[1][$temp[1]][$temp[0]]=$temp[2];
                }
                         }
close(GGG);


#####################################################################################################
#
#############################evfold#########E#################################################

  $pdbname="freecontact$line.map";
if(! -e "$rcddir/$pdbname"){print "$line	WARNING!!!!!!!!!!!!!!!!!!!!!!!!freecontact\n";}
 open(GGG,"$rcddir/$pdbname");

      $numbpsicovini=0;
      while($para1=<GGG>){
              chomp($para1);
              $para1=~s/^\s+|\s+$//g;
              @temp=();
              @temp=split(/\s+/,$para1);
			$trleng=@temp;
                if($trleng>3)
                {
			$pred[2][$temp[0]][$temp[2]]=$temp[5];
			$pred[2][$temp[2]][$temp[0]]=$temp[5];
                }
                         }
close(GGG);


#####################################################################################################









############################BETACON###################################################

  $pdbname="betacon$line.map";
if(!-e "$rcddir/$pdbname"){print "WARNING!!!!!!!!!!!BETACON\n";}
 open(GGG,"$rcddir/$pdbname");

      $numbbetaconini=0;
      while($para1=<GGG>)
        {
              chomp($para1);
              @temp=();
              @temp=split(/\s+/,$para1);
			$trleng=@temp;  

            if ($trleng>3)
                {
			
                        $numbbetaconini++;
			for($i=0;$i<$trleng;$i++)
			{
				
				$pred[3][$numbbetaconini][$i+1]=$temp[$i];
			}
             }

     }


close(GGG);



#########################################################################################


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
               			$pred[4][$temp[0]][$temp[1]]=$temp[4];
					$pred[4][$temp[1]][$temp[0]]=$temp[4];
                           }

                         }


close(GGG);


############################################################################################


#############################################svmseq test######################################


  $pdbname="svmseq.dat";
if(!-e "$rcddir/$pdbname"){print "$line	!!!!!!!!!!!!!!WARNING!!!!!!!!!!!!!!!!!!!!!!!SVMSEQn!\n";}
 open(GGG,"$rcddir/$pdbname");

      $numbsvmseqini=0;
      while($para1=<GGG>){
              chomp($para1);
              $para1=~s/^\s+|\s+$//g;
              @temp=();
              @temp=split(/\s+/,$para1);
                $ee=@temp;
#	print "$temp[0]	$temp[1] $temp[2]\n";	
                if($ee==3){
			$pred[5][$temp[0]][$temp[1]]=$temp[2];
			$pred[5][$temp[1]][$temp[0]]=$temp[2];
                        }
                         }


close(GGG);





######################################################################################3



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
  			$pred[6][$temp[0]][$temp[1]]=$temp[2];
			$pred[6][$temp[1]][$temp[0]]=$temp[2];
                         }
close(GGG);


##########################################################################################



#################################meta-psicov##############################################33
  $pdbname="meta-psicovstage2$line.map";
if(! -e "$rcddir/$pdbname"){print "WARNING!!!!!!!!!!!!!!meta-psicov-stage2\n";}
 open(GGG,"$rcddir/$pdbname");

      $numbspconini=0;
      while($para1=<GGG>){
              chomp($para1);
              $para1=~s/^\s+|\s+$//g;
              @temp=();
              @temp=split(/\s+/,$para1);
		if($temp[2]==0 and $temp[3]==8)
		{
                        $pred[7][$temp[0]][$temp[1]]=$temp[4];
                        $pred[7][$temp[1]][$temp[0]]=$temp[4];
		}
                         }
close(GGG);

###############################################################################################










########################################################big matrix####################################
#betacon:0;;svmcon:1;svmseq:2;spcon:3; psicov 4






###########################################iTRAIN#######################################################e

open(WWW,">$rcddir/longbayes$line");
        for($i=1;$i<=$note;$i++)
        {
                 for($j=$i+1;$j<=$note;$j++)
                 {
			if(($j-$i)>=24)
                       { 
			##ith jth  con non
	$temp=0.01674*psicov($pred[1][$i][$j])*spcon($pred[6][$i][$j])*meta($pred[7][$i][$j])/0.98326;

#		$temp=0.01674*ccmpred($pred[0][$i][$j])*psicov($pred[1][$i][$j])*evfold($pred[2][$i][$j])*betacon($pred[3][$i][$j])*svmcon($pred[4][$i][$j])*svmseq($pred[5][$i][$j])*spcon($pred[6][$i][$j])/0.98326;
#			$temp=0.01674*betacon($pred[0][$i][$j])*svmcon($pred[1][$i][$j])*svmseq($pred[2][$i][$j])*spcon($pred[3][$i][$j])*psicov($pred[4][$i][$j])/0.98326;			

#$tempnon=0.98326*$betaconnon[int($pred[0][$i][$j]/0.002)]*$svmconnon[int($pred[1][$i][$j]/0.002)]*$svmseqnon[int($pred[2][$i][$j]/0.001)]*$spconnon[int($pred[3][$i][$j]/0.002)]*$psicovnon[int($pred[4][$i][$j]/0.002)];
			$temp=1-1/($temp+1);
if($temp>1){print "WRONG";}


			
#*betacon($pred[3][$i][$j]) !! Turn this on after betacon and svmcon test


 print WWW "$i	$j	$temp\n";


			}
                }
        }
#for($i=1;$i<=$note;$i++)
#{
#	for($j=$i+1;$j<=$note;$j++)
#	{
#		$alarm=0;
#		for($k=-1;$k<=1;$k++)
#		{
#			for($l=-1;$l<=1;$l++)
#			{
#				if($pred[5][$i][$j]>5*$pred[5][$i+$k][$j+$l] and $pred[5][$i][$j]>0.8)
#				{
#					$alarm++;
#				}
#			}
#		}
#		if($alarm>=6)
#		{
#			$pred[5][$i][$j]=0.125*($pred[5][$i-1][$j-1]+$pred[5][$i][$j-1]+$pred[5][$i+1][$j-1]+$pred[5][$i-1][$j]+$pred[5][$i+1][$j]+$pred[5][$i-1][$j+1]+$pred[5][$i][$j+1]+$pred[5][$i+1][$j+1]);
#		}
#		                        
#
#			$rt1=betacon($pred[0][$i][$j]);
#                        $rt2=svmcon($pred[1][$i][$j]);
#                        $rt3=svmseq($pred[2][$i][$j]);
#                        $rt4=spcon($pred[3][$i][$j]);
#                        $rt5=psicov($pred[4][$i][$j]);
#                        print WWW "$i   $j      $pred[5][$i][$j]   $rt1    $rt2    $rt3    $rt4    $rt5\n";
#
##		print WWW "$i  $j      $pred[5][$i][$j]   $pred[0][$i][$j]        $pred[1][$i][$j]        $pred[2][$i][$j]        $pred[3][$i][$j]        $pred[4][$i][$j]\n";
##		
#	}
#}

close(WWW);
#
#
#
###################################################################################################
}
exit();


sub ccmpred{
@listmp=@_;
$number=$listmp[0];
#CCMPRED
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2
#Y standard errors: Unknown
#From x = 0.0 to x = 0.2
#a0  = 0.896255057728973 +/- 0.0164692984104598
#a1  = -2.35586366717141 +/- 0.367774494222598
#a2  = 10.8082746909714 +/- 1.73378265080083
#
#Exponential growth fit of dataset: Table1_4, using function: y0+A*exp(x/t)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.202 to x = 0.5
#A (amplitude) = 0.0872384216351662 +/- 0.0301178341194828
#t (lifetime) = 0.10474205156979 +/- 0.678519825003485
#y0 (offset) = 0.316211200747219 +/- 0.23769953903516
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.502 to x = 1.002
#a0  = -83.9948065233891 +/- 278.259483142488
#a1  = 220.663365089953 +/- 1,152.84139272144
#a2  = -58.9457584517951 +/- 1,560.0321683778
#a3  = -12.8330164204775 +/- 690.405851626323
if($number<0.2)
{
	$temp1=0.896255057728973-2.35586366717141*$number+10.8082746909714*$number*$number;
}
elsif($number>=0.2 and $number<=0.5)
{
	$temp1=0.316211200747219+0.0872384216351662*exp($number/0.10474205156979);
}
else
{	
	$temp1=-83.9948065233891+220.663365089953*$number-58.9457584517951*$number*$number-12.8330164204775*$number*$number*$number;
}
return $temp1
}
#################################################################################################

###############################################################################################
sub evfold{
@listmp=@_;
$number=$listmp[0];
$number=(0.0625*$number+0.15625);
if($number>1){$number=1;}
if($number<0){$number=0;}
#evfold
#
#

#evfold
#
#x<0.05
#y=0
#x<0.15
#y=0.4
#x<0.25
#Gauss fit of dataset: Table1_4, using function: y0+A*sqrt(2/PI)/w*exp(-2*((x-xc)/w)^2)
#Y standard errors: Unknown
#Scaled Levenberg-Marquardt algorithm with tolerance = 0.0001
#From x = 0.152 to x = 0.25
#A (amplitude) = 2.0786933806688 +/- 0.474414897316957
#xc (center) = 0.258438742369294 +/- 0.00768982508900604
#w (width) = 0.0784753124308227 +/- 0.0109183115346599
#y0 (offset) = -0.0207423137044649 +/- 0.768555689304271
#
#x<0.4
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.252 to x = 0.408
#a0  = -792.361340751585 +/- 635.950822960975
#a1  = 7,672.79021972537 +/- 5,893.12403805539
#a2  = -23,714.7979820719 +/- 18,019.267411448
#a3  = 24,150.6205662205 +/- 18,186.4184178161
#
#
#
#
#
#
#
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.402 to x = 0.502
#a0  = -21,775.1734636286 +/- 31,381.6950215688
#a1  = 145,373.355816504 +/- 209,934.343378197
#a2  = -321,967.9394427 +/- 467,071.067132062
#a3  = 237,037.269411006 +/- 345,596.407688223
#
#
#
#x>0.5
#y=10.5
#
#
#
if($number<0.05)
{
	$temp1=0;
}
elsif($number<0.15)
{
	$temp1=0.4;
}
elsif($number<0.25)
{
	$temp1=-0.0207423137044649+2.0786933806688*sqrt(2/3.1415926)*exp(-2*($number-0.2584387)*($number-0.2584387)/(0.0784753*0.0784753))/0.0784753;
}
elsif($number<0.408)
{

	$temp1=-792.361340751585+7672.79021972537*$number-23714.7979820719*$number*$number+24150.6205662205*$number*$number*$number;
}
elsif($number<0.502)
{
#Polynomial fit of dataset: Table1_4, using function: a0+a1*x+a2*x^2+a3*x^3
#Y standard errors: Unknown
#From x = 0.402 to x = 0.502
#a0  = -21,775.1734636286 +/- 31,381.6950215688
#a1  = 145,373.355816504 +/- 209,934.343378197
#a2  = -321,967.9394427 +/- 467,071.067132062
#a3  = 237,037.269411006 +/- 345,596.407688223
	$temp1=-21775.1734636286+145373.355816504*$number-321967.9394427*$number*$number+237037.269411006*$number*$number*$number;
}
else
{
	$temp1=10.5;
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
#
#X=0 to X=0.1
#divided function
#y0+A*exp(x/t)
#y0=0.275255
#A=0.12037
#t=0.03859
#
#X=0.1 to X=0.5
#
#a+b*x+c*x^2+d*x^3
#a=3.3419
#b=-33.76
#c=223.007
#d=-103.94
#
#From X=0.5 to X=0.905
#
#divided function a+b*x+c*x^2+d*x^3
#a=-429.809
#b=1888.286
#c=-2587.17446
#d=1274.5397
#
#X>0.905
#divide =140
#
if($number<0.1)
{
	$temp1=0.275255+0.12037*exp($number/0.03859);
}
elsif($number>=0.1 and $number<0.5)
{
	$temp1=3.3419-33.76*$number+233.007*$number*$number-103.94*$number*$number*$number;
}
elsif($number>=0.5 and $number<=0.905)
{
	$temp1=-429.809+1888.286*$number-2587.17446*$number*$number+1274.5397*$number*$number*$number;
}
else{$temp1=140;}


return $temp1
}



sub spcon{
@listmp=@_;
$number=$listmp[0];
#SPcon
#
#X<0.04
#1.3
#From X=0.04  to X=0.2
#divided function y0+A*exp(-x/t)
#y0=0.232744
#A=0.0138177
#t=0.0376387
#
#
#
#From X=0.2 to X=0.5
#divided function a+bx+cx^2
#a=-21.56999
#b=129.018138
#c=-32.03525
#
#From X=0.5 to X=0.75
#spcon con: a+bx+cx*x
#a=-223.1615
#b=763.4374
#c=-488.305
#
#X>0.75
#dicided function =100.0
#
#
if($number<0.04)
{
	$temp1=1.3;
}
elsif($number>=0.04 and $number <0.2)
{
	$temp1=0.232744+0.0138177*exp($number/0.0376387);
}
elsif($number>=0.2 and $number<0.5)
{
	$temp1=-21.56999+129.018138*$number-32.03525*$number*$number;
}
elsif($number>=0.5 and $number<=0.75)
{
	$temp1=-233.1615+763.4374*$number-488.305*$number*$number;
}
else
{
	$temp1=100;
}
return $temp1
}






sub svmseq{
@listmp=@_;
$number=$listmp[0];
#
#SVMseq
#X<0.001
# divideed function 0.4611
# X=0.002 to X=0.06
# 0.1685+5.1593*x
# X=0.06 to X=0.12
#dicided function y0+A*exp(x/t)
#y0=-0.2788996
#A=0.0545532
#t=0.0277264
#
#From X=0.12 to X=0.5
#dicided function y0+A*exp(x/t)
#y0=1.228778
#A=2.33949
#t=0.1573
#
#
#X=0.5 to X=1
#a+b*x
#a=-124.9
#b=364.53
#
if($number<=0.001)
{
	$temp1=0.4611;
}
elsif($number>0.001 and $number<=0.06)
{
	$temp1=0.1685+5.1593*$number;
}
elsif($number>0.06 and $number<0.12)
{
	$temp1=-0.2788996+0.0545532*exp($number/0.0277264);
}
elsif($number>=0.12 and $number <=0.5)
{
	$temp1=1.228778+2.33949*exp($number/0.1573);
}
else
{
	$temp1=-124.9+364.53*$number;
}
return $temp1
}




sub svmcon{
@listmp=@_;
$number=$listmp[0];
#X<0.1
#set the dicieded function to be 0.015
#
#From X=0.1 to X=0.4
#divied function=y0+A*exp(x/t)
#y0=-0.18444180045
#A=0.1119963
#t=0.1390935
#
#From X=0.4 to X=0.7
# divided function y0+A*exp(x/t)
#y0=-0.08053
#A=0.1643313
#t=0.165626
#
#From X=0.7 toX =0.8
#divided functiom y0+A*exp(x/t)
#y0=-5.7428197
#A=0.1653179475
#t=0.1503203697
#
#
#
##From X=0.8 toX =1.0
#divided functiom a+bx+cx^2
#a=3730.019660
#b=-9519.40348
#c=6115.4311
if($number<0.1)
{
	$temp1=0.015;
}
elsif($number>=0.1 and $number<=0.4)
{
	$temp1=-0.18444180045+0.1119963*exp($number/0.1390935);
}
elsif($number>0.4 and $number<0.7)
{
	$temp1=-0.08053+0.1643313*exp($number/0.165626);
}
elsif($number>=0.7 and $number<0.8)
{
	$temp1=-5.7428197+0.1653179475*exp($number/0.1503203697);
}
else
{
	$temp1=3730.019660-9519.40348*$number+6115.4311*$number*$number;
}
return $temp1
}










sub betacon{
@listmp=@_;
$number=$listmp[0];
#X<0.1
#-0.04839+40.055414*x
#
#
#From X=0.1 to X=0.35
#betacon divided function=y0+a*exp(x/t)
#y0=-5.8897015
#A=5.10266
#t=0.170019
#
#from x=0.350 to X=0.6
#betacon con:
#function: a+bx+cx^2+dx^3
#a=1462.6646
#b=-9401.7818
#c=19809.548
#d=-13205.7599
#
#From x=0.6 to X=0.7
#betacon con:
#function: y0+A*exp(-x/t)
#A=0.0070843
#t=29.213044
#y0=-0.0068802233
#
#betacon non:
#function: y0+A*exp(-x/t)
#A=0.0030309
#t=0.06788763
#y0=0.0000001885985225
#
#
#betacon From x=0.7 to x=1.0
#set the divideed number to 300
if($number<0.1)
{
	$temp1=-0.04839+40.055414*$number;
}
elsif($number>=0.1 and $number<=0.35)
{
	$temp1=-5.8897015+5.10266*exp($number/0.170019);
}
elsif($number>0.35 and $number<0.6)
{
	$temp1=1462.6646-9401.7818*$number+19809.548*$number*$number-13205.7599*$number*$number*$number;
}
elsif($number>=0.6 and $number<0.7)
{
	$temp1=(0.0070843*exp(-$number/29.213044)-0.0068802233)/(0.0000001885985225+0.0030309*exp(-$number/0.06788763));
}
else
{	
	$temp1=300;
}
return $temp1
}










sub meta{
@listmp=@_;
$number=$listmp[0];
#x<=0.5
#y=0.9993207+8.335964*x+90.56185*x*x
#x<0.9
#y=250.79814-844.4434*x+822.86113*x*x
if($number<0.5)
{
	$temp1=0.9993207+8.335964*$number+90.56185*$number*$number;
}
elsif($number>=0.5 and $number<0.894)
{
	$temp1=250.79814-844.4434*$number+822.86113*$number*$number;
}
elsif($number>=0.894)
{
	$temp1=61.681305087+0.00000011296587*exp($number/0.0437830);
}
return $temp1;
}
