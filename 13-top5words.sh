#!/bin/bash

# Check if file name is provided
# if [ $# -eq 0 ]; then
#     echo "Usage: $0 <filename>"
#     exit 1
# fi

FILE=12-loops.sh

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

echo "Top 5 repeated words in $FILE:"
echo "--------------------------------"

# Process the file
cat "$FILE" | \
tr '[:upper:]' '[:lower:]' | \
tr -c '[:alnum:]' '\n' | \
grep -v '^$' | \
sort | \
uniq -c | \
sort -nr | \
head -5
