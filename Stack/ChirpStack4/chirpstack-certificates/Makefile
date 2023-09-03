MQTT_BROKER_HOSTS ?= 127.0.0.1,localhost
CHIRPSTACK_GATEWAY_BRIDGE_HOSTS ?= 127.0.0.1,localhost

make: certs/ca \
	certs/chirpstack-gateway-bridge/basicstation \
	certs/mqtt-broker

certs/ca:
	mkdir -p certs/ca
	cfssl gencert -initca config/ca-csr.json | cfssljson -bare certs/ca/ca
	chmod 666 certs/ca/*

certs/chirpstack-gateway-bridge/basicstation: certs/ca
	mkdir -p certs/chirpstack-gateway-bridge/basicstation
	cfssl gencert -ca certs/ca/ca.pem -ca-key certs/ca/ca-key.pem -config config/ca-config.json -profile server config/chirpstack-gateway-bridge/basicstation/certificate.json | cfssljson -bare certs/chirpstack-gateway-bridge/basicstation/basicstation
	chmod 666 certs/chirpstack-gateway-bridge/basicstation/*

certs/mqtt-broker: certs/ca
	mkdir -p certs/mqtt-broker
	cfssl gencert -ca certs/ca/ca.pem -ca-key certs/ca/ca-key.pem -config config/ca-config.json -profile server config/mqtt-broker/certificate.json | cfssljson -bare certs/mqtt-broker/mqtt-broker
	chmod 666 certs/mqtt-broker/*

clean:
	rm -rf certs

