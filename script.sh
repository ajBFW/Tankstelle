#!/bin/bash

sudo apt-get install -y htop nginx dnsmasq tftpd-hpa git
sudo /etc/init.d/tftpd-hpa stop
sudo update-rc.d -f tftpd-hpa remove
git clone https://github.com/ajBFW/Tankstelle
sudo cp -r Tankstelle/tftp /srv/
sudo cp Tankstelle/dnsmasq.conf /etc/dnsmasq.conf
sudo reboot
