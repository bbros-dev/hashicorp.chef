#
# Cookbook:: hashicorp
# Recipe:: envconsul
#
# Copyright:: 2020, Begley Brothers Inc., All Rights Reserved.

## Install EnvConsul binary file
#
unless ::File.exist?('/usr/local/bin/envconsul')
  ark 'Install Hashicorp EnvConsul binary' do
    action :install
    append_env_path true
    checksum hashicorp.envconsul_checksum
    has_binaries [hashicorp.envconsul_name]
    mode '0755'
    name hashicorp.envconsul_name
    prefix_root hashicorp.bin_root
    strip_components 0
    url "https://releases.hashicorp.com/envconsul/#{hashicorp.envconsul_version}/envconsul_#{hashicorp.envconsul_version}_linux_#{hashicorp.install_arch}.zip"
    version hashicorp.envconsul_version
  end
end
