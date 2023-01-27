#support platform: arm64, x64 
ARG ARCH=arm64
ARG VERSION=v0.7.1

FROM alpine:3

WORKDIR /app

RUN apk add --no-cache libstdc++

ARG ARCH
ARG VERSION

RUN wget https://downloads.tagocore.com/${VERSION}/tagocore-${VERSION}-alpine-${ARCH}.tar.gz && \
    tar -xzf tagocore-${VERSION}-alpine-${ARCH}.tar.gz && \
    rm tagocore-${VERSION}-alpine-${ARCH}.tar.gz

COPY docker-entrypoint.sh .

RUN chmod +x ./docker-entrypoint.sh
RUN chmod +x ./tagocore

EXPOSE 8888

ENTRYPOINT [ "./docker-entrypoint.sh" ]
