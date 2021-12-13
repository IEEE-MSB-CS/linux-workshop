#!/bin/bash
# demo of a simple info box with dialog and ncurses

# global variable /default values

INFOBOX=${INFOBOX=dialog}
TITLE="Default"
MESSAGE="Something to say"
XCOORD=10
YCOORD=20

funcDisplayInfoBox(){
    $INFOBOX --title "$1" --infobox "$2" "$3" "$4"
    sleep "$5s"
}

if [ "$1" == "shutdown" ];then
    funcDisplayInfoBox "WARNING!" "We are shutting down the system.." "11" "21" "5"
else
    funcDisplayInfoBox "Information.." "you are not doing anything fun.." "11" "21" "5"
    echo "not doing anything"
fi
funcDisplayInfoBox