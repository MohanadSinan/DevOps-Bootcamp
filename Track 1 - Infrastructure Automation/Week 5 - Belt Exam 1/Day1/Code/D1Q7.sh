#!/bin/bash

# Creating "function1" that return a string and then call "function2"
function1() {
    echo "This is from the first function"
    function2
}

# Creating "function2" that only return a string
function2() {
    echo "This is from the second function"
}

# Calling the "function1"
function1