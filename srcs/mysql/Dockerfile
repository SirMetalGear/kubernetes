FROM alpine:3.12
RUN apk update && apk upgrade
RUN	apk add mariadb mariadb-client mysql-client openrc supervisor curl libc6-compat vim
RUN curl -O https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./srcs/telegraf.config .
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/mariadb-server.cnf .
COPY ./srcs/start.sh .
COPY ./srcs/mlor_db.sql .
RUN chmod +x start.sh
RUN mkdir -p /run/nginx
RUN chmod 777 /var/lib/mysql
# RUN ./start.sh
EXPOSE 3306
CMD sh ./start.sh