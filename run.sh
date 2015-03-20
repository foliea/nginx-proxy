#!/bin/sh
set -e

format_http() {
    echo "http:$(echo $1 | cut -d':' -f 2,3)"
}

target="/etc/nginx/nginx.conf"

if [ -z "$WEB_URL" ]; then
    echo "Web URL not set, trying to resolve link web..."

    WEB_URL=$(format_http $WEB_PORT)
fi

if [ -z "$WS_URL" ]; then
    echo "Websocket URL not set, trying to resolve link ws..."

    WS_URL=$(format_http $WS_PORT)
fi

if [ "$SSL" = 1 ]; then
    mv nginx_ssl.conf $target
else
    mv nginx.conf $target
fi

WEB_URL=$WEB_URL WS_URL=$WS_URL ep -v $target -- /usr/sbin/nginx
