import-lorawan-devices:
	docker compose run --rm --entrypoint bash --user root -v "./lorawan-devices:/opt/lorawan-devices" chirpstack -c '\
		apt-get update && \
		apt-get install -y make git && \
		rm -rf /opt/lorawan-devices/* && \
		git clone https://github.com/TheThingsNetwork/lorawan-devices /opt/lorawan-devices && \
		chirpstack -c /etc/chirpstack import-legacy-lorawan-devices-repository -d /opt/lorawan-devices'
