# Portainer template for RAK7391 project

## Introduction

This is a template focused on help users create selfhosted service using Portaienr.

**RAKwireless invests time and resources providing this open source code, please support RAKwireless and open-source hardware by purchasing products from RAKwireless!**

For support and questions about RAKwireless products please visit our [forum](https://forum.rakwireless.com/)

To buy WisBlock modules please visit our [online store](https://store.rakwireless.com/)

### Prerequisites

1. A host machine with docker installed/flashed with RAKPiOS image
2. A Portainer setup.

### Installing

1. Browse to Portaine’s setting page, and then go to ”App Template" section
2. Add the url: `https://raw.githubusercontent.com/Sheng-IoT/Portainer_Templates/master/portainer_app_template.json` then go to **App Templates** and hit refresh at the top.
3. Choose the service you are interested in, follow notes and descriptions for each option, and then hit the button **Deploy the container**, wait for a few seconds for docker to pull the images and then create services.

### Information

Most templates are already configured to bind mount to various places on your drive, except for ThingsBoard. For ThingsBoard, we use the `auto`option so that Portainer automatically create and map a local volume for it. 

### App List

  - LoRa Basics™ Station for Docker 
  - NodeRed
  - ChirpStack Network Server
  - The Things Stack LNS
  - UDP Packet Forwarder
  - Eclipse Mosquitto
  - Grafana
  - InfluxDB
  - ThingsBoard 
  - TimescaleDB

### Copyright ad license

Copyright (c) 2022 RAKwireless, under MIT License.
