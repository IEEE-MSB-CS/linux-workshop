#!/bin/bash
# this demo demonstrate nested functions

gender=$1
funcHuman(){
    arms=2
    legs=2
        funcMale(){
            beard=1
            echo "this man has $arms argms and $legs, with $beard beards(s).."
            echo ""
        }
        funcFemale(){
            beard=0
            echo "this woman has $arms and $legs. with $beard beard(s)..."
            echo ""
        }
}

clear
echo "Demonstrating the characterstics of the gender $gender"
echo ""

# determin the actual gender and display it.
if [ "$gender" == "male" ]; then
    funcHuman
    funcMale
else
    funcHuman
    funcFemale
fi
