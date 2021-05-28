#!/bin/sh
rc default
# rc-service sshd start
# ssh keygen
# rc-service sshd stop
rc-service vsftpd start
# sleep 2
# adduser -D mlorette
# password
# password
# rc-service vsftpd stop
# sh
/usr/bin/supervisord -c /etc/supervisord.conf