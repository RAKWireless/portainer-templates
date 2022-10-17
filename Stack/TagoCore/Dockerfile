#support platform: arm64, x64 
ARG ARCH=arm64

FROM alpine

WORKDIR /app

RUN apk add --no-cache libstdc++

ARG ARCH=arm64

RUN wget https://downloads.tagocore.com/v0.5.0/tagocore-v0.5.0-alpine-${ARCH}.tar.gz && \
    tar -xzf tagocore-v0.5.0-alpine-${ARCH}.tar.gz && \
    rm tagocore-v0.5.0-alpine-${ARCH}.tar.gz

COPY docker-entrypoint.sh .

RUN chmod +x ./docker-entrypoint.sh
RUN chmod +x ./tagocore

EXPOSE 8888

ENTRYPOINT [ "./docker-entrypoint.sh" ]
