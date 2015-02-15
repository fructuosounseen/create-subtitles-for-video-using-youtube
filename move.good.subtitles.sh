#!/bin/bash

mkdir -p good.subtitles

cat log.download.txt | grep Writing > good.video.txt

cat good.video.txt | cut -d " " -f 6 > good.link.txt

for i in $(cat good.link.txt); do

j=$(echo $i | cut -d "." -f 1)

mv "$j".* good.subtitles

done


