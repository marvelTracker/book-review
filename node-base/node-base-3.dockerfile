FROM alpine:3.10

ENV NODE_VERSION=18.0.0
ENV NPM_VERSION=7.24.0


RUN addgroup -S node && adduser -S node -G node

# Download and install Node.js
RUN apk add --no-cache nodejs~=$NODE_VERSION npm~=$NPM_VERSION

RUN node -v

