#!/bin/bash

#The script looks in the current directory with the script files with the extension mp4 and consistently to each file uses the command.
#Next google youtube list - shows a list of videos on your channel.
#google youtube list > info.youtube.txt - redirects the output info.youtube.txt.
#Sleep is inserted, because Youtube is blocking requests are too frequent.
#Next cut divides the text into 2 parts, using the delimiter is a comma, and the second part redirects to a file info.current.video.txt.
#The script reads info.current.video.txt and sequentially to each row applies the command. Youtube-dl in this command downloads the subtitles.

google youtube list > info.youtube.txt

rm -f info.current.video.txt

for i in  $(ls | grep mp4 | cut -d "." -f 1); do

cat info.youtube.txt | grep "$i" >> info.current.video.txt

done

rm -f log.download.txt

cat info.current.video.txt | cut -d ',' -f 2 > link.current.video.txt

for i in $(cat link.current.video.txt); do

youtube-dl  --skip-download  --write-auto-sub "$i" -o '%(title)s.%(ext)s' &>> log.download.txt

done
