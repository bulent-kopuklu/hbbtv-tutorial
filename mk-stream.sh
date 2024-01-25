#!/usr/bin/env bash

INPUT1="media/video.mpg"

mkdir -p output

ffmpeg -i $INPUT1 -an -vcodec mpeg2video -f mpeg2video -b 5000k -maxrate 5000k -minrate 5000k -bf 2 -bufsize 1835008 -y output/video1.mp2
opencaster/bin/esvideompeg2pes output/video1.mp2 > output/video1.pes
opencaster/bin/pesvideo2ts 2064 25 112 5270000 0 output/video1.pes > output/video1.ts
rm output/video1.pes
rm output/video1.mp2


ffmpeg -i $INPUT1 -ac 2 -vn -acodec mp2 -f mp2 -ab 128000 -ar 48000 -y output/audio1.mp2
opencaster/bin/esaudio2pes output/audio1.mp2 1152 48000 768 -1 3600 > output/audio1.pes
opencaster/bin/pesaudio2ts 2065 1152 48000 768 -1 output/audio1.pes > output/audio1.ts
rm output/audio1.pes
rm output/audio1.mp2

python hbbtv-http.py


opencaster/bin/tscbrmuxer \
    c:2300000 output/video1.ts b:188000 output/audio1.ts \
    b:3008 output/pat.ts b:3008 output/pmt.ts b:1400 output/nit.ts b:1500 output/sdt.ts b:1400 output/ait.ts > output/final.ts
