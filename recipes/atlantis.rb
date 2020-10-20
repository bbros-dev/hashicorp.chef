#
# Cookbook:: hashicorp
# Recipe:: atlantis
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.

## Set default node attributes
#
include_recipe 'hashicorp::default'

## Install Atlantis binary file
#
unless ::File.exist?('/usr/local/bin/atlantis')
  ark 'Install Atlantis binary' do
    action :install
    append_env_path true
    checksum hashicorp.atlantis_checksum
    has_binaries [hashicorp.atlantis_name]
    mode '0755'
    name hashicorp.atlantis_name
    prefix_root hashicorp.bin_root
    strip_components 0
    url "https://github.com/runatlantis/atlantis/releases/download/#{hashicorp.atlantis_version}/atlantis_linux_#{hashicorp.install_arch}.zip"
    version hashicorp.atlantis_version
  end
end

## Install TunnelTo Binary
#
# This uses a Rust binary, the async by default should ensure good performance.
#
unless ::File.exist?('/usr/local/bin/tunnelto')
  ark 'Install TunnelTo binary' do
    action :install
    append_env_path true
    checksum hashicorp.tunnelto_checksum
    has_binaries [hashicorp.tunnelto_name]
    mode '0755'
    name hashicorp.tunnelto_name
    prefix_root hashicorp.bin_root
    strip_components 0
    url "https://github.com/agrinman/tunnelto/releases/download/#{hashicorp.tunnelto_version}/tunnelto-linux.tar.gz"
    version hashicorp.tunnelto_version
  end
end
