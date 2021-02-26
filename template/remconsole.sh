#!/bin/bash
command = "$@"
if [ "$1" != "restart" ]
then
    ssh -i $(pwd)/main_key.pem -p 443 ubuntu@13.48.90.95 "sudo screen -S spigot -X stuff \"$@\n\""
else
    ssh -i $(pwd)/main_key.pem -p 443 ubuntu@13.48.90.95 "sh $(pwd)/restart.sh"
