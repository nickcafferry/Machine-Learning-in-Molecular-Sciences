#!/usr/bin/perl 
%SEQ=(
        "ALA"=>"A",
        "ARG"=>"R",
        "ASN"=>"N",
        "ASP"=>"D",
        "CYS"=>"C",
        "GLN"=>"Q",
        "GLU"=>"E",
        "GLY"=>"G",
        "HIS"=>"H",
        "ILE"=>"I",
        "LEU"=>"L",
        "LYS"=>"K",
        "MET"=>"M",
        "PHE"=>"F",
        "PRO"=>"P",
        "SER"=>"S",
        "THR"=>"T",
        "TRP"=>"W",
        "TYR"=>"Y",
        "VAL"=>"V",
        );
$cut=$ARGV[0]; #0 short range ;1 medm range ; 2 long range
$window=$ARGV[1]; # 7
$pdb{'0'}=$ARGV[2]; # pdb name
if( $cut!=0 && $cut!=1 && $cut!=2)
{ 
   print "Need correct cut!can be 0 1,2\n";
   exit();
}

if($cut==0)
{
    $low=6;
    $high=12;
    $norm=781;
}
elsif($cut==1)
{
    $low=12;
    $high=24;
    $norm=787;
}
else
{
    $low=24;
    $high=10000;
    $norm=918;
}
$counter=1;
#exit() if(-s "inputCA$cut.dat");

for($i=0;$i<$counter;$i++)
{
    printf "$i :: $pdb{$i}\n";
##########################################
#read from exp.dat, from 0,1,2,3,...
###########################################
    open(fl,"exp.dat");
    <fl>; #skip this line
    $in=0;
    while($line=<fl>)
    {
        $line=~/\S+\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
        for($pp=1;$pp<=17;$pp++)
        {
            if($$pp==0)
            {
              last;
            }
        }
        $exp{$i,$in}=($pp-1)/20;#exposed
        
	if($exp{$i,$in}<0.25)#buried
        {
	    $exposed{$i,$in}=0;
	    $buried{$i,$in}=1;
	}
	else #exposed
	{
	    $exposed{$i,$in}=1;
	    $buried{$i,$in}=0;
	}
        #print "$in ==> $exp{$i,$in}\n";
        $in++;

    }
    close(fl);
#################

################################
#read from *_pssm.txt,  from 0,1,2,3,...
################################
    print "$pdb{$i}\_pssm.txt\n";
    open(fl,"$pdb{$i}\_pssm.txt");
    <fl>;#skip this line
    <fl>;#skip this line
    <fl>;#skip this line
    $j=0;

    while(1)
    {
        $line=<fl>;
        $temp_str=substr($line,11,1);
        #print "$line";
        $line=~/(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
        last if($temp_str eq "");
        $pos{$i,$j}=$1;
        $seq{$i,$j}=$2;
        #print "$i,$j===>$pos{$i,$j},$seq{$i,$j},";
        for($k=0;$k<20;$k++)
        {
            $kk=$k+3;
            $pssm{$i,$j,$k}="$$kk";
            $pssm{$i,$j,$k}/=10.0;
            $pssm{$i,$j,$k}+=1.0;
            $pssm{$i,$j,$k}/=2.0;
            #print "$i $j $k :: $pssm{$i,$j,$k}\n";

        }
        #print "$pos{$i,$j},$seq{$i,$j}\n";
        #exit();

        $j++;
    }
    $len_protein=$j;
    close(fl);

 

#################################################
#read from seq.dat (secondary structure) from 0,1,2,3,...
#################################################
    print "seq.dat\n";
    open(fl,"seq.dat");
    $j=0;
    while($line=<fl>)
    {
	$line=~/(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
	$seq_list{$i,$j}=$SEQ{$2};
	print "residue name is different! $j $seq_list{$i,$j}  $seq{$i,$j}\n" if($seq_list{$i,$j} ne $seq{$i,$j});
	#print "$seq_list{$j}\n";
        #exit();
	for($pp=1;$pp<=3;$pp++)
	{
	    $ss{$i,$j,$pp}=0;#coil
	}
	if($3==1)
	{
	    $ss{$i,$j,1}=1;#coil
            $ss2{$i,$j}=0;
	}
	elsif($3==2)
	{
	    $ss{$i,$j,2}=1;#helix
            $ss2{$i,$j}=1;
	}
	elsif($3==4)
	{
	    $ss{$i,$j,3}=1;#beta
            $ss2{$i,$j}=-1;
	}

	#print "$i,$j :: $ss{$i,$j,1} $ss{$i,$j,2} $ss{$i,$j,3}\n";
	$j++;
    }
    close(fl);
    print "protein length is different!\n" if($len_protein!=$j);

   
   
    
    $kkkk=0;
    $mykkkk=0;
    $cut_kkkk=1000;
    for($j=0;$j<$len_protein;$j++)
    {
      for($n=$j;$n<$len_protein;$n++)
      {
	  $jj=$j+1;
	  $nn=$n+1;
	  goto HHH2 if( (($n-$j)<$low ) || (($n-$j)>=$high) );
	  #next if( $ind_contact{$i,$jj,$nn}!=1 && $ind_noncontact{$i,$jj,$nn}!=1); #
	  #print "suc\n" if($i==167);
	  #$tmp=$kkkk % $cut_kkkk;
	  #print "$kkkk $cut_kkkk\n";
	  if($kkkk % $cut_kkkk == 0){
	      open(fl3,">inputCA$cut.dat$mykkkk");
	      open(fl4,">pairCA$cut.dat$mykkkk");
	  }
          printf fl4 "$jj $nn\n";
	  printf fl3 "1 ";
	  
	  
          ##############for the first position###################
	  ###########for residue i,3+20+2=25 features  (3 features for secondary structure, 20 for PSSM, 2 for solvent accessibility)#########
	  ######totally 15 window, 375 features
	  $cc=0;
	  for($k=-$window;$k<=$window;$k++)
	  {
	    $kk=$k+$j;
            #print "kk=$kk\n";
	    if($kk<0 || $kk>=$len_protein)#blank residue
	    {
		
		for($p=1;$p<=3;$p++)
		{
		    $cc++;
		    #printf fl3 "$cc:0 ";
		}
		for($p=0;$p<20;$p++)
		{
		    $cc++;
		    #printf fl3 "$cc:0 ";
		}
		$cc++;
		#printf fl3 "$cc:0 ";
                $cc++;
                #printf fl3 "$cc:0 ";                
            }
            else
            {
                for($p=1;$p<=3;$p++)
                {
                    $cc++;
                    printf fl3 "$cc:%1d ",$ss{$i,$kk,$p} if($ss{$i,$kk,$p}!=0);
                }
                for($p=0;$p<20;$p++)
                {
                    $cc++;
                    printf fl3 "$cc:%-5.3f ", $pssm{$i,$kk,$p} if($pssm{$i,$kk,$p}!=0);
                    #printf  "$i,$kk,$p,$cc:%-5.3f\n", $pssm{$i,$kk,$p} if($pssm{$i,$kk,$p}!=0);
                    
                }
                #exit();
		$cc++;
		printf fl3 "$cc:%1d ",$exposed{$i,$kk} if($exposed{$i,$kk}!=0);
                $cc++;
                printf fl3 "$cc:%1d ",$buried{$i,$kk} if($buried{$i,$kk}!=0);
                
            }
          }#end $k
	 
          #for the second position
	  ###########for residue i,3+20+2=25 features  (3 features for secondary structure, 20 for PSSM, 2 for solvent accessibility)#########
	  ######totally 15 window, 375 features
          
          for($k=-$window;$k<=$window;$k++)
          {
            $kk=$k+$n;
	    
            if($kk<0 || $kk>=$len_protein)#blank residue
            {
                for($p=1;$p<=3;$p++)
                {
                    $cc++;                    
                    #printf fl3 "$cc:0 ";
                }
                for($p=0;$p<20;$p++)
                {
                    $cc++;                    
                    #printf fl3 "$cc:0 ";
                }
                $cc++;
		#printf fl3 "$cc:0 ";
                $cc++;
                #print fl3 "$cc:0 ";
                
            }
            else
            {
		
                for($p=1;$p<=3;$p++)
                {
                    $cc++;
                    printf fl3 "$cc:%1d ",$ss{$i,$kk,$p} if($ss{$i,$kk,$p} !=0);
		    
                }
                for($p=0;$p<20;$p++)
                {
                    $cc++;
                    printf fl3 "$cc:%-5.3f ",$pssm{$i,$kk,$p} if($pssm{$i,$kk,$p}!=0);
                }
                $cc++;
		printf fl3 "$cc:%1d ",$exposed{$i,$kk} if($exposed{$i,$kk}!=0);
                $cc++;
                printf fl3 "$cc:%1d ",$buried{$i,$kk} if($buried{$i,$kk}!=0);
                
            }



          }#end $k
	  #####End for local window, already 750 features


	  goto UUU if($cut < 2);
	  #for the middle point position
	  ###########for residue i,3+20+2=25 features  (3 features for secondary structure, 20 for PSSM, 2 for solvent accessibility)#########
	  ######totally 5 residue window, 125 features for >=24 sequence separation
          #######875 features for cut=2

	  $mid=int(($n+$j)/2);
       	  $step=int(($n-$j-14)/5); #step size
 
          for($k=-2;$k<=2;$k++)
          {
            $kk=$k*$step+$mid; 	    
            if($kk<0 || $kk>=$len_protein)#blank residue
            {
                for($p=1;$p<=3;$p++)
                {
                    $cc++;                    
                    #printf fl3 "$cc:0 ";
                }
                for($p=0;$p<20;$p++)
                {
                    $cc++;                    
                    #printf fl3 "$cc:0 ";
                }
                $cc++;
		#printf fl3 "$cc:0 ";
                $cc++;
                #print fl3 "$cc:0 ";
                
            }
            else
            {
		
                for($p=1;$p<=3;$p++)
                {
                    $cc++;
                    printf fl3 "$cc:%1d ",$ss{$i,$kk,$p} if($ss{$i,$kk,$p} !=0);
		    
                }
                for($p=0;$p<20;$p++)
                {
                    $cc++;
                    printf fl3 "$cc:%-5.3f ",$pssm{$i,$kk,$p} if($pssm{$i,$kk,$p}!=0);
                }
                $cc++;
		printf fl3 "$cc:%1d ",$exposed{$i,$kk} if($exposed{$i,$kk}!=0);
                $cc++;
                printf fl3 "$cc:%1d ",$buried{$i,$kk} if($buried{$i,$kk}!=0);
                
            }



          }#end $k
	  
          UUU:;

  
	  ##############Begining for central segment################################
	  $len_seg=$n-$j-1;
          	  
	  #########for secondary structure ############################
	  for($p=0;$p<3;$p++)
          {
	      $seg_sec[$p]=0;#for secondary structure		  
	  }
	  #########composition of secondary structrure, 3 features####################
	  for($p=$j+1;$p<=$n-1;$p++)
	  {
	      if($ss2{$i,$p} == 1) #alpha
	      {
		$seg_sec[0]+=1/$len_seg;  
	      }
	      elsif($ss2{$i,$p} == -1) # beta
	      {
        	$seg_sec[1]+=1/$len_seg; 
	      }
	      elsif($ss2{$i,$p} == 0) #loop
	      {
		$seg_sec[2]+=1/$len_seg; 
	      }  
	  }
	  $cc++;
	  printf fl3 "$cc:%-5.3f ",$seg_sec[0] if($seg_sec[0] !=0);#alpha
	  $cc++;
	  printf fl3 "$cc:%-5.3f ",$seg_sec[1] if($seg_sec[1] !=0);#beta
	  $cc++;
	  printf fl3 "$cc:%-5.3f ",$seg_sec[2] if($seg_sec[2] !=0);#loop
	  
	  ############central moment of secondary structure, 3*4=12 features ####################
	  $tmp_sec[0]=1;#alpha
	  $tmp_sec[1]=-1;#beta
	  $tmp_sec[2]=0;#loop
	  for($p=0;$p<3;$p++)
	  {
	      $tmp_sum=0;
	      $m=0;
	      for($q=$j+1;$q<=$n-1;$q++)
	      {
		  if($ss2{$i,$q}==$tmp_sec[$p]) 
		  {
		    
		    $tmp_sum+=($q-$j-1)/($len_seg-1);
		    $m++; 
		  }		 
	      }
	      $avg_sec=0;
	      $avg_sec=$tmp_sum/$m if($m!=0); #mean value
	      
	      $sum2=0;#variance
	      $sum3=0;#third order central moment
	      $sum4=0;#fouth order central moment
	      $m=0;
	      for($q=$j+1;$q<=$n-1;$q++)
	      {
		  if($ss2{$i,$q}==$tmp_sec[$p]) 
		  {
		    $sum2+=(($q-$j-1-$avg_sec)/($len_seg-1))**2;
		    $sum3+=(($q-$j-1-$avg_sec)/($len_seg-1))**3;	    
		    $sum4+=(($q-$j-1-$avg_sec)/($len_seg-1))**4;
		    $m++; 
		  }		 
	      }	  
	      $avg_sec2=0;
	      $avg_sec2=$sum2/$m if($m!=0);#variance
	      $avg_sec3=0;
	      $avg_sec3=$sum3/$m if($m!=0);#third order moment
	      $avg_sec4=0;
	      $avg_sec4=$sum4/$m if($m!=0);#fourth order moment
	      $cc++;
	      printf fl3 "$cc:%-5.3f ",$avg_sec if($avg_sec !=0);
	      $cc++;
	      printf fl3 "$cc:%-5.3f ",$avg_sec2 if($avg_sec2 !=0);
	      $cc++;
	      printf fl3 "$cc:%-5.3f ",$avg_sec3 if($avg_sec3 !=0);
	      $cc++;
	      printf fl3 "$cc:%-5.3f ",$avg_sec4 if($avg_sec4 !=0);
	      
	  }

	  ########for solvent accessibility#######################
	  for($p=0;$p<2;$p++)
          {
	      $seg_exp[$p]=0;#for solvent accessibility		  
	  }
	  ########composition of solvent accessibility, 2 features#######
	  for($p=$j+1;$p<=$n-1;$p++)
	  {
	      if($exp{$i,$p} < 0.25) #buried
	      {
		$seg_exp[0]+=1/$len_seg;  
	      }
	      else #exposed
	      {
        	$seg_exp[1]+=1/$len_seg; 
	      }
	      
	  }
	  $cc++;
	  printf fl3 "$cc:%-5.3f ",$seg_exp[0] if($seg_exp[0] !=0);
	  $cc++;
	  printf fl3 "$cc:%-5.3f ",$seg_exp[1] if($seg_exp[1] !=0);
	 
	  #now have 765 features
	  
	  
	  ############central moment of solvent accessibility, 2*4=8 features####################
	  $tmp_exp[0]=0;#buried
	  $tmp_exp[1]=1;#exposed
	  for($p=0;$p<2;$p++)
	  {
	      $tmp_sum=0;
	      $m=0;
	      for($q=$j+1;$q<=$n-1;$q++)
	      {
		  if($exposed{$i,$q}==$tmp_exp[$p])
		  {
		    
		    $tmp_sum+=($q-$j-1)/($len_seg-1);
		    $m++; 
		  }		 
	      }	  
	      $avg_exp=0;
	      $avg_exp=$tmp_sum/$m if($m!=0); #mean value
	      $sum2=0;#variance
	      $sum3=0;#third order central moment
	      $sum4=0;#fouth order central moment
	      $m=0;
	      for($q=$j+1;$q<=$n-1;$q++)
	      {
		  if($exposed{$i,$q}==$tmp_exp[$p]) 
		  {
		    $sum2+=(($q-$j-1-$avg_exp)/($len_seg-1))**2;
		    $sum3+=(($q-$j-1-$avg_exp)/($len_seg-1))**3;	    
		    $sum4+=(($q-$j-1-$avg_exp)/($len_seg-1))**4;
		    $m++; 
		  }		 
	      }	  
	      $avg_exp2=0;
	      $avg_exp2=$sum2/$m if($m!=0);#variance
	      $avg_exp3=0;
	      $avg_exp3=$sum3/$m if($m!=0);#third order moment
	      $avg_exp4=0;	  
	      $avg_exp4=$sum4/$m if($m!=0);#fourth order moment
	      $cc++;
	      printf fl3 "$cc:%-5.3f ",$avg_exp if($avg_exp !=0);
	      $cc++;
	      printf fl3 "$cc:%-5.3f ",$avg_exp2 if($avg_exp2 !=0);
	      $cc++;
	      printf fl3 "$cc:%-5.3f ",$avg_exp3 if($avg_exp3 !=0);
	      $cc++;
	      printf fl3 "$cc:%-5.3f ",$avg_exp4 if($avg_exp4 !=0);
	  }
          #############end of central segment###########################
	  ############ already have 765+2+8=775 features####################

	  ##############for sequence separation |i-j|######################
          $temp=$n-$j;
	  for($p=0;$p<18;$p++)
	  {
	      $seg_len[$p]=0;
	  }

	  if($cut==0) #|i-j|=6~11 short-range length 6
          {
	      $seg_len[$temp-6]=1;
	      for($p=0;$p<6;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] " if($seg_len[$p] !=0);
	      }
	      
	  }
	  elsif($cut==1) #|i-j|=12-23 length 12
	  {
	      $seg_len[$temp-12]=1;
	      for($p=0;$p<12;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] "  if($seg_len[$p] !=0);
	      }
	  }
	  elsif($cut==2) #|i-j|>23 length 9
	  {
	      if( $temp>=24 && $temp <=29)
	      {
		  $seg_len[0]=1;
	      }
	      elsif($temp>=30 && $temp <=34)
	      {
		  $seg_len[1]=1;
	      }
	      elsif($temp>=35 && $temp <=39)
	      {
		  $seg_len[2]=1;
	      }
	      elsif($temp>=40 && $temp <=44)
	      {
		  $seg_len[3]=1;
	      }
	      elsif($temp>=45 && $temp <=49)
	      {
		  $seg_len[4]=1;
	      }
	      elsif($temp>=50 && $temp <=54)
	      {
		  $seg_len[5]=1;
	      }
	      elsif($temp>=55 && $temp <=59)
	      {
		  $seg_len[6]=1;
	      }
	      elsif($temp>=60 && $temp <=64)
	      {
		  $seg_len[7]=1;
	      }
	      elsif($temp>=65 && $temp <=69)
	      {
		  $seg_len[8]=1;
	      }
	      elsif($temp>=70 && $temp <=74)
	      {
		  $seg_len[9]=1;
	      }
	      elsif($temp>=75 && $temp <=79)
	      {
		  $seg_len[10]=1;
	      }
	      elsif($temp>=80 && $temp <=84)
	      {
		  $seg_len[11]=1;
	      }
	      elsif($temp>=85 && $temp <=89)
	      {
		  $seg_len[12]=1;
	      }
	      elsif($temp>=90 && $temp <=94)
	      {
		  $seg_len[13]=1;
	      }
	      elsif($temp>=95 && $temp <=99)
	      {
		  $seg_len[14]=1;
	      }
	      elsif($temp>=100 && $temp <=119)
	      {
		  $seg_len[15]=1;
	      }
	      elsif($temp>=120 && $temp <=149)
	      {
		  $seg_len[16]=1;
	      }
	      elsif($temp>=150)
	      {
		  $seg_len[17]=1;
	      }
	      for($p=0;$p<18;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] "  if($seg_len[$p] !=0);
	      }
	  }
	  elsif($cut==11) #36>|i-j|>=24 length 12
	  {
	      $seg_len[$temp-24]=1;
	      for($p=0;$p<12;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] "  if($seg_len[$p] !=0);
	      }
	  }
	  elsif($cut==12) #48>|i-j|>=36 length 12
	  {
	      $seg_len[$temp-36]=1;
	      for($p=0;$p<12;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] "  if($seg_len[$p] !=0);
	      }
	  }
	  elsif($cut==13) #60>|i-j|>=48 length 12
	  {
	      $seg_len[$temp-48]=1;
	      for($p=0;$p<12;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] "  if($seg_len[$p] !=0);
	      }
	  }
          elsif($cut==14) #72>|i-j|>=60 length 12
	  {
	      $seg_len[$temp-60]=1;
	      for($p=0;$p<12;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] "  if($seg_len[$p] !=0);
	      }
	  }
	  elsif($cut==15) #84>|i-j|>=72 length 12
	  {
	      $seg_len[$temp-72]=1;
	      for($p=0;$p<12;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] "  if($seg_len[$p] !=0);
	      }
	  }
	  elsif($cut==16)
	  {	     
	      if($temp>=84 && $temp <=95)
	      {
		  $seg_len[0]=1;
	      }
	      elsif($temp>=96 && $temp <=107)
	      {
		  $seg_len[1]=1;
	      }
	      elsif($temp>=108 && $temp <=119)
	      {
		  $seg_len[2]=1;
	      }
	      elsif($temp>=120 && $temp <=131)
	      {
		  $seg_len[3]=1;
	      }
	      elsif($temp>=132 && $temp <=143)
	      {
		  $seg_len[4]=1;
	      }
	      elsif($temp>=144 && $temp <=155)
	      {
		  $seg_len[5]=1;
	      }
	      elsif($temp>=156 && $temp <=167)
	      {
		  $seg_len[6]=1;
	      }
	      elsif($temp>=168 && $temp <=179)
	      {
		  $seg_len[7]=1;
	      }
	      elsif($temp>=180 && $temp <=191)
	      {
		  $seg_len[8]=1;
	      }
	      elsif($temp>=192 && $temp <=203)
	      {
		  $seg_len[9]=1;
	      }
	      elsif($temp>=204 && $temp <=215)
	      {
		  $seg_len[10]=1;
	      }
	      elsif($temp>=216 && $temp <=227)
	      {
		  $seg_len[11]=1;
	      }
	      elsif($temp>=228 && $temp <=239)
	      {
		  $seg_len[12]=1;
	      }
	      elsif($temp>=240 && $temp <=251)
	      {
		  $seg_len[13]=1;
	      }
	      elsif($temp>=252 && $temp <=263)
	      {
		  $seg_len[14]=1;
	      }
	      elsif($temp>=264 && $temp <=277)
	      {
		  $seg_len[15]=1;
	      }
	      elsif($temp>=276 && $temp <=287)
	      {
		  $seg_len[16]=1;
	      }
	      elsif($temp>=288)
	      {
		  $seg_len[17]=1;
	      }	      
	      for($p=0;$p<18;$p++)
	      {
		  $cc++;
		  printf fl3 "$cc:$seg_len[$p] "  if($seg_len[$p] !=0);
	      }

	  }
	  ########for short range, 775+6=781 features##############
	  ########for medium range,775+12=787 features##############
	  ########for long range, 775+125+18=918 features##############
	  ########for 24-35 range, 775+12=787 features ####################
	  ########for 36-47 range, 775+12=787 features ####################
	  ########for 48-59 range, 775+12=787 features ####################
	  ########for 60-71 range, 775+12=787 features ####################
	  ########for 72-83 range, 775+12=787 features ####################
	  ########for 84-1000 range, 775+18=793 features ####################
          printf fl3 "\n";
	  if($kkkk % $cut_kkkk == ($cut_kkkk-1)){	      
	      close(fl3);
	      close(fl4);
	      `/nfs/amino-home/yzhang/library/yzhang/bin/SVMSEQ/svm-scale -l -1 -u 1 -d $norm -r /nfs/amino-home/yzhang/library/yzhang/summary/par$cut inputCA$cut.dat$mykkkk > scaled_inputCA$cut.dat$mykkkk `;
	      `rm -rf inputCA$cut.dat$mykkkk`;
	      $mykkkk++;
	  }
	  $kkkk++;
          HHH2:;
        }#end $n
    }#end $j
    close(fl3);
    close(fl4);
    `/nfs/amino-home/yzhang/library/yzhang/bin/SVMSEQ/svm-scale -l -1 -u 1 -d $norm -r /nfs/amino-home/yzhang/library/yzhang/summary/par$cut inputCA$cut.dat$mykkkk > scaled_inputCA$cut.dat$mykkkk`;
    `rm -rf inputCA$cut.dat$mykkkk`;
    #print "finished \n";
    #exit();
}#end i


exit();
