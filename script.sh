#!/bin/bash

sudo apt-get install -y htop nginx dnsmasq tftpd-hpa git
sleep 45
sudo /etc/init.d/tftpd-hpa stop
sudo update-rc.d -f tftpd-hpa remove
git clone https://github.com/ajBFW/Tankstelle
sleep 45
sudo cp Tankstelle/dnsmasq.conf /etc/
sudo cp -r Tankstelle/tftp/ /srv/
sudo service dnsmasq restart
