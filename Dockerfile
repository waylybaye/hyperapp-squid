FROM alpine
MAINTAINER HyperApp <HyperAppCloud@gmail.com>

RUN apk add --no-cache --update squid \
    && rm -rf /var/cache/apk/* 

EXPOSE 3128
VOLUME /etc/squid

CMD squid -N
