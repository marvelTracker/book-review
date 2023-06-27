FROM alpine:3.14

# Set the Node.js version
ARG NODE_VERSION=16.13.0

RUN addgroup -g 1000 node \
    && adduser -u 1000 -G node -s /bin/sh -D node

# Download and extract Node.js
RUN apk add --no-cache curl \
    && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-arm64.tar.xz" \
    && tar -xf "node-v$NODE_VERSION-linux-arm64.tar.xz" -C /usr/local --strip-components=1 \
    && rm "node-v$NODE_VERSION-linux-arm64.tar.xz" \
    && apk del curl