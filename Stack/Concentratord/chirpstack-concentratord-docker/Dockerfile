ARG ARCH

# Base image
FROM debian:bullseye-slim
ARG ARCH
ARG VERSION=4.3.4

# Dependencies
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y --no-install-recommends toilet && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
    
# Switch to working directory for our app
WORKDIR /opt/chirpstack

# Checkout and compile remote code
RUN mkdir -p artifacts/binaries
COPY ./artifacts/binaries/chirpstack-concentratord-sx1301_${VERSION}_${ARCH}.tar.gz ./artifacts/binaries/chirpstack-concentratord-sx1301.tar.gz
COPY ./artifacts/binaries/chirpstack-concentratord-sx1302_${VERSION}_${ARCH}.tar.gz ./artifacts/binaries/chirpstack-concentratord-sx1302.tar.gz
COPY ./artifacts/binaries/chirpstack-concentratord-2g4_${VERSION}_${ARCH}.tar.gz ./artifacts/binaries/chirpstack-concentratord-2g4.tar.gz
COPY ./artifacts/configs ./artifacts/configs

# Copy fles from builder and repo
COPY ./start.sh ./
RUN chmod 777 .
RUN chmod 755 start.sh

# Run as nobody
USER nobody:nogroup

# Launch our binary on container startup.
CMD ["bash", "start.sh"]
