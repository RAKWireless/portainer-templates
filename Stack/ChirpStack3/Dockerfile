### Define the base image version
ARG version=9.6-alpine

#### Use postgres:9.6-alpine as the base
FROM postgres:${version} AS base

# Copy initialization script 
COPY ./configuration/postgresql/initdb /docker-entrypoint-initdb.d
#VOLUME ./db/nextcloud.sql:/docker-entrypoint-initdb.d/nextcloud.sql
