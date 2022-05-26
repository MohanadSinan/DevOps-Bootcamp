# Super user permission
sudo su

# add ten users
useradd user1
useradd user2
useradd user3
useradd user4
useradd user5
useradd user6
useradd user7
useradd user8
useradd user9
useradd user10

# add two groups
groupadd Dev
groupadd Production

# add five users to Dev group
usermod -a -G Dev user1
usermod -a -G Dev user2
usermod -a -G Dev user3
usermod -a -G Dev user4
usermod -a -G Dev user5

# add five users to Production group
usermod -a -G Production user6
usermod -a -G Production user7
usermod -a -G Production user8
usermod -a -G Production user9
usermod -a -G Production user10

# give read-only permesion to users in Production group
setfacl g:Production:r -R /foldername

# agivedd read+write+execution permesions to users in Dev group
setfacl g:Dev:r -R /foldername

# creating a directory named coding-dojo
mkdir coding-dojo

# creating a file named dojo.txt
touch dojo.txt

# showing the first 10 lines of dojo.txt
head -10 dojo.txt

# creating three files with echo command and naming them file1 file2 file3
echo I am file1 > file1
echo I am file2 > file2
echo I am file3 > file3