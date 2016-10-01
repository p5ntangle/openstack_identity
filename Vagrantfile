# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

nodes = YAML.load_file('nodes.yml')
hosts = ""
ip = {}
nodes.each do |node|
  hosts = hosts + "#{node['ip']} #{node['name']}\n"
  ip[node['name']] = node['ip']
end

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", inline: "echo \"#{hosts}\" >> /etc/hosts"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
  end
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "./provision/site.yml"
  end
  config.vm.define "ldap" do |ldap|
    ldap.vm.hostname = "ldap"
    ldap.vm.network "private_network", ip: ip['ldap'] 
  end
  config.vm.define "devstack" do |devstack|
    devstack.vm.hostname = "devstack"
    devstack.vm.network "private_network", ip: ip['devstack'] 
  end
end
