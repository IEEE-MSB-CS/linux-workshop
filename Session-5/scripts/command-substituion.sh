#!/bin/bash
# This script is intended to show how to do simple substitution
shopt -s expand_aliases
alias TODAY="date"
alias UFILES="find /home -user user"
TODAYSDATE=`date`
USERFILES=`find /home -user yousef`

A=`TODAY`
b=`UFILES`
# echo "Today's Date: $TODAYSDATE"
echo "Today's Date: $A"

# echo "All files owned by USER: $USERFILES"
echo "All files owned by USER: $B"
