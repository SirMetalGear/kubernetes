FROM alpine:3.12
RUN apk update && apk upgrade
RUN	apk add curl libc6-compat supervisor
RUN curl -O https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz && tar -zxvf grafana-7.3.7.linux-amd64.tar.gz --strip-components 1
RUN curl -O https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./srcs/telegraf.config .
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/grafana.db /data/grafana.db
EXPOSE 3000
CMD /usr/bin/supervisord -c /etc/supervisord.conf