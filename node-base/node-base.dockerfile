FROM alpine:3.14

RUN addgroup -g 1000 node \
    && adduser -u 1000 -G node -s /bin/sh -D node

RUN apk add --no-cache curl

ENV NODE_VERSION=18.0.0
ENV DIST_ARC=arm64
ENV DIST_TYPE=linux
ENV ARCH=arm64

#https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-${DIST_TYPE}-${DIST_ARC}.tar.gz

# Download and install Node.js for Apple Silicon (Mac M1)
RUN curl -fsSL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-${DIST_TYPE}-${DIST_ARC}.tar.gz -o node.tar.xz \
    && tar -xf node.tar.xz  -C /usr/local --strip-components=1 --no-same-owner\
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && rm node.tar.xz

ENV PATH="/usr/local/bin:${PATH}"

# Display Node.js and npm versions
#RUN node -v && npm -v

# Rest of your Dockerfile...
#node-v18.16.1-linux-armv7l
