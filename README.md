###### start command

```shell
root@stm32mp1:~# ps -aux | grep launcher.py
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root      1196  4.1  7.0  74820 30356 tty7     Sl+  10:44   0:03 /usr/bin/python3 /usr/local/demo/demo_launcher.py
```

###### operation

```shell
root@stm32mp1:/usr/local/weston-start-at-startup# cat start_up_demo_launcher.sh
#!/bin/sh
# found card
cards=`pacmd list-cards |  egrep -i 'alsa.card_name' | sed 's/ //g'| sed 's/alsa.card_name=\"//g'| sed 's/\"//g'`
index=0
for i in $cards;
do
        found=`echo $i | grep -n STM32MP | wc -l`
        if [ $found -eq 0  ];
        then
                su.util-linux -l root -c 'pacmd set-card-profile $index output:analog-stereo'
        fi
        index=$((index+1))
done

/usr/local/demo/demo_launcher.py
```



```shell
root@stm32mp1:/usr/local/demo# ls -l demo_launcher.py
-rwxr-xr-x 1 root root 32831 Sep 15  2021 demo_launcher.py
```



###### weston.ini

```shell
root@stm32mp1:/etc/xdg/weston# ls -l
total 4
-rw-r--r-- 1 root root 2220 Sep 15  2021 weston.ini
```

