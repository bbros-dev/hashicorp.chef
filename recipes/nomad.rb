#
# Cookbook:: hashicorp
# Recipe:: nomad
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.

## Set default node attributes
#
include_recipe 'hashicorp::default'

## Install Nomad binary file
#
unless ::File.exist?('/usr/local/bin/nomad')
  ark 'Install Hashicorp Nomad binary' do
    action :install
    append_env_path true
    checksum hashicorp.nomad_checksum
    has_binaries [hashicorp.nomad_name]
    mode '0755'
    name hashicorp.nomad_name
    prefix_root hashicorp.bin_root
    strip_components 0
    url "https://releases.hashicorp.com/nomad/#{hashicorp.nomad_version}/nomad_#{hashicorp.nomad_version}_linux_#{hashicorp.install_arch}.zip"
    version hashicorp.nomad_version
  end
end
