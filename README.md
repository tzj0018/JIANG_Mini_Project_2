## JIANG_Mini_Project_2

In this project, I wrote a script to read in the file **ADH.sh** and calculate the percentage of **GC content** in each sequence using a loop.

### Step 1
First I used a _if_ statement to do a sanity check to see whether the user specify a file in the command line or not. If not, it will exit program and display an error message. Also, a script was wrote to check whether the file exists or not. If not, it will exit the program and display an error message stating the file does not exit.

```bash
#! /bin/bash                                                                   
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
```

### Step 2
After that, the program will separate the sequence name from sequence. Also, the variable name and the number of sequence were assigned to seqname and seqnum respectively. After assigning those variables, I redirected a header to a new output file **GCcount.txt**.

```bash
#seperate the sequence from the seqname and give number of sequence
seqname=($(grep -v '>' $1))
seqnum=${#seqname[@]}
#create output file GCcount
echo "SequenceName" "GCPercentage" >GCcount.txt
```
### Step 3
Then I construced a _for loop_ to determined the **GC content** in those sequences. The loop was designed to iterate as manytimes as the amount of sequences. In the loop, I used _grep_ function as well as _array_ to make it more organized.

```bash
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
```
### Step4
After getting the amount of each base in the sequence. The amount of sites containg **G** and **C** and the total amount of sites in the sequence was determined, while the percentage of the **GC** in the sequence was caculated. Then, I got the percentage of **GC** in the sequence and redirected the output of the loop to add the output to file _GCcount.txt_. 

```bash
#calculate the percentage of sites containing G or C
GCPercentage=`expr 100 \* $count / $total`
#print the sequence name and GCPercentage to the output
array2=${name[$i]}
echo "$array2  $GCPercentage" >> GCcount.txt
done
```
The results are showed ias following:
#### Output table:

|Sequence      |	GCpercentage|
|--------------|-------------|
|DI245396.1    |	43.64|
|HW262829.1    |	43.64|
|546218138     |	42.56|
|X13802.1      |	39.21|
|NM_001179558.3|	51.51|
|NM_001178613.2|	45.37|
|AY558240.1    |	51.51|
|AB052924.1    |	51.51|
