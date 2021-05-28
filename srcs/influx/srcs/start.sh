#!/bin/sh
rc default
rc-service influxdb start
sleep 3
echo "create database mydb" | influx
echo "create user mlorette with password 'password' with all privileges" | influx
echo "grant all on mydb to mlorette" | influx
rc-service influxdb stop
sleep 3
/usr/bin/supervisord -c /etc/supervisord.conf