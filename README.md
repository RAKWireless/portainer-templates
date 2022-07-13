# Portainer template for RAK7391 project

## Introduction

This is a template focused on help users create selfhosted service using Portaienr.

For support and questions about RAKwireless products please visit our [forum](https://forum.rakwireless.com/)

To buy WisBlock modules please visit our [online store](https://store.rakwireless.com/)

### Prerequisites

1. A host machine with docker installed/flashed with RAKPiOS image
2. A Portainer setup.

### Installing

1. Browse to Portaine’s setting page, and then go to ”App Template" section
2. Add the url: `https://raw.githubusercontent.com/RAKWireless/portainer-templates/master/portainer_app_template.json` then go to **App Templates** and hit refresh at the top.
3. Choose the service you are interested in, follow notes and descriptions for each option, and then hit the button **Deploy the container**, wait for a few seconds for docker to pull the images and then create services.

### Information

1. Most templates are already configured to bind mount to various places on your drive, except for ThingsBoard. For ThingsBoard, we use the `auto` option so that Portainer automatically create and map a local volume for it. 
2. Portainer CE didn't add the `group-add` functionality from docker-compose to container creation until [Portainer CE 2.14.0](https://hub.docker.com/layers/portainer-ce/portainer/portainer-ce/2.14.0/images/sha256-c418af6e9c087952318189c8fcb4b32326d5be39eabafff4fb49e81a24a56bca?context=explore). The curated Node-RED image provided by RAKwireless in the Portainer app template has [some issues](https://github.com/portainer/portainer/issues/6970) with usergroup of GPIO, I2C, and USB. To get rid of this issue, please upgrade Portainer-CE's version to at least 2.14.0.


### App List

  - LoRa Basics™ Station for Docker 
  - UDP Packet Forwarder
  - 2.4GHz Gatewat UDP Packet Forwarder
  - NodeRed
  - Zigbee2MQTT
  - Tailscale
  - ChirpStack Network Server
  - The Things Stack LNS
  - Eclipse Mosquitto
  - Grafana
  - InfluxDB
  - Telegraf
  - ThingsBoard 
  - TimescaleDB


### Notes
[The Node-red image ](https://github.com/portainer/portainer/issues/6970)

### Copyright and license

Copyright (c) 2022 RAKwireless, under MIT License.
