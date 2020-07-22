###################################2014-12-6###################################################
###################################ZHANG LABS##################################################
####################################BAOJI HE###################################################
#!/usr/perl
$s=$ARGV[0];
$seqdir=$ARGV[1];
@lists=qw(
protein
);

foreach $line (@lists)
{
	chomp($line);
	print "$line\n";
	chomp($s);
	$line="$s";
##################################NATIVE######################################
@seqtxts=`cat $seqdir/seq.txt`;
$sequence="";
foreach $seqtxt(@seqtxts){
    goto pos6 if($seqtxt=~/\>/);
    $seqtxt=~s/\s//mg;
    $seqtxt=~s/\n//mg;
    $sequence=$sequence.$seqtxt;
  pos6:;
}
$note=length($sequence);
#############################NUMBER###########################################
$count=0;
@ss=();
open(UIO,"$seqdir/protein.ss2");
while($lty=<UIO>)
{	
	chomp($lty);
	@temp=();
	@temp=split(/\s+/,$lty);
	$count++;
	if ($count>2){
		$ss[$temp[1]]=$temp[6];
	}
}
close(UIO);








#############################################################################
#
@pred=();
for($i=0;$i<=$note;$i++)
{
	for($j=0;$j<=$note;$j++)
	{
		$pred[$i][$j]=0;
	}
}
#####################################################################################3


########################################ASSIGNMENT###############################
@FRAG=();
for($i=0;$i<=0;$i++)
{
	$FRAG[$i][0]=0;
	$FRAG[$i][1]=0;
}

$NUM=0;
$start=0;
$finish=0;
$last=0;
for($i=1;$i<=$note;$i++)
{
	
	if($ss[$i]>0.3)
	{
		$last++;
	}
	elsif($ss[$i]<=0.3)
	{
		$finish=$i-1;
		$start=$finish-$last+1;
		$last=0;
	}
	if(($last)==0 and ($finish-$start)>=2)	
	{
		$NUM++;
		$FRAG[$NUM][0]=$start;
		$FRAG[$NUM][1]=$finish;
		$start=0;
		$finish=0;
	}
}


##############################################################################################################
############################BETACON###################################################

        @contact1=();
        @contact2=();
        @contact3=();

open(GGG,"$seqdir/NN-BAYES$line.map"); #-1000000-long-metainclude-modified200");
$maxtemp=0;

   $numbbetacon=0;
	$numbbetaconini=0;
      while($para1=<GGG>)
        {
              chomp($para1);
              $para1=~s/^\s+|\s+$//g;
              @temp=();
              @temp=split(/\t+/,$para1);
                                $label11=0;
                                $label22=0;
                                for($k=1;$k<=$NUM;$k++)
                                {
                                        if($temp[0]<=$FRAG[$k][1] and $temp[0]>=$FRAG[$k][0])
                                        {$label11=$k;goto LABEL11;}
                                }
                                LABEL11:;
                                for($k=1;$k<=$NUM;$k++)
                               {
                                        if($temp[1]<=$FRAG[$k][1] and $temp[1]>=$FRAG[$k][0])
                                        {$label22=$k;goto LABEL22;}
                                }
                                LABEL22:;
                               if($ss[$temp[0]]>0.3 and $ss[$temp[1]]>0.3 and $label11!=$label22)
                                {

                                 $contact1[$numbbetacon]=$temp[0];
                                 $contact2[$numbbetacon]=$temp[1];
                                 $contact3[$numbbetacon]=$temp[2];
                                                $pred[$temp[0]][$temp[1]]=$temp[2];
                                                $pred[$temp[1]][$temp[0]]=$temp[2];
	#					print "$para1\n";
                                $numbbetacon++;
				if($temp[2]>$maxtemp){$maxtemp=$temp[2];}
				}
     }
close(GGG);
##################################normalize########################################

        @contact1=();
        @contact2=();
        @contact3=();



open(GGG,"$seqdir/NN-BAYES$line.map");

   $numbbetacon=0;
        $numbbetaconini=0;
      while($para1=<GGG>)
        {
              chomp($para1);
              $para1=~s/^\s+|\s+$//g;
              @temp=();
              @temp=split(/\t+/,$para1);
                                $label11=0;
                                $label22=0;
                                for($k=1;$k<=$NUM;$k++)
                                {
                                        if($temp[0]<=$FRAG[$k][1] and $temp[0]>=$FRAG[$k][0])
                                        {$label11=$k;goto LABEL11;}
                                }
                                LABEL11:;
                                for($k=1;$k<=$NUM;$k++)
                               {
                                        if($temp[1]<=$FRAG[$k][1] and $temp[1]>=$FRAG[$k][0])
                                        {$label22=$k;goto LABEL22;}
                                }
                                LABEL22:;
                               if($ss[$temp[0]]>0.3 and $ss[$temp[1]]>0.3 and $label11!=$label22)
                                {

                                 $contact1[$numbbetacon]=$temp[0];
                                 $contact2[$numbbetacon]=$temp[1];
                                 $contact3[$numbbetacon]=$temp[2]/$maxtemp;
                              #                  $pred[$temp[0]][$temp[1]]=$temp[2]/$maxtemp;
                               #                $pred[$temp[1]][$temp[0]]=$temp[2]/$maxtemp;
                                $numbbetacon++;
                                }
     }
close(GGG);
#############################################Dynamic programing#############################################
$d=0.0;
open(TTT,">$seqdir/$line-step1");
open(III,">$seqdir/$line-step2");
open(YYY,">$seqdir/$line-step3");
print III "FRAGMENT	NO.1	No.2	aligned	score	No.1length	No.2length	aligednnumber\n";
print TTT "FRAGMENT	RESIDUE\n";
for($i=1;$i<=$NUM;$i++)
{
	print TTT "$i	$FRAG[$i][0]-$FRAG[$i][1]\n";
}
print TTT "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";

for($i=1;$i<=$NUM-1;$i++)
{
	for($j=$i+1;$j<=$NUM;$j++)
	{
	if($i!=$j)
	{
	
	#################################prallelly########################################################
		@align=();
		for($k=0;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
		{
			$align[$k][0]=$k*$d;;
		}
		for($l=0;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
                {
			$align[0][$l]=$l*$d;
                }

		for($k=1;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
		{
			for($l=1;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
			{
				if($pred[$FRAG[$i][0]+$k-1][$FRAG[$j][0]+$l-1]==0 and abs($FRAG[$i][0]+$k-$FRAG[$j][0]-$l)>6){print "warining!!!!!!!!!!!!!!!!!!!!!\n";}
				$match=$align[$k-1][$l-1]+$pred[$FRAG[$i][0]+$k-1][$FRAG[$j][0]+$l-1];
				$delete=$align[$k-1][$l]+$d;
				$insert=$align[$k][$l-1]+$d;
				if($match>$delete and $match>$insert){$align[$k][$l]=$match;}
				elsif($delete>$match and $delete>$insert){$align[$k][$l]=$delete;}
				else{$align[$k][$l]=$insert;}
				
			}
		}
		$paralle=$align[$FRAG[$i][1]-$FRAG[$i][0]+1][$FRAG[$j][1]-$FRAG[$j][0]+1];
	################################antiparalelly#########################################################	
                @antialign=();
                for($k=0;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
                {
                        $antialign[$k][0]=$k*$d;;
                }
                for($l=0;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
                {
                        $antialign[0][$l]=$l*$d;
                }

                for($k=1;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
                {
                        for($l=1;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
                        {
				if($pred[$FRAG[$i][1]-$k+1][$FRAG[$j][0]+$l-1]==0 and abs($FRAG[$i][1]-$k+1-$FRAG[$j][0]-$l+1)>6){print "warining!!!!!!!!!!!!!\n"};
                                $match=$antialign[$k-1][$l-1]+$pred[$FRAG[$i][1]-$k+1][$FRAG[$j][0]+$l-1];
                                $delete=$antialign[$k-1][$l]+$d;
                                $insert=$antialign[$k][$l-1]+$d;
                                if($match>$delete and $match>$insert){$antialign[$k][$l]=$match;}
                                elsif($delete>$match and $delete>$insert){$antialign[$k][$l]=$delete;}
                                else{$antialign[$k][$l]=$insert;}

                        }
                }
		$antiparalle=$antialign[$FRAG[$i][1]-$FRAG[$i][0]+1][$FRAG[$j][1]-$FRAG[$j][0]+1];		
	
	######################################################################################################
	print TTT "$i	$j	\n parallel=$paralle antiparallel=$antiparalle\n";
	$AlignmentI="";
	$AlignmentJ="";
	$I=$FRAG[$i][1]-$FRAG[$i][0]+1;
	$J=$FRAG[$j][1]-$FRAG[$j][0]+1;

#for($k=0;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
#{
#	for($l=0;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
#	{
#		print "$align[$k][$l]	";
#	}
#	print "\n";
#}
if(($FRAG[$i][1]-$FRAG[$i][0])>($FRAG[$j][1]-$FRAG[$j][0]))
{
	$longer=$FRAG[$i][1]-$FRAG[$i][0]+1;
}
else{$longer=$FRAG[$j][1]-$FRAG[$j][0]+1;}
if($antiparalle<$paralle and ($paralle>0.0))
{
	$length1=$FRAG[$i][1]-$FRAG[$i][0]+1;
	$length2=$FRAG[$j][1]-$FRAG[$j][0]+1;
	$alignednumber=0;
	while($I>0 or $J>0)
	{
		if($I>0 and $J>0 and $align[$I][$J]==$align[$I-1][$J-1]+$pred[$FRAG[$i][0]+$I-1][$FRAG[$j][0]+$J-1])
		{
			$temp1=$FRAG[$i][0]+$I-1;
			$temp2=$FRAG[$j][0]+$J-1;
			$AlignmentI="$temp1	"."$AlignmentI";
			$AlignmentJ="$temp2	"."$AlignmentJ";
			$alignednumber++;
			if($temp1>$temp2){print YYY "$temp2	$temp1	0.5\n";}else{print YYY "$temp1	$temp2	0.5\n";}
                                                for($p=-1;$p<=1;$p+=1)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=-1;$o<=1;$o+=1)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }

			$I--;
			$J--;
		}
		elsif($I>0 and $align[$I][$J]==$align[$I-1][$J]+$d)
		{
			$temp1=$FRAG[$i][0]+$I-1;
			$AlignmentI="$temp1	"."$AlignmentI";
			$AlignmentJ="-	"."$AlignmentJ";
			$I--;
		}
		else
		{
			$temp1=$FRAG[$j][0]+$J-1;
                        $AlignmentI="-	"."$AlignmentI";
                        $AlignmentJ="$temp1	"."$AlignmentJ";
                        $J--;
		}
	}
	print III "$i	$j	PARALLEL	$paralle	$length1	$length2	$alignednumber\n";
}
elsif($antiparalle>$paralle and ($antiparalle>0.0))
{
	$length1=$FRAG[$i][1]-$FRAG[$i][0]+1;
        $length2=$FRAG[$j][1]-$FRAG[$j][0]+1;
	$alignednumber=0;
        while($I>0 or $J>0)
        {
                if($I>0 and $J>0 and $antialign[$I][$J]==$antialign[$I-1][$J-1]+$pred[$FRAG[$i][1]-$I+1][$FRAG[$j][0]+$J-1])
                {
                        $temp1=$FRAG[$i][1]-$I+1;
                        $temp2=$FRAG[$j][0]+$J-1;
                        $AlignmentI="$temp1	"."$AlignmentI";
                        $AlignmentJ="$temp2	"."$AlignmentJ";
			$alignednumber++;
	                    if($temp1>$temp2){print YYY "$temp2	$temp1	0.5\n";}else{print YYY "$temp1	$temp2	0.5\n";}
                                                for($p=-1;$p<=1;$p+=1)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=-1;$o<=1;$o+=1)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }
                        $I--;
                        $J--;
                }
                elsif($I>0 and $antialign[$I][$J]==$antialign[$I-1][$J]+$d)
                {
                        $temp1=$FRAG[$i][1]-$I+1;
                        $AlignmentI="$temp1	"."$AlignmentI";
                        $AlignmentJ="-	"."$AlignmentJ";
                        $I--;
                }
                else
                {
                        $temp1=$FRAG[$j][0]+$J-1;
                        $AlignmentI="-	"."$AlignmentI";
                        $AlignmentJ="$temp1	"."$AlignmentJ";
                        $J--;
                }
        }
	print III "$i	$j	ANTIPARALLEL	$antiparalle	$length1	$length2	$alignednumber\n";

}


print TTT "$AlignmentI\n";
print TTT "$AlignmentJ\n";

			


	
	#
	#
	}
	print TTT "\n";
	}
print TTT  "#########################\n";
}
close(TTT);
close(III);
close(YYY);
#########################################################ioriginize STEP2###################################################

open(III,"$seqdir/$line-step2");
open(GGG,">$seqdir/rrr");
while($try=<III>)
{

        chomp($try);
        @temp=();
        @temp=split(/\t+/,$try);
        if($temp[0]>$temp[1])
        {
                print GGG "$temp[1]	$temp[0]	$temp[2]	$temp[3]	$temp[5]	$temp[4]	$temp[5]\n";
        }
        else
        {
                print GGG "$temp[0]	$temp[1]	$temp[2]	$temp[3]	$temp[4]	$temp[5]	$temp[6]\n";
        }
}

close(GGG);
close(III);

`sort -rn -k4 $seqdir/rrr |uniq > $seqdir/$line-step2`;

@LABEL=();
for($i=1;$i<=$NUM;$i++)
{
	$LABEL[$i]=0;
}
open(GGG,"$seqdir/$line-step2");
open(YYY,">$seqdir/$line-step3");
open(TTT,">$seqdir/$line-step4");
print TTT "FRAGMENT     NO.1    No.2    aligned score   No.1length      No.2length      aligednnumber\n";

$tempmax=0;
while($linet=<GGG>)
{
	chomp($linet);
	@temp=();
	@temp=split(/\t+/,$linet);
	if($temp[3]>$tempmax){$tempmax=$temp[3];}
	if(($LABEL[$temp[0]]==0 or $LABEL[$temp[1]]==0) and ($temp[2] eq "PARALLEL") and $temp[3]>0.0 and (($LABEL[$temp[0]]+$LABEL[$temp[1]])<=2))
	{
		print TTT "$linet\n";
		$LABEL[$temp[0]]+=1;
		$LABEL[$temp[1]]+=1;
		$i=$temp[0];
		$j=$temp[1];

                @align=();
                for($k=0;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
                {
                        $align[$k][0]=$k*$d;;
                }
                for($l=0;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
                {
                        $align[0][$l]=$l*$d;
                }

                for($k=1;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
                {
                        for($l=1;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
                        {
                                if($pred[$FRAG[$i][0]+$k-1][$FRAG[$j][0]+$l-1]==0 and abs($FRAG[$i][0]+$k-$FRAG[$j][0]-$l)>6){print "warining!!!!!!!!!!!!!!!!!!!!!\n";}
                                $match=$align[$k-1][$l-1]+$pred[$FRAG[$i][0]+$k-1][$FRAG[$j][0]+$l-1];
                                $delete=$align[$k-1][$l]+$d;
                                $insert=$align[$k][$l-1]+$d;
                                if($match>$delete and $match>$insert){$align[$k][$l]=$match;}
                                elsif($delete>$match and $delete>$insert){$align[$k][$l]=$delete;}
                                else{$align[$k][$l]=$insert;}

                        }
                }
                $paralle=$align[$FRAG[$i][1]-$FRAG[$i][0]+1][$FRAG[$j][1]-$FRAG[$j][0]+1];


        $I=$FRAG[$i][1]-$FRAG[$i][0]+1;
        $J=$FRAG[$j][1]-$FRAG[$j][0]+1;
        $alignednumber=0;
        while($I>0 or $J>0)
        {
                if($I>0 and $J>0 and $align[$I][$J]==$align[$I-1][$J-1]+$pred[$FRAG[$i][0]+$I-1][$FRAG[$j][0]+$J-1])
                {
                        $temp1=$FRAG[$i][0]+$I-1;
                        $temp2=$FRAG[$j][0]+$J-1;
                        $AlignmentI="$temp1     "."$AlignmentI";
                        $AlignmentJ="$temp2     "."$AlignmentJ";
                        $alignednumber++;
                        if($temp1>$temp2){print YYY "$temp2	$temp1	0.5\n";}else{print YYY "$temp1	$temp2	0.5\n";}
                                                for($p=-1;$p<=1;$p+=2)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=0;$o<1;$o+=1)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }
                                                for($p=0;$p<1;$p+=1)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=-1;$o<=1;$o+=2)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }
						for($p=-1;$p<1;$p+=2)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=-1;$o<1;$o+=2)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }
						for($p=1;$p<3;$p+=2)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=1;$o<3;$o+=2)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }





                        $I--;
                        $J--;
                }
                elsif($I>0 and $align[$I][$J]==$align[$I-1][$J]+$d)
                {
                        $temp1=$FRAG[$i][0]+$I-1;
                        $AlignmentI="$temp1     "."$AlignmentI";
                        $AlignmentJ="-  "."$AlignmentJ";
                        $I--;
                }
                else
                {
                        $temp1=$FRAG[$j][0]+$J-1;
                        $AlignmentI="-  "."$AlignmentI";
                        $AlignmentJ="$temp1     "."$AlignmentJ";
                        $J--;
                }

        }
	
	}
	elsif(($LABEL[$temp[0]]==0 or $LABEL[$temp[1]]==0) and ($temp[2] eq "ANTIPARALLEL") and $temp[3]>0.0 and (($LABEL[$temp[0]]+$LABEL[$temp[1]])<=2))
	{
		print TTT "$linet\n";
                $LABEL[$temp[0]]+=1;
                $LABEL[$temp[1]]+=1;
                $i=$temp[0];
                $j=$temp[1];




                @antialign=();
                for($k=0;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
                {
                        $antialign[$k][0]=$k*$d;;
                }
                for($l=0;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
                {
                        $antialign[0][$l]=$l*$d;
                }

                for($k=1;$k<=($FRAG[$i][1]-$FRAG[$i][0]+1);$k++)
                {
                        for($l=1;$l<=($FRAG[$j][1]-$FRAG[$j][0]+1);$l++)
                        {
                                if($pred[$FRAG[$i][1]-$k+1][$FRAG[$j][0]+$l-1]==0 and abs($FRAG[$i][1]-$k+1-$FRAG[$j][0]-$l+1)>6){print "warining!!!!!!!!!!!!!\n"};
                                $match=$antialign[$k-1][$l-1]+$pred[$FRAG[$i][1]-$k+1][$FRAG[$j][0]+$l-1];
                                $delete=$antialign[$k-1][$l]+$d;
                                $insert=$antialign[$k][$l-1]+$d;
                                if($match>$delete and $match>$insert){$antialign[$k][$l]=$match;}
                                elsif($delete>$match and $delete>$insert){$antialign[$k][$l]=$delete;}
                                else{$antialign[$k][$l]=$insert;}

                        }
                }
                $antiparalle=$antialign[$FRAG[$i][1]-$FRAG[$i][0]+1][$FRAG[$j][1]-$FRAG[$j][0]+1];
	        $I=$FRAG[$i][1]-$FRAG[$i][0]+1;
        $J=$FRAG[$j][1]-$FRAG[$j][0]+1;
        $alignednumber=0;
        while($I>0 or $J>0)
        {
                if($I>0 and $J>0 and $antialign[$I][$J]==$antialign[$I-1][$J-1]+$pred[$FRAG[$i][1]-$I+1][$FRAG[$j][0]+$J-1])
                {
                        $temp1=$FRAG[$i][1]-$I+1;
                        $temp2=$FRAG[$j][0]+$J-1;
                        $AlignmentI="$temp1     "."$AlignmentI";
                        $AlignmentJ="$temp2     "."$AlignmentJ";
                        $alignednumber++;
                            if($temp1>$temp2){print YYY "$temp2	$temp1	0.5\n";}else{print YYY "$temp1	$temp2	0.5\n";}
                                                for($p=0;$p<1;$p+=1)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=-1;$o<=1;$o+=2)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }
						 for($p=-1;$p<=1;$p+=2)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=0;$o<1;$o+=1)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }
						 for($p=-1;$p<1;$p+=2)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=-1;$o<1;$o+=2)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }
						 for($p=1;$p<3;$p+=2)
                                                 {
                                                          $temp3=$temp1+$p;
                                                          for($o=1;$o<3;$o+=2)
                                                          {
                                                                 $temp4=$temp2+$o;
                                                                if($temp3>$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1])
                                                                { print YYY "$temp4	$temp3	0.5\n";}
                                                                elsif($temp3<$temp4 and $temp3>=$FRAG[$i][0] and $temp3<=$FRAG[$i][1] and $temp4>=$FRAG[$j][0] and $temp4<=$FRAG[$j][1]){print YYY "$temp3	$temp4	0.5\n";}
                                                         }
                                                  }
                        $I--;
                        $J--;
                }
                elsif($I>0 and $antialign[$I][$J]==$antialign[$I-1][$J]+$d)
                {
                        $temp1=$FRAG[$i][1]-$I+1;
                        $AlignmentI="$temp1     "."$AlignmentI";
                        $AlignmentJ="-  "."$AlignmentJ";
                        $I--;
                }
                else
                {
                        $temp1=$FRAG[$j][0]+$J-1;
                        $AlignmentI="-  "."$AlignmentI";
                        $AlignmentJ="$temp1     "."$AlignmentJ";
                        $J--;
                }
        }

	}
}
close(YYY);
close(GGG);
close(TTT);








`sort -n $seqdir/$line-step3 |uniq > $seqdir/$line-step3`;

`mv $seqdir/$line-step4	$seqdir/$line-step3`;













###########################################################################################################

}#protein name



close(PPPPP);
exit();
