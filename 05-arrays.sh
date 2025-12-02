#!/bin/bash

MOVIES=("RRR" "PUSHPA" "SALAR" "BHAHUBALI")

echo "First movie is : ${MOVIES[0]}"
echo "Second movie is : ${MOVIES[1]}"
echo "Third movie is : ${MOVIES[2]}"
echo "Fourth movie is : ${MOVIES[3]}"
echo "All movie are : ${MOVIES[@]}" # print all the moviess
echo "Length of movie list  : ${#MOVIES[@]}" # length of array 