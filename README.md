# nginx-proxy
[![foliea/nginx-proxy](http://dockeri.co/image/foliea/nginx-proxy)](https://registry.hub.docker.com/u/foliea/nginx-proxy/)

This repository contains `Dockerfile` of `nginx-proxy` for docker's automated build
published to the public docker hub registry.

Proxy a specific port to both your webserver and websocket server with
[Nginx](http://nginx.com/) inside a Docker container.

## Base Docker Image

* [Nginx](https://registry.hub.docker.com/_/nginx/)

## Sources

* [GitHub](https://github.com/foliea/nginx-proxy)

## Installation

1. Install [docker](http://www.docker.com).

2. Download [automated build](https://registry.hub.docker.com/u/foliea/nginx-proxy) from public
[docker hub registry](https://registry.hub.docker.com/):

    `docker pull foliea/nginx-proxy`

## Usage

    docker run -e WEB_URL="http://<docker host ip>:3000" \
               -e WS_URL="http://<docker host ip>:8080" \
               -d -p 80:80 foliea/nginx-proxy

You can also mount a volume with ssl certficates and use ssl:

    docker run -e WEB_URL="http://<docker host ip>:3000" \
               -e WS_URL="http://<docker host ip>:8080" \
               -e SSL=1 \
               -v <your certs directory>:/certs \
               -d -p 80:80 -p 443:443 foliea/nginx-proxy

> The path your are mounting must have both `cert.pem` and `key.pem`
certificate files inside.

You can also use Docker links instead of setting manually `WEB_URL` and
`WS_URL`:

    docker run --link="container1:web" \
               --link="container2:ws" \
               -d -p 80:80 foliea/nginx-proxy

> You must link to containers with at least one port exposed.

## Environment variables

You can customize this container with environment variables:

* `WORKERS`: Worker connections (default: `1024`).
* `SERVER_NAME`: Server domain name (e.g. `beta.42grounds.io`).
* `PORT`: Port to serve (default: `80`).
* `WS_ROUTE`: Websocket route to proxy (default: `socket.io`).
* `SSL`: Use SSL (defaults: `0`).
* `SSL_PORT`: Port to serve for SSL (default: `443`).

If you are not using Docker links:

* `WEB_URL`: Webserver url to proxy (**must be specified**).
* `WS_URL`: Websocket server to proxy (**must be specified**).
