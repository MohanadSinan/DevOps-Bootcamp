#!/bin/bash

# [1]
# Creating a directory named Docker-Folder
mkdir Docker-Folder

# Creating a file named Dockerfile
touch Dockerfile

# Creating a group
groupadd CodingDojo

# Creating 5 users and adding the new users to "CodingDojo" group
for i in {1..5}
do
useradd user$i -g CodingDojo
done

# Add permesions to users in CodingDojo group to access Docker-Folder
setfacl g:CodingDojo:rwx -R /Docker-Folder


# [2]
# Create a cron job that will run two times in an hour. (At minute 0 and 30 of every hour)
crontab -e
0,30 * * * * /fileName.sh


# [3]
# Looking for a file name Dockerfile if it doesn't exist creating a new file.
if [[ ! -e Dockerfile ]]
then
touch Dockerfile && echo "A file named Dockerfile created."
else
echo "Dockerfile file is already exists on your filesystem."
fi
