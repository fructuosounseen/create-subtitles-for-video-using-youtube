#!/bin/bash

#The script creates a folder good.subtitles, reads log.download.txt.
#Searches for lines containing the string Writing, forwards the matching string good.video.txt.
#Reads good.video.txt extracts from 6 column, and redirects it to the good.subtitles.txt.
#The cycle passes successively through all the rows in good.subtitles.txt and moves all files with the same name in the folder good.subtitles.

mkdir -p good.subtitles

cat log.download.txt | grep W
riting > good.video.txt

cat good.video.txt | cut -d " " -f 6 > good.subtitles.txt

for i in $(cat good.subtitles.txt); do

j=$(echo $i | cut -d "." -f 1)

mv "$j".* good.subtitles

done


