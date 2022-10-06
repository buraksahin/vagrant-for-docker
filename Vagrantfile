# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Operating System
  config.vm.box = "hashicorp/bionic64"
  config.vm.box_version = "1.0.282"
  config.vm.hostname = "ubuntu-docker"
  config.vm.define "ubuntu-docker"

  # Network
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port",  guest: 5432, host: 5432

  config.vm.network "private_network", ip: "192.168.56.25"
  #for i in 8000..27020
  #  config.vm.network "forwarded_port", guest: i, host: i
  #end

  # File System
  config.vm.synced_folder "./projects", "/home/vagrant/projects", owner: "vagrant", group: "vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu-docker"
    vb.memory = "2096"
    # vb.gui = true
  end

  # Provisioning
  config.vm.provision "shell", path: "nonsite/provisioning/dependency.sh"
  config.vm.provision "shell", path: "nonsite/provisioning/database.sh"
  config.vm.provision "shell", path: "nonsite/provisioning/docker.sh"
  config.vm.provision "shell", path: "nonsite/provisioning/pyenv.sh"
  config.vm.provision "shell", path: "nonsite/provisioning/application.sh", privileged: false
end