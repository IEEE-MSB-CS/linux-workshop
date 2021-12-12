#!/bin/bash
# delimiter example using IFS

echo "Enter a file name to parse: "
read FILE

echo "Enter the Delimter: "
read DELIM

IFS="$DELIM"

while read -r CPU MEMORY DISK; do
    echo "CPU: $CPU"
    echo "Memory: $MEMORY"
    echo "DISK: $DISK"
done <"$FILE"