#!/bin/bash
command = "$@"
if [ "$1" != restart ]
then
    echo "$@"
    ssh -i main_key.pem -p 443 ubuntu@IPADDRESS "cd $(pwd);sudo screen -S spigot -X stuff \"$@\n\""
else
    echo "Restarting"
    ssh -i main_key.pem -p 443 ubuntu@IPADDRESS "cd $(pwd); sudo bash /home/ubuntu/spigot/console.sh restart"
fi
