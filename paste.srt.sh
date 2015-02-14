#!/bin/bash

for i in *.srt; do 

paste -d '\n' "$i".txt "$i".rus.txt | sed -e ':a;/^$/N;/\n$/{D;ba}'  > "$i".lang.txt

done
