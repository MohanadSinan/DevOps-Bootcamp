#!/bin/bash

# Creating directories "DevOps1" and "DevOps2"
mkdir DevOps1
mkdir DevOps2

# Change the directory to "DevOps1" folder
cd DevOps1

# Creating a file named "aws.txt" that contains "Welcome to AWS"
touch aws.txt
echo Welcome to AWS > aws.txt

# Coping "aws.txt" file to "DevOps2" folder
cp aws.txt ../DevOps2

# Go back
cd ..

# Deleting the directory "DevOps2"
rm -r DevOps2