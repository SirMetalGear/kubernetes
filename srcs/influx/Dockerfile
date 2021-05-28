FROM alpine:3.12
RUN apk update && apk upgrade
RUN	apk add influxdb curl libc6-compat supervisor openrc
RUN curl -O https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./srcs/telegraf.config .
COPY ./srcs/start.sh .
COPY ./srcs/supervisor.conf /etc/supervisord.conf
RUN mkdir /bup/
COPY ./srcs/meta.00 /bup/
COPY ./srcs/telegraf.autogen.00002.00 /bup/
RUN chmod +x start.sh
# RUN ./start.sh
EXPOSE 8086
CMD sh ./start.sh