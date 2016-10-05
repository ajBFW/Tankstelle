#!/bin/bash

sudo apt-get install -y htop nginx dnsmasq tftpd-hpa git
sudo /etc/init.d/tftpd-hpa stop
sudo update-rc.d -f tftpd-hpa remove
sudo reboot
