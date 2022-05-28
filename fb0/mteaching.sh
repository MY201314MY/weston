echo "Both mipi and ILI9341 is on show with $1"

for item in `ls *.mp4`
do
	if [ $item = $1 ]
    then
        echo "Found the video."
        gst-launch-1.0 filesrc location=/home/root/littleVGL/${1} ! decodebin ! videoconvert ! fbdevsink device=/dev/fb0 &
        gst-launch-1.0 playbin uri=file:///home/root/littleVGL/{1} &
    fi
done
