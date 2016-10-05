#!/bin/bash

sudo apt-get install -y htop nginx dnsmasq tftpd-hpa git
sudo update-rc.d -f tftpd-hpa remove

git clone https://github.com/ajBFW/Tankstelle
