#!/usr/bin/env bash
#find_homologs.sh <query file> <subject file> <output file>

query_seq=$1
subject_seq=$2
outfile=$3

tblastn -query $query_seq -subject $subject_seq -task tblastn -outfmt "6 std qlen" | awk '$3 > 30 && $4 > 0.9 * $13' > $outfile
wc -l < $outfile
