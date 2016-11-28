#!/usr/bin/env bash

apt-get update
wget http://tilemill.s3.amazonaws.com/latest/install-tilemill.tar.gz
tar -xf install-tilemill.tar.gz
sudo ./install-tilemill.sh
