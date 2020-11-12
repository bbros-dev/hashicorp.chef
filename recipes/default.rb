#
# Cookbook:: hashicorp
# Recipe:: default
#
# Copyright:: 2020, Begley Brothers Inc., All Rights Reserved.

node.default['atlantis']['version'] = 'v0.15.0'
node.default['atlantis']['checksum'] = 'a236e7c9df159f8787b143c670f1899dd4bc4349f23ed696468600280fa1266e'
node.default['consul']['version'] = '1.8.5'
node.default['consul']['checksum'] = '94ab38e6221d3da393d0bbdf19cc524051253a75db078c31e249dad2c497ad46'
node.default['consul-template']['version'] = '0.25.0'
node.default['consul-template']['checksum'] = '65982eb00b69303e5caa5677b53cc314fc19ed48042355c9b6465fa568b3aae3'
# Envoy version depends on Consul version:
# https://www.consul.io/docs/connect/proxies/envoy
# Envoy is installed using the GetEnvoy.io script - hence no checksum.
node.default['envoy']['version'] = '1.14.4'
# node.default['envoy']['checksum'] = ''
node.default['envconsul']['version'] = '0.10.0'
node.default['envconsul']['checksum'] = 'ac459fbfaa2cdb259bf27b0c4b83c64a537d22293e8a60d76a053cea7f204eee'
node.default['packer']['version'] = '1.6.5'
node.default['packer']['checksum'] = 'a49f6408a50c220fe3f1a6192ea21134e2e8f31092c507614cd27ad4f913234b'
node.default['nomad']['version'] = '0.12.5'
node.default['nomad']['checksum'] = 'dece264c86a5898a18d62d6ecca469fee71329e444b284416c57bd1e3d76f253'
node.default['terraform']['version'] = '0.13.4'
node.default['terraform']['checksum'] = 'a92df4a151d390144040de5d18351301e597d3fae3679a814ea57554f6aa9b24'
node.default['terragrunt']['version'] = 'v0.25.3'
node.default['terragrunt']['checksum'] = '32e21f061c6e292a7c09431a3b38489b17e02689606e3f1f14b7df11b727f35a'
#node.default['terragrunt-atlantis-config']['version'] = 'v0.9.7'
# No project binaries - build from source.
#node.default['terragrunt-atlantis-config']['checksum'] = ''
node.default['terraform-docs']['version'] = 'v0.10.1'
node.default['terraform-docs']['checksum'] = '37fa36d8340ceebf54f9eda73570ddbccb04fd0a53c133d3deae279161d941a1'
node.default['tflint']['version'] = 'v0.20.3'
node.default['tflint']['checksum'] = '0738d0ed41b6f564a78c884a3a0523cbfc3469d0088a6766da362946d3760575'
node.default['tfsec']['version'] = 'v0.30.1'
node.default['tfsec']['checksum'] = 'f50aafd323955931e961392bd7c20c05d7da988091e3079bab0d569a85ea2615'
node.default['tunnelto']['version'] = '0.1.12'
node.default['tunnelto']['checksum'] = '21169fe2bacf3e60db4a8ac95b96491df8e1ff9608ab1154d6178fa1774df0f7'
node.default['vault']['version'] = '1.5.3'
node.default['vault']['checksum'] = '1ec61ff4d0b7ed774ba6f71829596afd8c8bf1d72c97305f4692001cef8910b2'
