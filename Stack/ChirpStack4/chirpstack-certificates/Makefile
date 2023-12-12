MQTT_BROKER_HOSTS ?= 127.0.0.1,localhost
CHIRPSTACK_GATEWAY_BRIDGE_HOSTS ?= 127.0.0.1,localhost

OSMVF := certs/.domains

OSMV := $(file <$(OSMVF))
NSMV := $(MQTT_BROKER_HOSTS) $(CHIRPSTACK_GATEWAY_BRIDGE_HOSTS)

ifneq ($(OSMV),$(NSMV))
$(file >$(OSMVF),$(NSMV))
endif

make: \
	certs/ca/ca.pem \
	certs/chirpstack-gateway-bridge/basicstation/basicstation.pem \
	certs/mqtt-broker/mqtt-broker.pem

clean:

	rm -rf certs

certs/ca/ca.pem:

	# -------------------------------------------------------------------------
	# CA certificate
	# -------------------------------------------------------------------------
	mkdir -p certs/ca
	cfssl gencert -initca config/ca-csr.json | cfssljson -bare certs/ca/ca
	chmod 666 certs/ca/*

certs/chirpstack-gateway-bridge/basicstation/basicstation.pem: certs/ca/ca.pem $(OSMVF)

	# -------------------------------------------------------------------------
	# BasicStation websocket server certificate
	# -------------------------------------------------------------------------
	./set-hosts.sh config/chirpstack-gateway-bridge/basicstation/certificate.json $(CHIRPSTACK_GATEWAY_BRIDGE_HOSTS)
	mkdir -p certs/chirpstack-gateway-bridge/basicstation
	cfssl gencert -ca certs/ca/ca.pem -ca-key certs/ca/ca-key.pem -config config/ca-config.json -profile server config/chirpstack-gateway-bridge/basicstation/certificate.json | cfssljson -bare certs/chirpstack-gateway-bridge/basicstation/basicstation
	chmod 666 certs/chirpstack-gateway-bridge/basicstation/*

certs/mqtt-broker/mqtt-broker.pem: certs/ca/ca.pem $(OSMVF)

	# -------------------------------------------------------------------------
	# MQTT broker / server certificate
	# -------------------------------------------------------------------------
	./set-hosts.sh config/mqtt-broker/certificate.json $(MQTT_BROKER_HOSTS)
	mkdir -p certs/mqtt-broker
	cfssl gencert -ca certs/ca/ca.pem -ca-key certs/ca/ca-key.pem -config config/ca-config.json -profile server config/mqtt-broker/certificate.json | cfssljson -bare certs/mqtt-broker/mqtt-broker
	chmod 666 certs/mqtt-broker/*
