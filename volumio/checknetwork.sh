#!/bin/bash

#sudo chmod +x /etc/network/if-down.d/checknetwork.sh

#export PATH=/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

ping_count() {
    count=0
    `timeout 5 ping 192.168.1.1 | while read LINE; do
    {
        if [[ "${LINE}" =~ "64 bytes from" ]]; then
            let "count = $count + 1"
            echo "export count=$count"
        fi
    }
    done`
echo $count
}

#echo $(ping_count)

if [[ $(ping_count) < 1 ]]; then
    #ifconfig wlan0
    #ifconfig wlan0 down
    #sleep 1
    #ifconfig wlan0 up
    #sleep 1
    #netcfg -r wlan0
    #sleep 5
    echo "Error: network is down , restarting network now..."
    /etc/init.d/networking restart
    /sbin/ifup wlan0
    /sbin/ifup eth0
    sleep 5
    if [[ $(ping_count) < 1 ]]; then
        echo "Fatal error: wifi is down , rebooting now..."
        reboot
    fi
fi
