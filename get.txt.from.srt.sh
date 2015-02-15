#!/bin/bash

#A script that looks in the current directory with the script files with the extension srt and consistently to each file uses the command.
#The team there is a long and includes other commands.
#The main task of this script is reading the subtitles, and reformatted in the form of saving in a simple text file.
#The result is one long string without punctuation. You must place the punctuation marks.
#Result: word word word
#You need to put punctuation marks. In the result you should get something like: word. word. word.

for i in *.srt; do 

cat "$i"| grep -v "^[0-9]" |  dos2unix | sed -e '/^$/d' | sed ':a;N;$!ba;s/\n/ /g' | tr -s [:blank:] ' ' | sed -e 's/\. /\.\n /g' | sed 's/^[ \t]*//' | sed 'G;G'  > "$i".txt;

done
