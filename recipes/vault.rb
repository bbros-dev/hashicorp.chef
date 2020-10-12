#
# Cookbook:: hashicorp
# Recipe:: vault
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.

## Set default node attributes
#
include_recipe 'hashicorp::default'

## Install Vault binary file
#
ark 'Install Vault' do
  action :install
  append_env_path false
  checksum hashicorp.vault_checksum
  has_binaries [hashicorp.vault_name]
  mode '0755'
  name hashicorp.vault_name
  prefix_root hashicorp.bin_root
  strip_components 0
  url "https://releases.hashicorp.com/vault/#{hashicorp.vault_version}/vault_#{hashicorp.vault_version}_linux_#{hashicorp.install_arch}.zip"
  version hashicorp.vault_version
end
