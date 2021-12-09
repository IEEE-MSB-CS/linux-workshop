#!/bin/bash
# simple array list and looping for disaply
SERVERLIST=("websrv01" "websrv02" "websrv03")
COUNT=0

for INDEX in ${SERVERLIST[@]}; do
 echo "Processing Server: ${SERVERLIST[COUNT]}"
 COUNT="`expr $COUNT + 1`"
done
# @ (go as many as there are element on the array)
