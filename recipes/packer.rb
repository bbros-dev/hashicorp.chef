#
# Cookbook:: hashicorp
# Recipe:: packer
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.

## Set default node attributes
#
include_recipe 'hashicorp::default'

## Install Packer binary file
#
unless ::File.exist?('/usr/local/bin/packer')
  ark 'Install Hashicorp Packer binary' do
    action :install
    append_env_path true
    checksum hashicorp.packer_checksum
    has_binaries [hashicorp.packer_name]
    mode '0755'
    name hashicorp.packer_name
    prefix_root hashicorp.bin_root
    strip_components 0
    url "https://releases.hashicorp.com/packer/#{hashicorp.packer_version}/packer_#{hashicorp.packer_version}_linux_#{hashicorp.install_arch}.zip"
    version hashicorp.packer_version
  end
end
