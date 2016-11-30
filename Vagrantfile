#-*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

nodes = YAML.load_file('nodes.yml')
hosts = ""
ip = {}
box = {}
nodes.each do |node|
  hosts = hosts + "#{node['ip']} #{node['name']}\n"
  ip[node['name']] = node['ip']
  box[node['name']] = node['box'] 
end

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo \"#{hosts}\" >> /etc/hosts"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
  end
  config.vm.provision :ansible do |ansible|
    ansible.verbose = "vvvv"
    ansible.playbook = "./provision/site.yml"
  end
  config.vm.define "ldap" do |ldap|
    config.vm.box = box['ldap']
    ldap.vm.hostname = "ldap"
    ldap.vm.network "private_network", ip: ip['ldap'] 
  end
  config.vm.define "devstack" do |devstack|
    config.vm.box = box['devstack']
    devstack.vm.hostname = "devstack"
    devstack.vm.network "private_network", ip: ip['devstack'] 
    config.ssh.private_key_path = "./keys/id_rsa"
  end
  config.vm.define "shibboleth" do |shibboleth|
    config.vm.box = box['shibboleth']
    # Another Xenial workaround
    config.vm.provision :shell, inline: "hostnamectl set-hostname idp"
    #shibboleth.vm.hostname = "shibboleth"
    shibboleth.vm.network "private_network", ip: ip['shibboleth']
    config.ssh.private_key_path = "./keys/id_rsa"
  end
end
