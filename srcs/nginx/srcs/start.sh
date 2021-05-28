#!/bin/sh
rc default
# rc-service sshd start
# ssh keygen
# rc-service sshd stop
# rc-service nginx start
ssh-keygen -A

mkdir welcome
touch welcome/index.html

echo "Currently you are in NGINX service" > welcome/index.html
echo "To go to WORDPRESS service add /wordpress to ip-adress" >> welcome/index.html
echo "To go to PHPMYADMIN service add /phpmyadmin to ip-address" >> welcome/index.html


# /telegraf-1.17.2/usr/bin/telegraf --config /telegraf.config 
# sh
