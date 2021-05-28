FROM alpine:3.12
RUN apk update && apk upgrade
RUN	apk add nginx openssl openssh supervisor openrc curl libc6-compat
RUN curl -O https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./srcs/telegraf.config .
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/default /etc/nginx/conf.d/default.conf
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/domain.key -x509 -days 365 -out /etc/nginx/domain.crt -subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=school21/CN=mlorette"
# RUN ssh-keygen -f /root/.ssh/id_rsa.pub -e -m RFC4716 > /root/.ssh/id_ssh2.pem
RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
COPY ./srcs/sshd_config /etc/ssh/sshd_config
# RUN ssh-keygen -f /root/.ssh/id_rda -t rsa -N ''
RUN echo "root:password" | chpasswd
COPY ./srcs/start.sh .
RUN chmod +x start.sh
RUN mkdir -p /run/nginx
RUN ./start.sh
EXPOSE 80 443 22
CMD /usr/bin/supervisord -c /etc/supervisord.conf