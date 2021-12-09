#!/bin/bash
# interactive script for user input
echo "Enter your first name: "
read FIRSTNAME
echo "Enter your Last Name: "
read LASTNAME
echo ""
echo "Hello $FIRSTNAME $LASTNAME"
echo "Enter your age: "
read USERAGE
echo "In 10 Years, you will be `expr $USERAGE + 10` years old."