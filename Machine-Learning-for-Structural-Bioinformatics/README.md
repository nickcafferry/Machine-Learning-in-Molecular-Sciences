
#!/bin/bash

# This script is used to download and extract uniprot20, uniref90 and nr

################################ 1. Download and extract uniprot20_2016_02 (Takes approximately 35 minutes to download, 15 minutes for installation) ############################
cd ./lib/hhsuite
wget -r -np -k  -nd http://wwwuser.gwdg.de/~compbiol/data/hhsuite/databases/hhsuite_dbs/uniprot20_2016_02.tgz
tar -xvzf uniprot20_2016_02.tgz
rm uniprot20_2016_02.tgz
echo "Done with downloading and extracting uniprot20_2016_02!"
cd ../../



####################### 2. Download and extract uniref90 (Takes approximately 7-8 minutes to download, and 45 minutes to several hours for installation) ##########################
mkdir ./lib/uniref90
cd ./lib/uniref90
wget -r -np -k  -nd ftp://ftp.uniprot.org/pub/databases/uniprot/uniref/uniref90/uniref90.fasta.gz
gunzip uniref90.fasta.gz
cp ../../lib/blast/bin/formatdb ./
./formatdb -i uniref90.fasta
rm uniref90.fasta.gz
echo "Done with downloading and extracting uniref90!"
cd ../../



################################# 3. Download nr and extract nr (It takes approximately 4 minutes to download and 5-10 minutes for installation) ################################

cd ./lib
wget -r -np -nd ftp://zhanglab.ccmb.med.umich.edu/download/nr.tar.gz
tar -xvzf nr.tar.gz
rm nr.tar.gz
echo "Done with downloading and extracting nr!"
cd ../
