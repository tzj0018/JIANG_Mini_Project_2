#! /bin/bash                                                                   $

#exit program with error if user does not specify input on command line
if [ $# != 1 ]; then
        echo "Usage: Please specify fasta input on command line"
        exit
fi

#exit program with error if file does not exist
if [ $# != 1 ]; then
        echo "File Not Found"
        exit
fi

#seperate the sequence from the seqname and give number of sequence
seqname=($(grep -v '>' $1))
seqnum=${#seqname[@]}

#create output file GCcount
echo "SequenceName" "GCPercentage" >GCcount.txt

#print the sequence name
name=($(grep '>' $1 | sed 's/>//g'))

#setup a for loop to interate as many times as sequence number
for ((i=0; i<$seqnum; i++))
do

#read the sequence and calculate the number/totalnumber of sites
#matching G or C
#echo array count and total
array1=${seqname[$i]}
count=`echo "$array1" | grep -o "[GC]" | wc -l`
total=`echo "$array1" | wc -m`

#calculate the percentage of sites containing G or C
GCPercentage=`expr 100 \* $count / $total`

#print the sequence name to the output
array2=${name[$i]}
echo "$array2  $GCPercentage" >> GCcount.txt

done
