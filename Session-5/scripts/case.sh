#!/bin/bash
clear
echo "MAIN MENU"
echo "======"
echo "1) Choice one"
echo "2) Choice two"
echo "3) Choice three"

echo ""
echo "Enter Choice: "

read MENUCHOICE

case $MENUCHOICE in
    1) 
        echo "Congratulation for choosing the first option"
        ;; # for breaking or add it the last line (for single line only)
    2)
        echo "Choice 2 Chosen";;
    3)
        echo "Choice 3 Chosen";;
    *)
        echo "You chose unwisely";;
esac
