#!/usr/bin/env bash
#find_homologs.sh <query file> <subject file> <output file>

query_seq=$1
subject_seq=$2
outfile=$3

tblastn -query $query_seq -subject $subject_seq -task tblastn -outfmt "6 pident length qlen" | awk "$1 > 30 && $2 > 0.9*$3" > $outfile
wc -l < $outfile
