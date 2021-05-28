FROM alpine:3.12
RUN apk update && apk upgrade
RUN	apk add supervisor vsftpd openssl openrc curl libc6-compat
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/start.sh .
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/private/vsftpd.pem -subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=school21/CN=mlorette"
RUN curl -O https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./srcs/telegraf.config .
RUN mkdir -p /var/ftp
RUN chmod 555 /var/ftp/
RUN chown ftp.ftp /var/ftp/
RUN mkdir -p /mlorette
RUN mkdir -p /var/ftp/mlorette
RUN adduser -D -h /var/ftp mlorette
RUN echo mlorette:password | chpasswd
RUN chmod 777 /var/ftp/mlorette/
RUN chmod +x start.sh
RUN mkdir -p /run/nginx
EXPOSE 21 21000
CMD sh start.sh