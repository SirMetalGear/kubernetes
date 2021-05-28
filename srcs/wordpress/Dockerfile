FROM alpine:3.12
RUN apk update && apk upgrade
RUN	apk add nginx openssl curl supervisor php7 php7-fpm  libc6-compat
RUN	apk add php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN curl -O https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz && rm latest.tar.gz
RUN curl -O https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./srcs/telegraf.config .
COPY ./srcs/wp-config.php ./wordpress/wp-config.php
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/default /etc/nginx/conf.d/default.conf
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/domain.key -x509 -days 365 -out /etc/nginx/domain.crt -subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=school21/CN=mlorette"
RUN mkdir -p /run/nginx
EXPOSE 5050
CMD /usr/bin/supervisord -c /etc/supervisord.conf