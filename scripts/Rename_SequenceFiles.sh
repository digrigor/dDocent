#!/bin/bash

#This script can quickly rename filess within the dDocent naming convention. It needs to be passed a tab delimited
#file with the old name in one column and the new name in the other
#Example#
#PopA_001  NewPop_001
#
# This will renmae PopA_001.F.fq.gz and PopA_001.R.fq.gz to NewPop_001.F.fq.gz and NewPop_001.R.fq.gz

if [ -z "$1" ]
then
echo "No file with old names and new names specified."
echo "Correct usage: Rename_for_dDocent.sh namesfile"
exit 1
else
NAMES=( `cut -f1  $1 `)
BARCODES=( `cut -f2 $1 `)
LEN=( `wc -l $1 `)
LEN=$(($LEN - 1))

echo ${NAMES[0]}
echo ${BARCODES[0]}

for ((i = 0; i <= $LEN; i++));
do
mv sample_${BARCODES[$i]}.1.fq.gz ${NAMES[$i]}.F.fq.gz
mv sample_${BARCODES[$i]}.2.fq.gz ${NAMES[$i]}.R.fq.gz
done
fi