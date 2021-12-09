#!/bin/bash
echo "List all the shell scripts contens of the directory"

SHELLSCRIPT=`ls *.sh`

for SCRIPT in "$SHELLSCRIPTS"; do
    DISPLAY="`cat $SCRIPT`";
    echo "File: $SCRIPT - Contentes $DISPLAY" > output-shell.txt
done

