#!/bin/bash

#The script looks in the current directory with the script files with the extension mp4 and consistently to each file applies the command to upload videos on YouTube.
#Change extension video at scripts. Current extension is mp4.

for i in *.mp4; do

google youtube post --category Education --access unlisted "$i"

sleep 10

done

echo "YouTube long time create subtitles. Check subtitles at the next day"