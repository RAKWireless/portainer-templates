# Portainer template for RAK7391

## Introduction

RAK7391 is a flexible IoT platform powered with Raspberry Pi Compute Module 4 which you will be able to tailor to your specific needs. To leverage the potential of RAK7391, we provide a curated list of open source services ready to deploy as containers. These services are host in this repository as a [Portainer](https://www.portainer.io/) app template. With Portainer and the app template provided, users can easily deploy the curated containers in minutes.  

*Any questions or just want something we don't have? Make an issue and we are here to help. *

### Prerequisites

1. A host machine with docker installed (recommand to use a Raspberry Pi SBC or compute module and flash the [RAKPiOS image](link to rakpios repo))
2. A Portainer setup, check the [official documentation](https://docs.portainer.io/v/ce-2.9/start/install/server/docker/linux) for instruction on deployment and logging in.

### Installing

1. Browse to Portaine’s setting page, and then go to ”App Template" section
2. Add the url: `https://raw.githubusercontent.com/RAKWireless/portainer-templates/master/portainer_app_template.json` , then save settings.
3. Go to the App Templates in the sidebar, you will see a list of services (as shown in the figure below), choose the service you are interested in, follow the notes and descriptions for each service and option, customize the service to match your own needs, and then hit the button **Deploy the container**, wait for a few seconds for docker to pull the images and then create services.
   
   ![](https://raw.githubusercontent.com/RAKWireless/portainer-templates/master/logo/portainer-application-templates-list.png)

### Information

1. Portainer CE didn't add the `group-add` functionality from docker-compose to container creation until [Portainer CE 2.14.0](https://hub.docker.com/layers/portainer-ce/portainer/portainer-ce/2.14.0/images/sha256-c418af6e9c087952318189c8fcb4b32326d5be39eabafff4fb49e81a24a56bca?context=explore). The curated Node-RED image provided by RAKwireless in the Portainer app template has [some issues](https://github.com/portainer/portainer/issues/6970) with usergroup of GPIO, I2C, and USB. To get rid of this issue, please upgrade Portainer-CE's version to at least 2.14.0.

2. For some services, we use Portainer stacks to deploy them. The stacks, [as Portainer calls them](https://www.portainer.io/blog/stacks-docker-compose-the-portainer-way), are "sets of features that will allow users to start and run your container(s) using a well-structured docker-compose.yml file". For example, a [Chirpstack stack](https://github.com/chirpstack/chirpstack-docker) definition includes the network server container, the application server container, the gateway bridge container, the MQTT(mosquitto) container, and databases containers (such as posgresql and redis). These stack files share the same syntax with docker-compose YAML file, but with some minor difference. They are stored under the `Stack` directory. 

### App List

- [LoRa Basics™ Station for Docker ](https://github.com/xoseperez/basicstation)
- [UDP Packet Forwarder](https://github.com/RAKWireless/udp-packet-forwarder)
- [2.4GHz Gateway UDP Packet Forwarder](https://github.com/RAKWireless/udp-packet-forwarder)
- [Helium light hotspot](https://github.com/Sheng2216/helium-gateway-rs-docker)
- [NodeRed](https://nodered.org/docs/getting-started/docker)
- [Zigbee2MQTT](https://www.zigbee2mqtt.io/guide/getting-started/)
- [Seafile](https://manual.seafile.com/docker/deploy_seafile_with_docker/)
- [Tailscale](https://hub.docker.com/r/tailscale/tailscale)
- [ChirpStack Network Server](https://github.com/chirpstack/chirpstack-docker)
- [The Things Stack LNS](https://github.com/xoseperez/the-things-stack-docker)
- [Eclipse Mosquitto](https://hub.docker.com/_/eclipse-mosquitto)
- [Grafana](https://grafana.com/docs/grafana/next/setup-grafana/installation/docker/)
- [InfluxDB](https://hub.docker.com/_/influxdb)
- [Telegraf](https://hub.docker.com/_/telegraf)
- [ThingsBoard ](https://thingsboard.io/docs/user-guide/install/docker/)
- [TimescaleDB](https://github.com/timescale/timescaledb-docker)
- [NATS Server](https://hub.docker.com/_/nats)
- [iperf3-server](https://hub.docker.com/r/taoyou/iperf3-alpine)

### Copyright and license

Copyright (c) 2022 RAKwireless, under MIT License.
