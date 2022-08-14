#!/bin/bash

# Create groups "ec2", "rds", "lambda"
sudo groupadd ec2
sudo groupadd rds
sudo groupadd lambda

# Adding "user1" to "ec2" group
sudo useradd user1 -g ec2
# Adding "user2" to "rds" group
sudo useradd user2 -g rds
# Adding "user2" to "rds" group
sudo useradd user3 -g lambda

# Assigning passwords for users "user1", "user2", "user3"
sudo echo -e "pass1\npass1" | passwd user1
sudo echo -e "pass2\npass2" | passwd user2
sudo echo -e "pass3\npass3" | passwd user3

# Deleting "user3" from "lambda" group
sudo gpasswd -d user3 lambda

# Deleting "user2"
sudo userdel user3