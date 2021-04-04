#!/bin/bash


if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` OUTDIR"
  exit 65
fi
outdir=${1%/}
cd $outdir
ffmpeg -pattern_type glob -i "*.jpg" -qscale 0 -r 20 -s hd720 -vcodec libx264 -crf 25 ./timelapse.mp4
exit 1
