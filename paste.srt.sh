#!/bin/bash

#After each line of the script adds a row with the same sequence number from another file.
#
#Suppose there are two files: 1 and 2.
#
#The first file:
#    1st line of the 1st file
#
#    2nd line of the 1st file
#
#The Second file:
#    1st line 2nd file
#
#    2nd line of the 2nd file
#
#The result:
#
#    1st line of the 1st file
#    1st line 2nd file
#
#    2nd line of the 1st file
#    2nd line of the 2nd file

for i in *.srt; do 

paste -d '\n' "$i".txt "$i".you-lang.txt | sed -e ':a;/^$/N;/\n$/{D;ba}'  > "$i".lang.txt

done
