#!/bin/bash

ffmpeg -loglevel panic \
    -f lavfi -i anullsrc \
    -rtsp_transport tcp \
    -i rtsp://nadmin:74xM3LafP3Lw@192.168.0.241:88/videoMain \
     -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -g 20 -b:v 1000k \
     -bufsize 2100k \
     -f flv rtmp://a.rtmp.youtube.com/live2/jtqr-4smr-p8f2-ptg1-aw34
