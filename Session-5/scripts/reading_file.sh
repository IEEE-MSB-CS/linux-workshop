#!/bin/bash
# Reading non-binary file

echo "Enter the file you want to read"
read FILE

# -r for reading line
while read -r SUPERHERO; do 
    echo "Superhero name: $SUPERHERO";
done < "$FILE"