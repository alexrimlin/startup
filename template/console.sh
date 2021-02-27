#!/bin/bash
if [ "$1" == "start" ] && [ "$(screen -ls | grep -o 'spigot')" != 'spigot' ]
then
    screen -dmS spigot -L -Logfile screen.log
    echo "Starting spigot..."
    screen -S spigot -X stuff "sh serve.sh\n"
    echo $(tail -f -n 1 screen.log | grep -m 1 ": Done")

elif [ "$1" == "kill" ]
then
    if [ "$2" != "hard" ]
    then
        screen -S spigot -X stuff "stop\n"
        echo "Stopping spigot and killing the screen... (approx. 10sec)"
        echo $(tail -f -n 1 screen.log | grep -m 1 "DIM1")
    fi
    screen -X -S spigot kill
elif [ "$1" == "restart" ]
then
    screen -S spigot -X stuff "stop\n"
    echo "Stopping spigot..."
    echo $(tail -f -n 1 screen.log | grep -m 1 "DIM1")
    echo "Starting spigot..."
    screen -S spigot -X stuff "sh serve.sh\n"
    echo $(tail -f -n 1 screen.log | grep -m 1 ":Done")
else
    screen -r spigot
fi
