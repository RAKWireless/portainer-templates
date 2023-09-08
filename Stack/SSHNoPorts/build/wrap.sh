#!/bin/bash

if [ ! -z $DEVICE_KEY ]; then
    if [ -f $DEVICE_KEY ]; then
        cat $DEVICE_KEY > /atsign/.atsign/keys/${DEVICE_ATSIGN}_key.atKeys
    else
        echo $DEVICE_KEY > /atsign/.atsign/keys/${DEVICE_ATSIGN}_key.atKeys
    fi
fi
if [ ! -z $CLIENT_KEY ]; then
    if [ -f $CLIENT_KEY ]; then
        cat $CLIENT_KEY > /atsign/.atsign/keys/${CLIENT_ATSIGN}_key.atKeys
    else
        echo $CLIENT_KEY > /atsign/.atsign/keys/${CLIENT_ATSIGN}_key.atKeys
    fi
fi

./.startup.sh -a $DEVICE_ATSIGN -m $CLIENT_ATSIGN -d $DEVICE_NAME -u -s -v
