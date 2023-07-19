#!/bin/bash

# Basecalling script using latest version of Dorado
# Designed to be pretty straightforward and minimise mistakes stemming from confusing basecalling model names.
# Script takes 2 inputs: First is the directory of the POD5 files (note: NOT the path to the POD5 file itself).
# Second is the name of the sample output. 

start=`date +%s`
echo -e
# Set working directory
cd ~/Data/NanoporeBNHL/

WORKINGDIR=$( pwd )

echo -e "--- Mounting Data folder: "
echo -e "$WORKINGDIR \n"


echo "--- Confirming POD5 read directory:"
echo -e  "$1" '\n'

echo -e "--- Confirming $1 has POD5 files in it: "
ls $1
PODS=$(ls $1/*.pod5 |wc -l )
echo -e "$PODS POD5 files  \n"

#Check whether output file already exists to stop overwrites
echo "--- Output file will be named "$2"_260bpsHAC4.1.0.bam"

if [ ! -f ./"$2_260bpsHAC4.1.0.bam" ] ; 
	then echo "Filename is available"; 
else echo "This filename already exists - the original file will be overwritten"; fi

echo -e '\n'

#Confirm yes or no to continue 

read -p "!! Please check the information above. Do you want to proceed? (yes/no):" yn

case $yn in 
	yes ) echo ok, proceed;;
	no ) echo exiting...;
		exit;;
	* ) echo invalid response;
		exit;;
esac

touch "$2"_260bpsHAC4.1.0.bam

dorado basecaller models/dna_r10.4.1_e8.2_260bps_hac@v4.1.0 $1 > "$2"_260bpsHAC4.1.0.bam

end=`date +%s`

RUNTIME=$((end-start))

echo "Complete after $RUNTIME seconds."