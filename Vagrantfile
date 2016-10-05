# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = true

  config.vm.network "private_network", ip: "192.168.100.10", virtualbox__intnet: true

config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
end
	config.vm.provision "shell", path: "script.sh"
end
