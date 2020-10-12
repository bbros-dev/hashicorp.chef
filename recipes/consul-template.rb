#
# Cookbook:: hashicorp
# Recipe:: consul-template
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.

## Install Consul-Template binary file
#
ark 'Install Consul-Template binary' do
  action :install
  append_env_path false
  checksum hashicorp.consul_template_checksum
  has_binaries [hashicorp.consul_template_name]
  mode '0755'
  name hashicorp.consul_template_name
  prefix_root hashicorp.bin_root
  strip_components 0
  url "https://releases.hashicorp.com/consul-template/#{hashicorp.consul_template_version}/consul-template_#{hashicorp.consul_template_version}_linux_#{hashicorp.install_arch}.tgz"
  version hashicorp.consul_template_version
end
