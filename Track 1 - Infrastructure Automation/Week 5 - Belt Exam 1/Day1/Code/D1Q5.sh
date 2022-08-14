#!/bin/bash

# Printing the line "Input a number: "
echo -n "Input a number: "

# Assigning input value into a variable
read num

# If statement to compare the user input value with the number 10
if [[ $num -gt 10 ]]
then
  echo "Number is bigger than 10."
elif [[ $num -eq 10 ]]
then
  echo "Number is equal to 10."
else
  echo "Number is less than 10."
fi