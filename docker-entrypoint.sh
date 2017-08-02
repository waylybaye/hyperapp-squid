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

htpasswd -bc /usr/etc/passwd "${USERNAME}" "${PASSWORD}"
CHOWN=$(/usr/bin/which chown)
SQUID=$(/usr/bin/which squid)
"$CHOWN" -R squid:squid /var/cache/squid
"$CHOWN" -R squid:squid /var/log/squid

#sleep 15
#exec tail -F /var/log/squid/cache.log

if [ ! -f  /var/spool/squid ]; then 
  echo "initializing spool ..."
  mkdir /var/spool/squid
fi

if [ ! -f  /var/cache/squid ]; then 
  echo "initializing cache ..."
  squid -zN
fi

echo "starting ... $@"
exec "$@"

