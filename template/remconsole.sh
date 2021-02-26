#!/bin/bash
command = "$@"
if [ "$1" != "restart" ]
then
    ssh -i main_key.pem -p 443 ubuntu@13.48.90.95 "sudo screen -S spigot -X stuff \"$@\n\""
else
    ssh -i main_key.pem -p 443 ubuntu@13.48.90.95 "bash ${spdir}/console.sh restart"
fi