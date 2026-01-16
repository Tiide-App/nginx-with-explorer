FROM openresty/openresty:alpine

RUN apk add --no-cache \
        bash \
        curl \
        git \
        luarocks \
        unzip \
        && luarocks install lua-resty-prometheus

EXPOSE 80
EXPOSE 9113

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
