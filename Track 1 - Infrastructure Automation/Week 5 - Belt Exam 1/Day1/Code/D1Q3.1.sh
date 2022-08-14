#!/bin/bash

# Creating users "user1", "user2", "user3" and assigning them passwords (using for loop)
for i in 1 2 3
do
sudo useradd user$i
echo -e "pass$i\npass$i" | passwd user$i
done

# Create groups "ec2", "rds", "lambda" (using for loop)
for i in "ec2" "rds" "lambda"
do
sudo groupadd $i
done

# Adding "user1" to "ec2" group
sudo usermod -g ec2 user1
# Adding "user2" to "rds" group
sudo usermod -g rds user2
# Adding "user3" to "lambda" group
sudo usermod -g lambda user3

# Deleting "user3" from "lambda" group
sudo gpasswd -d user3 lambda

# Deleting "user2"
sudo userdel user3