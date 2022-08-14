# Creating the directories "DevOps1" and "DevOps2" in the current directory
New-Item -Name "DevOps1" -ItemType "directory"
New-Item -Name "DevOps2" -ItemType "directory"

# Creating a file named "aws.txt" that contains "Welcome to AWS" to "DevOps1" folder
New-Item -Path ".\DevOps1" -Name "aws.txt" -ItemType "file" -Value "Welcome to AWS"

# Coping "aws.txt" to "DevOps2" folder
Copy-Item -Path ".\DevOps1\aws.txt" -Destination ".\DevOps2" -Recurse

# Deleting the directory "DevOps2"
Remove-Item -Path ".\DevOps2"