FROM node:alpine
MAINTAINER kev <virtualworld.space@gmail.com>

ENV BB_VER 1.12.x
ENV BB_URL https://github.com/NodeBB/NodeBB/archive/v$BB_VER.tar.gz

RUN mkdir -p /usr/src/nodebb
WORKDIR /usr/src/nodebb

ENV NODE_ENV=production \
    daemon=false \
    silent=false

RUN    apk add --no-cache -U bash \
                  sed \
                  icu \
                  imagemagick \
                  openssl \
                  curl \
    && curl -sSL $BB_URL | tar xz --strip 1 \
    && cp install/package.json package.json \
    && npm install --production \
    && npm cache clean --force \
    && rm -r .[!.]* \
    && rm -rf /tmp/npm* \
              /var/cache/apk/*

EXPOSE 4567
CMD ./nodebb start
