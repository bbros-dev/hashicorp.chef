#
# Cookbook:: hashicorp
# Recipe:: consul
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.

## Set default node attributes
#
include_recipe 'hashicorp::default'

## Install Consul binary file
#
unless ::File.exist?('/usr/local/bin/consul')
  ark 'Install Hashicorp Consul binary' do
    action :install
    append_env_path true
    checksum hashicorp.consul_checksum
    has_binaries [hashicorp.consul_name]
    mode '0755'
    name hashicorp.consul_name
    prefix_root hashicorp.bin_root
    strip_components 0
    url "https://releases.hashicorp.com/consul/#{hashicorp.consul_version}/consul_#{hashicorp.consul_version}_linux_#{hashicorp.install_arch}.zip"
    version hashicorp.consul_version
  end
end
