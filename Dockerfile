FROM openresty/openresty:alpine-fat

RUN apk add --no-cache git bash curl unzip
RUN luarocks install lua-resty-prometheus

EXPOSE 80

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
