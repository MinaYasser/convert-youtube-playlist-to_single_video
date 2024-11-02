#!/bin/bash

url=$1
[ -d you_folder ] || mkdir you_folder
cd you_folder || exit
yt-dlp "$url"
for i in *
do 
echo "file '$i' ">>list.txt
done
ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp4

shopt -s extglob
rm !(output.mp4)
