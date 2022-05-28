ifconfig wlan0 up
sleep 5

wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf
iw wlan0 link
udhcpc -i wlan0
ping www.baidu.com -c 4