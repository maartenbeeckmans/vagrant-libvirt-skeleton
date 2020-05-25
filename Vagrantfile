# One Vagrantfile to rule them all!
#
# This is a generic Vagrantfile that can be used without modification in
# a variety of situations. Hosts and their properties are specified in
# `vagrant-hosts.yml`. Provisioning is done by a shell script in the directory
# `provisioning/` with the same name as the host name.
#
# See https://github.com/bertvv/vagrant-shell-skeleton/ for details

require 'rbconfig'
require 'yaml'

# set default LC_ALL for all BOXES
ENV["LC_ALL"] = "en_US.UTF-8"

# Set your default base box here
DEFAULT_BASE_BOX = 'centos/8'

#
# No changes needed below this point
#

VAGRANTFILE_API_VERSION = '2'
PROJECT_NAME = '/' + File.basename(Dir.getwd)

hosts = YAML.load_file('vagrant-hosts.yml')


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  hosts.each do |host|
    config.vm.define host['name'] do |node|
      node.vm.box = host['box'] ||= DEFAULT_BASE_BOX
      node.vm.box_url = host['box_url'] if host.key? 'box_url'

      node.vm.hostname = host['name']

      node.vm.network :private_network,
        :ip => host['ip'],
        :libvirt__netmask => host['netmask']

      node.vm.provider :libvirt do |libvirt|
        libvirt.memory = host['memory'] if host.key? 'memory'
        libvirt.cpus = host['cpus'] if host.key? 'cpus'
      end
            
      # Run configuration script for the VM
      node.vm.provision 'shell', path: 'provisioning/' + host['name'] + '.sh'
    end
  end
end

# -*- mode: ruby -*-
# vi: ft=ruby :
