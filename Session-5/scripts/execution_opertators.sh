#!/bin/bash

echo "Enter a number between 1 and 5."
read VALUE

if [ "$VALUE" -eq "1" ] || [ "$VALUE" -eq "3" ] || [ "$VALUE" -eq "3" ]; do
    echo "You entered ODD value of $VALUE"
else
    echo "you entered a value of $VALUE"
fi