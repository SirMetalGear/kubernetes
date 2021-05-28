#!/bin/sh
rc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
VAR=1
while [ $VAR = 1 ]
do
	echo "CREATE DATABASE IF NOT EXISTS mlor;" | mysql -uroot
	VAR=`echo $?`
	echo $VAR
done
mysql -e "create user mlorette;"
mysql -e "grant all on mlor.* to 'mlorette'@'%' identified by 'password';"
mysql -e "flush privileges;"
mysql -u root mlor < mlor_db.sql
rm -rf /etc/my.cnf.d/mariadb-server.cnf
mv mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb stop
VAR=`ps | grep mysql | wc -l`
while [[ "$VAR" != "1" ]]
do
	echo "waiting"
	VAR=`ps | grep mysql | wc -l`
	sleep 1
	if [[ $VAR = 1 ]]; then
		echo "process is terminated!"
	fi
	sleep 1
	pkill mysql
done
/usr/bin/supervisord -c /etc/supervisord.conf