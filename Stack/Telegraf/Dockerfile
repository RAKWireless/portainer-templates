### Define the base image version
ARG version=1.23.3

#### Use telegraf:1.23.3 as the base
FROM telegraf:${version}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
