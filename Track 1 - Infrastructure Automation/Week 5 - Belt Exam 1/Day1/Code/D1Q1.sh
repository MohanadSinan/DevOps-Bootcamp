#!/bin/bash

# Creating a user with the name user1
sudo useradd user1

# Switching to user1
sudo su user1

# Assigning the environment variable "DB _ URL"
export DB_URL="The value of DB_URL variable"

# Checking the environment variable "DB _ URL"
echo $DB_URL