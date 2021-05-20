#!/bin/sh
# vim:sw=4:ts=4:et

set -e
DOMAIN="${domain:=xx.yunplus.io}"
echo -e "server {\n  listen       80;\n  server_name   ${DOMAIN};\n  location ~ /.well-known/acme-challenge/ {\n    allow all;\n   root /usr/share/nginx/html;\n  }\n}" > /etc/nginx/conf.d/ssl.conf
cat /etc/nginx/conf.d/ssl.conf
exec "$@"