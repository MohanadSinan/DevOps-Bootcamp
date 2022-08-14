#!/bin/sh
# Install Apache web server in Amazon Linux AMI with DojoJump game
sudo su
yum update -y
yum install -y httpd.x86_64
chmod -R 777 /var/www/html
cd /var/www/html
wget https://raw.githubusercontent.com/chandradeoarya/dojo-jump/master/style.css
wget https://raw.githubusercontent.com/chandradeoarya/dojo-jump/master/main.js
wget https://raw.githubusercontent.com/chandradeoarya/dojo-jump/master/index.html
systemctl start httpd.service
systemctl enable httpd.service