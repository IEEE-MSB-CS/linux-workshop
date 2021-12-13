#!/bin/bash
# simple function example

echo "starting the function definition"
funcExample() {
    echo "We are now INSIDE the function..";
}
funcExample2(){
    echo "this is an example"
}
funcExample2
funcExample 

