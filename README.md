# nginx-proxy

This repository contains `Dockerfile` of `nginx-proxy` for docker's automated build
published to the public docker hub registry.

Proxy a specific port to both your webserver and websocket server with
[Nginx](http://nginx.com/) inside a Docker container.

## Base Docker Image

* [Nginx](https://registry.hub.docker.com/_/nginx/)

## Sources

* [GitHub](https://github.com/folieadrien/nginx-proxy)

## Installation

1. Install [docker](http://www.docker.com).

2. Download [automated build](https://registry.hub.docker.com/u/folieadrien/nginx-proxy) from public
[docker hub registry](https://registry.hub.docker.com/):

    `docker pull folieadrien/nginx-proxy`

## Usage

    docker run -e WEB_URL="http://<docker host ip>:3000" \
               -e WS_URL="http://<docker host ip>:8080" \
               -d -p 80:80 folieadrien/nginx-proxy

## Environment variables

You can customize this container with environment variables:

* `WORKERS`: Worker connections (default: `1024`).
* `SERVER_NAME`: Server name (default: `MyServer`).
* `PORT`: Port to serve (default: `80`).
* `WEB_URL`: Webserver url to proxy (**must be specified**).
* `WS_URL`: Websocket server to proxy (**must be specified**).
* `WS_ROUTE`: Websocket route to proxy (default: `socket.io`).
