echo "* * * Video Player by GStreamer * * *"

for item in `ls *.mp4`
do
	echo "Now Play Video --> [${item}]"
	gst-launch-1.0 playbin uri=file:///home/root/Video/${item}
	echo -e "- - - End - - -\r\n"
done
