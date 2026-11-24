# Pinned so rebuilds don't drift. To update OpenResty: pick a new <version>-<build>-alpine-fat tag on
# Docker Hub, replace tag + digest (docker buildx imagetools inspect <image:tag>), then pin the new
# nginx-with-explorer digest in tiide ClusterManager::NGINX_IMAGE.
FROM openresty/openresty:1.29.2.1-0-alpine-fat@sha256:57206e154ef54d01dcf20f2afc05f1a8d7c464f2b3f4bd1a519108cac6d450ab

RUN apk add --no-cache git bash curl unzip
RUN luarocks install lua-resty-prometheus 1.1-0

EXPOSE 80

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
