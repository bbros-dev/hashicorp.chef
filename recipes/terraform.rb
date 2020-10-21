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
unless ::File.exist?("/usr/local/bin/terraform-#{hashicorp.terraform_version}/terraform")
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

## Install Terraform Docs
#
unless ::File.exist?(hashicorp.terraform_docs_bin)
  directory ::File.join(hashicorp.bin_root, "#{hashicorp.terraform_docs_name}-#{hashicorp.terraform_docs_version}" )
  remote_file 'Install Hashicorp Terraform Docs binary' do
    action :create
    checksum hashicorp.terraform_docs_checksum
    mode '0755'
    name hashicorp.terraform_docs_name
    path hashicorp.terraform_docs_bin
    source "https://github.com/terraform-docs/terraform-docs/releases/download/#{hashicorp.terraform_docs_version}/terraform-docs-#{hashicorp.terraform_docs_version}-linux-#{hashicorp.install_arch}"
  end

  link ::File.join(hashicorp.bin_root, hashicorp.terraform_docs_name) do
    to hashicorp.terraform_docs_bin
  end
end

## Install TFSec
#
unless ::File.exist?(hashicorp.tfsec_bin)
  directory ::File.join(hashicorp.bin_root, "#{hashicorp.tfsec_name}-#{hashicorp.tfsec_version}" )
  remote_file 'Install Hashicorp Terragrunt binary' do
    action :create
    checksum hashicorp.tfsec_checksum
    mode '0755'
    name hashicorp.tfsec_name
    path hashicorp.tfsec_bin
    source "https://github.com/tfsec/tfsec/releases/download/#{hashicorp.tfsec_version}/tfsec-linux-#{hashicorp.install_arch}"
  end

  link ::File.join(hashicorp.bin_root, hashicorp.tfsec_name) do
    to hashicorp.tfsec_bin
  end
end

## Install TFLint
#
unless ::File.exist?("/usr/local/bin/tflint-#{hashicorp.tflint_version}/tflint")
  ark 'Install Hashicorp Terraform binary' do
    action :install
    append_env_path true
    checksum hashicorp.tflint_checksum
    has_binaries [hashicorp.tflint_name]
    mode '0755'
    name hashicorp.tflint_name
    prefix_root hashicorp.bin_root
    strip_components 0
    url "https://github.com/terraform-linters/tflint/releases/download/#{hashicorp.tflint_version}/tflint_linux_#{hashicorp.install_arch}.zip"
    version hashicorp.tflint_version
  end
end
