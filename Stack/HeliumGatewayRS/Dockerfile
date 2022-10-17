ARG ARCH=aarch64

# Builder image
FROM rust:1.62.1-bullseye as builder

WORKDIR /app

#RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
#RUN sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list

### Install basic build tools
RUN apt-get update \
    && apt-get install -y build-essential pkg-config cmake clang \
    && rm -rf /var/lib/apt/lists/*


### Build helium-wallet cli from source 
RUN git clone https://github.com/helium/helium-wallet-rs
WORKDIR /app/helium-wallet-rs
RUN cargo build --release


ARG ARCH=aarch64
# Runner image
FROM balenalib/${ARCH}-debian:bullseye-run as runner

WORKDIR /app

### Install packages
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

### Copy launch script that start helium_gateway service
COPY start.sh ./
RUN chmod +x start.sh

### Copy helium-wallet cli from builder 
COPY --from=builder /app/helium-wallet-rs/target/release/helium-wallet ./
