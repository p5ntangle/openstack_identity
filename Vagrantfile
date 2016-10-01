# -*- mode: ruby -*-
# vi: set ft=ruby :

ldap_ip = "192.168.111.10"
devstack_ip = "192.168.111.11"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
  end
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "./provision/site.yml"
  end
  config.vm.define "ldap" do |ldap|
    ldap.vm.hostname = "ldap"
    ldap.vm.network "private_network", ip: ldap_ip 
  end
  config.vm.define "devstack" do |devstack|
    devstack.vm.hostname = "devstack"
    devstack.vm.network "private_network", ip: devstack_ip 
  end
end
