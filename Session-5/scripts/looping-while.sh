#!/bin/bash
# while loop example

echo "Enter the number you want to print \"Hello world \" ";
read N;
COUNT=1;
while [ $COUNT -le $N ];do
    echo "Hello world - $COUNT";
    COUNT="`expr $COUNT + 1`";
done 