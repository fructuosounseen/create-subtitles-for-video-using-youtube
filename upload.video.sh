#!/bin/bash

for i in *.mp4; do

google youtube post --category Education --access unlisted "$i"

sleep 10

done

echo "YouTube long time create subtitles. Check subtitles at the next day"