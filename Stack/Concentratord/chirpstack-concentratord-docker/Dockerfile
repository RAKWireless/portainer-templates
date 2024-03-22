ARG ARCH
ARG VERSION
ARG BUILD_DATE

# Base image
FROM debian:bullseye-slim
ARG ARCH
ARG VERSION
ARG BUILD_DATE

# Dependencies
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y --no-install-recommends toilet && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
    
# Switch to working directory for our app
WORKDIR /opt/chirpstack

# Checkout and compile remote code
RUN mkdir -p binaries
COPY ./binaries/chirpstack-concentratord-sx1301_${VERSION}_${ARCH}.tar.gz ./binaries/chirpstack-concentratord-sx1301.tar.gz
COPY ./binaries/chirpstack-concentratord-sx1302_${VERSION}_${ARCH}.tar.gz ./binaries/chirpstack-concentratord-sx1302.tar.gz
COPY ./binaries/chirpstack-concentratord-2g4_${VERSION}_${ARCH}.tar.gz ./binaries/chirpstack-concentratord-2g4.tar.gz

# Copy fles from builder and repo
COPY ./runner/ ./
RUN chmod +x start
RUN chmod 777 .

# Run as nobody
USER nobody:nogroup

# Add application folder to path
ENV PATH="${PATH}:/opt/chirpstack"

# Launch our binary on container startup.
CMD ["bash", "start"]
