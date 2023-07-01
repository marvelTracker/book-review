FROM arm64v8/alpine:3.14

RUN apk add --no-cache curl

WORKDIR /usr/local

ARG NODE_VERSION=14.17.6
ENV DIST_ARC=arm64
ARG NODE_URL=https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${DIST_ARC}.tar.xz
ARG NODE_SHASUMS_URL=https://nodejs.org/dist/v${NODE_VERSION}/SHASUMS256.txt

# Download Node.js binary and its SHA checksum file
RUN curl -fsSLO --compressed ${NODE_URL} \
    && curl -fsSLO --compressed ${NODE_SHASUMS_URL}

# Verify SHA checksum
RUN grep " node-v${NODE_VERSION}-linux-${DIST_ARC}.tar.xz\$" SHASUMS256.txt | sha256sum -c -

# Extract Node.js binary
RUN tar -xf node-v${NODE_VERSION}-linux-${DIST_ARC}.tar.xz --strip-components=1

# Cleanup
RUN rm node-v${NODE_VERSION}-linux-${DIST_ARC}.tar.xz SHASUMS256.txt

ENV PATH="/usr/local/bin:${PATH}"

CMD ["node", "--version"]
