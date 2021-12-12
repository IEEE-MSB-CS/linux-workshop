#!/bin/bash
# demo of reading and writing to a file using file descriptor

echo "Enter a file name to read: "
read FILE

exec 5<>$FILE
while read -r SUPERHERO; do
    echo "Superhero Name: $SUPERHERO"
done <&5

echo "This file was Read On: `date`" >&5
# you have to give the & when using the file descriptor
# You don't have to close the file descriptor, but it's a best practice to close it after using it, to free the file descriptor for another files 

exec 5>&- #the syntax of closing