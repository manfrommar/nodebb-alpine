FROM node:lts-alpine
MAINTAINER kev <virtualworld.space@gmail.com>

ENV NODE_ENV=production \
    daemon=false \
    silent=false

RUN    apk add --no-cache \
                  g++ \
                  gcc \
                  gnupg \
                  libgcc \
                  linux-headers \
                  make \
                  python \
                  bash \
                  sed \
                  icu \
                  imagemagick \
                  openssl \
                  curl \
    && rm -rf /var/cache/apk/*

VOLUME /usr/src/nodebb
WORKDIR /usr/src/nodebb

EXPOSE 4567
CMD ./nodebb start
