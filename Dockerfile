# Pinned so rebuilds don't drift. To update OpenResty: pick a new <version>-<build>-alpine-fat tag on
# Docker Hub, replace tag + digest (docker buildx imagetools inspect <image:tag>), then pin the new
# nginx-with-explorer digest in tiide ClusterManager::NGINX_IMAGE.
FROM openresty/openresty:1.31.9.1-0-alpine-fat@sha256:45ac6af1952263a510ad9141c860187fb301758a73fa8f549cc0b1aa708a218e

RUN apk add --no-cache git bash curl unzip
RUN luarocks install lua-resty-prometheus 1.1-0

EXPOSE 80

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
