require 'base64'
require 'json'
require 'tty-command'

## Modelled on Upstream:
#
# https://github.com/chef-cookbooks/chef-client/blob/master/libraries/helpers.rb
#
class ::HashicorpHelpers
  ## hashicorp.<node_attributes/methods>
  #
  # Provide @node data aliased to the method `hashicorp`.
  # See below for Chef::Resource and Chef::Recipe class methods `hashicorp`
  # that return and instance of this class.
  #
  def initialize(node)
    @node = node
  end

  def install_arch
    @node['kernel']['machine'] =~ /x86_64/ ? 'amd64' : '386'
  end

  def bin_root
    @bin_root ||= '/usr/local/bin'
  end

  def config_root
    @config_root ||= '/etc'
  end

  def home_root
    @home_root ||= '/srv'
  end

  ## Consul
  #
  def consul_version
    @consul_version ||= @node['consul']['version']
  end

  def consul_checksum
    @consul_version ||= @node['consul']['checksum']
  end

  def consul_name
    @consul_name ||= 'consul'
  end

  def consul_user
    @consul_user ||= consul_name
  end

  def consul_group
    @consul_group ||= consul_name
  end

  def consul_home
    @consul_home ||= File.join(home_root, consul_name)
  end

  def consul_bin
    @consul_bin ||= ::File.join(bin_root, consul_name)
  end

  ## Nomad
  #
  def nomad_version
    @nomad_version ||= @node['nomad']['version']
  end

  def nomad_checksum
    @nomad_version ||= @node['nomad']['checksum']
  end

  def nomad_name
    @nomad_name ||= 'nomad'
  end

  def nomad_user
    @nomad_user ||= nomad_name
  end

  def nomad_group
    @nomad_group ||= nomad_name
  end

  def nomad_home
    @nomad_home ||= ::File.join(home_root, nomad_name)
  end

  def nomad_bin
    @nomad_bin ||= ::File.join(bin_root, nomad_name)
  end

  ## Packer
  #
  def packer_version
    @packer_version ||= @node['packer']['version']
  end

  def packer_checksum
    @packer_version ||= @node['packer']['checksum']
  end

  def packer_name
    @packer_name ||= 'packer'
  end

  def packer_user
    @packer_user ||= packer_name
  end

  def packer_group
    @packer_group ||= packer_name
  end

  def packer_home
    @packer_home ||= ::File.join(home_root, packer_name)
  end

  def packer_bin
    @packer_bin ||= ::File.join(bin_root, packer_name)
  end

  ## Terraform
  #
  def terraform_version
    @terraform_version ||= @node['terraform']['version']
  end

  def terraform_checksum
    @terraform_version ||= @node['terraform']['checksum']
  end

  def terraform_name
    @terraform_name ||= 'terraform'
  end

  def terraform_user
    @terraform_user ||= terraform_name
  end

  def terraform_group
    @terraform_group ||= terraform_name
  end

  def terraform_home
    @terraform_home ||= ::File.join(home_root, terraform_name)
  end

  def terraform_bin
    @terraform_bin ||= ::File.join(bin_root, terraform_name)
  end

  ## Terragrunt
  #
  def terragrunt_version
    @terragrunt_version ||= @node['terragrunt']['version']
  end

  def terragrunt_checksum
    @terragrunt_version ||= @node['terragrunt']['checksum']
  end

  def terragrunt_name
    @terragrunt_name ||= 'terragrunt'
  end

  def terragrunt_user
    @terragrunt_user ||= terragrunt_name
  end

  def terragrunt_group
    @terragrunt_group ||= terragrunt_name
  end

  def terragrunt_home
    @terragrunt_home ||= ::File.join(home_root, terragrunt_name)
  end

  def terragrunt_bin
    @terragrunt_bin ||= ::File.join(bin_root, terragrunt_name)
  end

  ## Vault
  #
  def vault_version
    @vault_version ||= @node['vault']['version']
  end

  def vault_checksum
    @vault_version ||= @node['vault']['checksum']
  end

  def vault_name
    @vault_name ||= 'vault'
  end

  def vault_user
    @vault_user ||= vault_name
  end

  def vault_group
    @vault_group ||= vault_name
  end

  def vault_home
    @vault_home ||= ::File.join(home_root, vault_name)
  end

  def vault_bin
    @vault_bin ||= ::File.join(bin_root, vault_name)
  end

  ## Class methods
  #
  # These can be
  #
  class << self
    def install_checksum(node)
      @node['hashicorp']['checksums'].fetch(install_version(node))
    end

    def install_extension
      '.zip'
    end

    def install_file(node)
      install_version(node) + install_extension
    end

    def install_version(node)
      ['hashicorp',
       @node['hashicorp']['version'],
       @node['os'],
       install_arch].join('_')
    end

    def install_arch
      node['kernel']['machine'] =~ /x86_64/ ? 'amd64' : '386'
    end

    ## Private class methods
    #
    # These should be called from within the class.
    #
    private

    ## Windows Friendly Path
    #
    # Returns Windows friendly version of the provided path,
    # ensures backslashes are used everywhere.
    # Gently plucked from https://github.com/chef-cookbooks/windows
    def win_friendly_path(path)
      path&.gsub(::File::SEPARATOR, ::File::ALT_SEPARATOR || '\\')
    end

    # Simply using ::File.join was causing several attributes
    # to return strange values in the resources
    # (e.g. "C:/Program Files/\\consul\\data")
    def join_path(*path)
      win_friendly_path(::File.join(path))
    end

    def program_files
      join_path('C:', 'Program Files') +
        (node['kernel']['machine'] =~ /x86_64/ ? '' : ' x(86)')
    end

    def config_prefix_path
      join_path(program_files, 'consul')
    end

    def data_path
      join_path(program_files, 'consul', 'data')
    end
  end
end

##
#
# Update the Chef::Resource and Chef::Recipe classes to make our helper
# available in recipes and resources.
#
class Chef
  ## Helper methods added to Chef Resources
  #
  class Resource
    def hashicorp
      ::HashicorpHelpers.new(node)
    end
  end

  ## Helper methods added to Chef Recipes
  #
  class Recipe
    def hashicorp
      ::HashicorpHelpers.new(node)
    end
  end
end

# Chef::DSL::Recipe.include ::Hashicorp::Helpers
# Chef::Resource.include ::Hashicorp::Helpers