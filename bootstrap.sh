#!/usr/bin/env bash

sudo apt-get update
wget --quiet http://tilemill.s3.amazonaws.com/latest/install-tilemill.tar.gz
tar -xf install-tilemill.tar.gz

#LINECOUNT=`wc -l install-tilemill.sh | awk '{print $1}'`
#LINECOUNT=$(( $LINECOUNT-1 ))

sudo pkexec /bin/bash -c "apt-get install --yes python-software-properties &&
    yes | apt-add-repository ppa:developmentseed/mapbox &&
    apt-get update --yes &&
    apt-get install --yes tilemill"

echo "{
    "'"port"'": 20009,
    "'"tilePort"'": 20008,
    "'"files"'": "'"~/Documents/MapBox"'",
    "'"examples"'": true,
    "'"sampledata"'": true,
    "'"host"'": false,
    "'"listenHost"'": "'"0.0.0.0"'",
    "'"syncURL"'": "'"https://api.mapbox.com"'",
    "'"server"'": true,
    "'"verbose"'": "'"on"'"
}" | sudo tee '/usr/share/tilemill/lib/config.defaults.json'
