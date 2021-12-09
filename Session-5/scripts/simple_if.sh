#!/bin/bash
# simple demo [If Statement]

echo "Guess the number"
echo ""
echo "Enter a number between 1 and 5"
read GUESS 
if [ $GUESS -eq 3 ] 
    then
        echo "You Guess the correct number!"
fi



# you must use a space before and after closing/opening the brackts

# tests for existence of indicated file name

FILENAME=$1
echo "testing for the existence of a file called $FILENAME and readable"
# -e or -a or -f (test for exitence for "regular" file) -r(readable)
if [ -a $FILENAME ] && [-r $FILENAME]
    then   
        echo "File $FILENAME Does Indeed Exist and both readable!"
fi 

clear
# else and nested if 
echo "Enter a number between 1 and 3"
read VALUE
if [ "$VALUE" -eq 1 ] 2>/dev/null || [ "$VALUE" -eq 2] 2> /dev/null || [ "$VALUE" -eq 3] 2> /dev/null; then
    echo "you enterd $VALUE"
else 
    echo "You didn't follow directions!"
fi

## elif
if ["something"]; then
    echo "something"
elif ["anothersomething"];then
    echo "another"
elif ["another"];then
    echo "you Successfully another";
else
    echo "you entererd "
fi