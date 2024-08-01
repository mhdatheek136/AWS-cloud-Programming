#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
wget https://github.com/mhdatheek136/sample_webpage/archive/refs/heads/master.zip
unzip master.zip
cp -r sample_webpage-master/* /var/www/html
rm -rf sample_webpage-master master.zip
systemctl enable httpd
systemctl start httpd

