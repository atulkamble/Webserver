#!/bin/bash
yum update -y
yum install httpd git -y

systemctl start httpd
systemctl enable httpd

usermod -a -G apache ec2-user
chmod 775 /var/www/html
chown -R ec2-user:apache /var/www/html

cd /var/www/html
git clone https://github.com/atulkamble/pong-game.git
mv pong-game/* .
rm -rf pong-game
