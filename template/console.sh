#!/bin/bash
if [ "$1" == "start" ] && [ "$(screen -ls | grep -o 'spigot')" != 'spigot' ]
then
    screen -dmS spigot
    sleep 0.5
    screen -S spigot -X stuff "sh serve.sh\n"

elif [ "$1" == "kill" ]
then
    if [ "$2" != "hard" ]
    then
        screen -S spigot -X stuff "stop\n"
        echo "Stopping spigot and killing the screen... (approx. 10sec)"
        sleep 10
    fi
    screen -X -S spigot kill\
else
    screen -r spigot
fi

