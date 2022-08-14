#!/bin/bash

# Take user Input
echo -n "Input first number: "
read  a
echo -n "Input second number: "
read  b

# Input type of operation
echo "1) addition       3) multiplication       5) exit"
echo "2) subtraction    4) division"

# while loop to read user input
while true
do
    echo -n "Select the operation: "
    read ch
    
    # Switch Case to perform
    # calculator operations
    case $ch in
        1)
            res=`echo "$a+$b" | bc`
        ;;
        2)
            res=`echo "$a-$b" | bc`
        ;;
        3)
            res=`echo "$a*$b" | bc`
        ;;
        4)
            res=`echo "scale=2 ; $a/$b" | bc`
        ;;
        5)
            echo "Exit"
            exit 0
        ;;
        *)
            echo "ERROR: Please enter a valid number"
            exit 1
        ;;
    esac
    echo "result= $res"
done