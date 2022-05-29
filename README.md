###### start command

```shell
root@stm32mp1:~# ps -aux | grep launcher.py
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root      1196  4.1  7.0  74820 30356 tty7     Sl+  10:44   0:03 /usr/bin/python3 /usr/local/demo/demo_launcher.py
```

###### Pid

```shell
root@stm32mp1:~# ps -uef
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root      1141  0.0  5.5 126040 23960 tty7     Ssl+ 10:44   0:00 /usr/bin/weston --log=/var/log/weston.log --modules=xwayland.so
root      1151  0.0  0.7   8624  3112 tty7     S+   10:44   0:00  \_ (sd-pam) SHLVL=1 HOME=/ OLDPWD=/ TERM=linux PWD=/rootfs
root      1158  0.0  0.3   2216  1360 tty7     S+   10:44   0:00  \_ /bin/sh /usr/local/weston-start-at-startup/start_up_demo_la
root      1196  0.1  7.0  74820 30356 tty7     Sl+  10:44   0:03  |   \_ /usr/bin/python3 /usr/local/demo/demo_launcher.py USER=
root      1187  0.0  1.8  18372  7912 tty7     S+   10:44   0:00  \_ /usr/libexec/weston-keyboard USER=root MAIL=/var/spool/mail
root      1188  0.0  3.0  23564 13128 tty7     S+   10:44   0:01  \_ /usr/libexec/weston-desktop-shell USER=root MAIL=/var/spool
```

###### P&P

```shell
root@stm32mp1:~# ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root@stm32mp1:~# ps -ef | grep launcher
root      1158  1141  0 10:44 tty7     00:00:00 /bin/sh /usr/local/weston-start-at-startup/start_up_demo_launcher.sh
root      1196  1158  0 10:44 tty7     00:00:03 /usr/bin/python3 /usr/local/demo/demo_launcher.py
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

###### access

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

