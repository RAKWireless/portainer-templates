#!/bin/bash

supported_regions="US915 EU868 EU433 CN470 CN779 AU915 AS923_1 AS923_2 AS923_3 AS923_4 KR920 IN865"

function exists_in_list() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    echo $LIST | tr "$DELIMITER" '\n' | grep -F -q -x "$VALUE"
}

### check the region variable
if exists_in_list "$supported_regions" " " $region; then
    echo "Set region to $region"
else
    echo "Region not supported, please change the Region variable and try again. Exiting now..."
    exit 0
fi


### Download the Helium-gateway package based on specified version number and platform
wget https://github.com/helium/gateway-rs/releases/download/${version}/helium-gateway-${version}-${platform}.deb

### Install the Helium-gateway pakage
dpkg -i helium-gateway-* 

### Configure the settings file,
echo region = \"$region\" > /etc/helium_gateway/settings.toml

#comment out to use ECC, note that the file based keypair will no longer be used once the ECC is configured for use.
#echo keypair = \"ecc://i2c-1:96?slot=0\&network=mainnet\" >> /etc/helium_gateway/settings.toml

### Start helium gateway service
helium_gateway -c /etc/helium_gateway/ server
