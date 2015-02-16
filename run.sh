#!/bin/sh
set -e

nginx_conf="/etc/nginx/nginx.conf"
allow="/etc/nginx/allow.conf"

if [ "$SSL" = "on" ]; then
    mv nginx_ssl.conf $nginx_conf
else
    mv nginx.conf $nginx_conf
fi

allow_origin="/config/allow.conf"
allow_target="/etc/nginx/allow.conf"

# If user add a custom allow file
if [ -f $allow_origin ]; then
    mv $allow_origin $allow_target
fi

ep -v $nginx_conf -- /usr/sbin/nginx
