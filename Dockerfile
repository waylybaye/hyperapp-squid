FROM alpine
MAINTAINER HyperApp <HyperAppCloud@gmail.com>

RUN apk add --no-cache --update squid

EXPOSE 3128
VOLUME /etc/squid

CMD squid -N
