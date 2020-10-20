#
# Cookbook:: hashicorp
# Recipe:: terraform
#
# Copyright:: 2020, Taqtiqa LLC, All Rights Reserved.

## Set default node attributes
#
include_recipe 'hashicorp::default'

## Install Terraform binary file
#
# not_if and only_if guards do not appear to be working for ark resources.
# Hence, guard with an unless test.
#
unless ::File.exist?('/usr/local/bin/terraform-0.13.4/terraform')
  ark 'Install Hashicorp Terraform binary' do
    action :install
    append_env_path true
    checksum hashicorp.terraform_checksum
    has_binaries [hashicorp.terraform_name]
    mode '0755'
    name hashicorp.terraform_name
    prefix_root hashicorp.bin_root
    strip_components 0
    url "https://releases.hashicorp.com/terraform/#{hashicorp.terraform_version}/terraform_#{hashicorp.terraform_version}_linux_#{hashicorp.install_arch}.zip"
    version hashicorp.terraform_version
  end
end
