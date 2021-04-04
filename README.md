# Foscam Timelapse

I borrowed the original script from this gist:
https://gist.github.com/bgerm/5814847
Then I changed it to suit my needs which were:
* run from crontab
* run for 10 hours
* capture continuously during that time
* generate output in datestamped files and directories
* separate script for generating timelapse video files



This tool was very helpful in tuning the RTSP URL for my camera.
https://www.ispyconnect.com/camera/foscam
Your camera details should be edited in the script.

I will use this if/when I want to put it live on youtube:
https://gist.github.com/maxogden/3501352c2f01be4ed03479a75bca1a18

Particularly this:

ffmpeg -f lavfi -i anullsrc -rtsp_transport tcp -i rtsp://<source> -tune zerolatency -vcodec copy -b 12000000 -pix_fmt + -c:v copy -c:a aac -strict experimental -f flv rtmp://a.rtmp.youtube.com/live2/<key>

TEST URL http://192.168.0.241:88/cgi-bin/CGIProxy.fcgi?cmd=snapPicture&usr=nadmin&pwd=74xM3LafP3Lw&count=0
http://manpages.org/ffmpeg#options
