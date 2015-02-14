#!/bin/bash

for i in *.srt; do 

cat "$i"| grep -v "^[0-9]" |  dos2unix | sed -e '/^$/d' | sed ':a;N;$!ba;s/\n/ /g' | tr -s [:blank:] ' ' | sed -e 's/\. /\.\n /g' | sed 's/^[ \t]*//' | sed 'G;G'  > "$i".txt;

done
