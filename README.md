# hyperapp-squid


:warning: :warning: :warning: If you want to customize squid.conf, PLEASE ADD TO the ENDING of the file.


A simple (and fragile) Dockerfile for launching an authenticated squid proxy.

The user must specify authentication credentials via the following environment variables:

```
SQUID_USERNAME=foo
SQUID_PASSWORD=bar
```

An example command would be:

```
docker run -e SQUID_USERNAME=foo -e SQUID_PASSWORD=bar -p 3128:3128 hyperapp/squid
```

There are some optional environment variables:

```
PORT=3128
DOMIAN=example.com
ONLYV4=on
WORDS=Welcome!
```

If you want Squid to listen on the loaclhost, the command would be:

```
docker run -e SQUID_USERNAME=foo -e SQUID_PASSWORD=bar -e PORT=127.0.0.1:3128 -p 3128:3128 hyperapp/squid
```

If your VPS have IPV6 address, you can turn the option off, the command would be:

```
docker run -e SQUID_USERNAME=foo -e SQUID_PASSWORD=bar -e ONLYV4=off -p 3128:3128 hyperapp/squid
```

Add simple auth.
With some added performance improvements and transparency settings.
Delete the headers that will be used in spoofing.
Latest version of Squid.

Uses Alpine Linux.

Details
=======

Environment variables
---------------------

* SQUID_USERNAME
* SQUID_PASSWORD
* PORT
* DOMIAN
* ONLYV4
* WORDS

Ports
-----

* 3128

Volumes
-------

* `/var/log/squid`

Ideas for Improvement
=====================
* Output logs to stdout.

