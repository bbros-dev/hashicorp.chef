#
# Cookbook:: hashicorp
# Recipe:: terragrunt
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.
#
# Cookbook:: consul-vault
# Recipe:: terragrunt
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.

## Set default node attributes
#
include_recipe 'hashicorp::default'

# NOTE:
# From version 0.25.1, the sops_decrypt_file will now cache decrypted files in
# memory while Terragrunt runs.
# This can lead to a significant speed up, as it ensures that each unique file
# path is decrypted at most once per run.

%w[
  graphviz
].each do |p|
  package p do
    action :install
  end
end

## Install Terragrunt binary file
#
ark 'Install Hashicorp Terragrunt binary' do
  action :create
  append_env_path false
  mode '0755'
  checksum hashicorp.terragrunt_checksum
  name hashicorp.terragrunt_name
  prefix_root hashicorp.bin_root
  source "https://github.com/gruntwork-io/terragrunt/releases/download/#{hashicorp.terragrunt_version}/terragrunt_linux_#{hashicorp.install_arch}"
  version hashicorp.terragrunt_version
end

## Install Atlantis Terragrunt Configuration generator
#
directory "#{Chef::Config[:file_cache_path]}/tmp/terragrunt-atlantis-config" do
  mode '0775'
  action :create
  recursive true
end

bash 'Get, Build and Install terragrunt-atlantis-config' do
  code <<-EOCODE
  go mod init local/build
  go get -d -v github.com/transcend-io/terragrunt-atlantis-config@v0.9.7
  mkdir bin
  go build -o /usr/local/bin/terragrunt-atlantis-config github.com/transcend-io/terragrunt-atlantis-config
  EOCODE
  cwd "#{Chef::Config[:file_cache_path]}/tmp/terragrunt-atlantis-config"
end
