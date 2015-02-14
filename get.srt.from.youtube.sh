#!/bin/bash

google youtube list > info.youtube.txt

for i in  $(ls | grep mp4 | cut -d "." -f 1); do

cat info.youtube.txt | grep "$i" >> info.current.video.txt

done

cat info.current.video.txt | cut -d ',' -f 2 > link.current.video.txt

for i in $(cat link.current.video.txt); do

youtube-dl  --skip-download  --write-auto-sub "$i" -o '%(title)s.%(ext)s'

done
