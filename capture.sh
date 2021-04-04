#!/bin/bash

# This script will make a timelapse video from a Foscam camera by
# downloading the snapshot image repeatedly for 10 hours.
# Note:  This was put together hastily and I'm sure the ffmpeg
# options or framerate could be improved.


cameraip=192.168.0.241:88
user=nadmin
pwd=74xM3LafP3Lw

start=$(date +%s)
end=$(date +%s)

outdir=$(date  +%Y%m%d)
mkdir -p ~/foscam_capture/$outdir
cd ~/foscam_capture/$outdir
doexit=0
trap ctrl_c INT
function ctrl_c() {
  if [ $doexit -eq 1 ]; then
    exit 1
  fi

  doexit=1
  exit 1
}


while [ $(( $end - $start )) -lt $((10 * 60 * 60)) ]; do
    ffmpeg -loglevel quiet -y -rtsp_transport tcp -i "rtsp://${user}:${pwd}@${cameraip}/videoMain" -vsync 2 -frames:v 1 -strftime 1 "%Y-%m-%d_%H-%M-%S.jpg"
    end=$(date +%s)
done
