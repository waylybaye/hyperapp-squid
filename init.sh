#!/bin/sh

if [ -n "$PORT" ];then
  PORT="http_port $PORT"
  echo $PORT
  sed -i "2c$PORT" /etc/squid/squid.conf
fi

if [ -n "$DOMIAN" ];then
  DOMIAN="visible_hostname $DOMIAN"
  echo $DOMIAN
  sed -i "3c$DOMIAN" /etc/squid/squid.conf
fi

if [ -n "$ONLYV4" ];then
  ONLYV4="dns_v4_first $ONLYV4"
  echo $ONLYV4
  sed -i "4c$ONLYV4" /etc/squid/squid.conf
fi

if [ -n "$WORDS" ];then
  WORDS="auth_param basic realm $WORDS"
  echo $WORDS
  sed -i "55c$WORDS" /etc/squid/squid.conf
fi


mkdir /var/spool/squid

htpasswd -bc /usr/etc/passwd "${SQUID_USERNAME}" "${SQUID_PASSWORD}"
CHOWN=$(/usr/bin/which chown)
SQUID=$(/usr/bin/which squid)
"$CHOWN" -R squid:squid /var/cache/squid
"$CHOWN" -R squid:squid /var/log/squid
#squid -z
#sleep 15
squid -N -d1
#exec tail -F /var/log/squid/cache.log
