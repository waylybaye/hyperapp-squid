FROM alpine:latest
MAINTAINER HyperApp <HyperAppCloud@gmail.com>

RUN apk --no-cache --update add squid>3.5.23-r0 curl apache2-utils

RUN mkdir /usr/etc
COPY squid.conf /etc/squid/squid.conf

ENV PORT 3128

EXPOSE 3128
VOLUME /var/log/squid

ADD init.sh /init.sh
CMD ["/init.sh"]
