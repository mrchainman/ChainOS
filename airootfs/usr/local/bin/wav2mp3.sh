#!/bin/bash
for i in *.wav; do mv "$i" ${i/ *./.}; done
for i in *.wav; do ffmpeg -i "$i" -vn -ar 44100 -ac 2 -b:a 192k ${i%.wav}.mp3; done
mv *.mp3 ../"Exports mp3"