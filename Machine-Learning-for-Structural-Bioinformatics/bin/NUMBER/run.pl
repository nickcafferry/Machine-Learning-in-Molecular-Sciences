@list=`cat temp`;
foreach $line (@list)
{
chomp($line);
@temp=();
@temp=split(/,/,$line);
$tr=@temp;
#print "$temp[0] $temp[1] $temp[2] $temp[3] $temp[4]";
print "$tr\n";
}
exit();
