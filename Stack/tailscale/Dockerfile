### Define the base image version
ARG version=v1.26.0

#### Use tailscale/tailscale:v1.26.0 as the base
FROM tailscale/tailscale:${version} AS base

# Copy launch script that expose env vars for tailscaled args
COPY launch.sh .
