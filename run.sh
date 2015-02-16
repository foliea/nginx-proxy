#!/bin/sh
set -e

target="/etc/nginx/nginx.conf"

if [ "$SSL" = "on" ]; then
    mv nginx_ssl.conf $target
else
    mv nginx.conf $target
fi

ep -v $target -- /usr/sbin/nginx
