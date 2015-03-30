#!/bin/sh
set -e

resolve_port() {
    echo $1 | cut -d':' -f 3
}

if [ -z "$WEB_URL" ]; then
    echo "Web URL not set, trying to resolve link web..."
    
    port=$(resolve_port "$WEB_PORT")
    web_url="http://web:$port"
fi

if [ -z "$WS_URL" ]; then
    echo "Websocket URL not set, trying to resolve link ws..."

    port=$(resolve_port "$WS_PORT")
    ws_url="http://ws:$port"
fi

target="/etc/nginx/nginx.conf"

if [ "$SSL" = 1 ]; then
    mv nginx_ssl.conf $target
else
    mv nginx.conf $target
fi

WEB_URL=$web_url WS_URL=$ws_url ep -v $target -- /usr/sbin/nginx
