#!/bin/bash
# demo of return values and testing results

# global variable

YES=1
N0=1
FIRST=$1
SECOND=$2
THIRD=$3

# function definition - start

# check the command line parameters passed in

funcCheckParms(){
    # did we get three
    if [ ! -z "$THIRD" ]; then
        echo "We got three parms.."
        return $YES
    else
        echo "we did not get three parms"
        return $NO
    fi
}

funcCheckParms
RETURN_VALS=$?

if [ "$RETURN_VALS" -eq "$YES" ]; then
    echo "We received three parms and they are: "
    echo "Parm 1: $FIRST"
    echo "Parm 2: $SECOND"
    echo "Parm 3: $THIRD"
    echo ""
else
    echo "Usage: returnval.sh [parm1] [parm2] [parm3]"
    exit 1
fi
