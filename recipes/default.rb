#
# Cookbook:: hashicorp
# Recipe:: default
#
# Copyright:: 2020, Begley Brothers Inc., All Rights Reserved.

node.default['consul']['version'] = '1.8.0'
node.default['consul']['checksum'] = '98df3e0a8ede84794fa4d20b1b6b5d52ad3b983dec916c4d612cecba7c48a421'
node.default['consul-template']['version'] = '0.25.0'
node.default['consul-template']['checksum'] = '65982eb00b69303e5caa5677b53cc314fc19ed48042355c9b6465fa568b3aae3'
node.default['packer']['version'] = '1.6.4'
node.default['packer']['checksum'] = 'a20ec68e9eb6e1d6016481003f705babbecc28e234f8434f3a35f675cb200ea8'
node.default['nomad']['version'] = '0.12.5'
node.default['nomad']['checksum'] = 'dece264c86a5898a18d62d6ecca469fee71329e444b284416c57bd1e3d76f253'
node.default['terraform']['version'] = '0.13.4'
node.default['terraform']['checksum'] = 'a92df4a151d390144040de5d18351301e597d3fae3679a814ea57554f6aa9b24'
node.default['terragrunt']['version'] = 'v0.25.3'
node.default['terragrunt']['checksum'] = '32e21f061c6e292a7c09431a3b38489b17e02689606e3f1f14b7df11b727f35a'
node.default['terragrunt-atlantis-config']['version'] = 'v0.9.7'
# node.default['terragrunt-atlantis-config']['checksum'] = ''
node.default['terraform-docs']['version'] = ''
node.default['terraform-docs']['checksum'] = ''
node.default['tflint']['version'] = ''
node.default['tflint']['checksum'] = ''
node.default['vault']['version'] = '1.5.3'
node.default['vault']['checksum'] = '1ec61ff4d0b7ed774ba6f71829596afd8c8bf1d72c97305f4692001cef8910b2'
