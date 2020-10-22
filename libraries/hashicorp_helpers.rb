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

  ## Atlantis
  #
  def atlantis_name
    @atlantis_name ||= 'atlantis'
  end

  def atlantis_version
    @atlantis_version ||= @node[atlantis_name]['version']
  end

  def atlantis_checksum
    @atlantis_version ||= @node[atlantis_name]['checksum']
  end

  def atlantis_user
    @atlantis_user ||= atlantis_name
  end

  def atlantis_group
    @atlantis_group ||= atlantis_name
  end

  def atlantis_home
    @atlantis_home ||= File.join(home_root, atlantis_name)
  end

  def atlantis_bin
    @atlantis_bin ||= ::File.join(bin_root, atlantis_name)
  end

  ## Consul
  #
  def consul_name
    @consul_name ||= 'consul'
  end

  def consul_version
    @consul_version ||= @node[consul_name]['version']
  end

  def consul_checksum
    @consul_version ||= @node[consul_name]['checksum']
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

  ## Consul-Template
  #
  # A cookbook `chef-consul-template` exists with node['consul_tmplate'].
  # We use `consul-template` to prevent interaction.
  #
  def consul_template_name
    @consul_template_name ||= 'consul-template'
  end

  def consul_template_version
    @consul_template_version ||= @node[consul_template_name]['version']
  end

  def consul_template_checksum
    @consul_template_version ||= @node[consul_template_name]['checksum']
  end

  def consul_template_user
    @consul_template_user ||= consul_template_name
  end

  def consul_template_group
    @consul_template_group ||= consul_template_name
  end

  def consul_template_home
    @consul_template_home ||= File.join(home_root, consul_template_name)
  end

  def consul_template_bin
    @consul_template_bin ||= ::File.join(bin_root, consul_template_name)
  end

  ## Nomad
  #
  def nomad_name
    @nomad_name ||= 'nomad'
  end

  def nomad_version
    @nomad_version ||= @node[nomad_name]['version']
  end

  def nomad_checksum
    @nomad_version ||= @node[nomad_name]['checksum']
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
  def packer_name
    @packer_name ||= 'packer'
  end

  def packer_version
    @packer_version ||= @node[packer_name]['version']
  end

  def packer_checksum
    @packer_version ||= @node[packer_name]['checksum']
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
  def terraform_name
    @terraform_name ||= 'terraform'
  end

  def terraform_version
    @terraform_version ||= @node[terraform_name]['version']
  end

  def terraform_checksum
    @terraform_version ||= @node[terraform_name]['checksum']
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

  ## Terraform Docs
  #
  def terraform_docs_name
    @terraform_docs_name ||= 'terraform-docs'
  end

  def terraform_docs_version
    @terraform_docs_version ||= @node[terraform_docs_name]['version']
  end

  def terraform_docs_checksum
    @terraform_docs_version ||= @node[terraform_docs_name]['checksum']
  end

  def terraform_docs_user
    @terraform_docs_user ||= terraform_docs_name
  end

  def terraform_docs_group
    @terraform_docs_group ||= terraform_docs_name
  end

  def terraform_docs_home
    @terraform_docs_home ||= ::File.join(home_root, terraform_docs_name)
  end

  ## Synchonize with Ark path convention
  #
  # Terraform Docs is installed using `remote_file` resource.
  # We replicate the Ark path when `append_env_path true`.
  #
  def terraform_docs_bin
    @terraform_docs_bin ||= ::File.join(bin_root, "#{terraform_docs_name}-#{terraform_docs_version}" ,terraform_docs_name)
  end

  ## Tflint
  #
  def tflint_name
    @tflint_name ||= 'tflint'
  end

  def tflint_version
    @tflint_version ||= @node[tflint_name]['version']
  end

  def tflint_checksum
    @tflint_version ||= @node[tflint_name]['checksum']
  end

  def tflint_user
    @tflint_user ||= tflint_name
  end

  def tflint_group
    @tflint_group ||= tflint_name
  end

  def tflint_home
    @tflint_home ||= ::File.join(home_root, tflint_name)
  end

  def tflint_bin
    @tflint_bin ||= ::File.join(bin_root, tflint_name)
  end

  ## Tfsec
  #
  def tfsec_name
    @tfsec_name ||= 'tfsec'
  end

  def tfsec_version
    @tfsec_version ||= @node[tfsec_name]['version']
  end

  def tfsec_checksum
    @tfsec_version ||= @node[tfsec_name]['checksum']
  end

  def tfsec_user
    @tfsec_user ||= tfsec_name
  end

  def tfsec_group
    @tfsec_group ||= tfsec_name
  end

  def tfsec_home
    @tfsec_home ||= ::File.join(home_root, tfsec_name)
  end

  ## Synchonize with Ark path convention
  #
  # Tfsec is installed using `remote_file` resource.
  # We replicate the Ark path when `append_env_path true`.
  #
  def tfsec_bin
    @tfsec_bin ||= ::File.join(bin_root, "#{tfsec_name}-#{tfsec_version}" ,tfsec_name)
  end

  ## Terragrunt
  #
  def terragrunt_name
    @terragrunt_name ||= 'terragrunt'
  end

  def terragrunt_version
    @terragrunt_version ||= @node[terragrunt_name]['version']
  end

  def terragrunt_checksum
    @terragrunt_version ||= @node[terragrunt_name]['checksum']
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

  ## Synchonize with Ark path convention
  #
  # Terragrunt is installed using `remote_file` resource.
  # We replicate the Ark path when `append_env_path true`.
  #
  def terragrunt_bin
    @terragrunt_bin ||= ::File.join(bin_root, "#{terragrunt_name}-#{terragrunt_version}", terragrunt_name)
  end

  ## TunnelTo
  #
  def tunnelto_name
    @tunnelto_name ||= 'tunnelto'
  end

  def tunnelto_version
    @tunnelto_version ||= @node[tunnelto_name]['version']
  end

  def tunnelto_checksum
    @tunnelto_version ||= @node[tunnelto_name]['checksum']
  end

  def tunnelto_user
    @tunnelto_user ||= tunnelto_name
  end

  def tunnelto_group
    @tunnelto_group ||= tunnelto_name
  end

  def tunnelto_home
    @tunnelto_home ||= File.join(home_root, tunnelto_name)
  end

  def tunnelto_bin
    @tunnelto_bin ||= ::File.join(bin_root, tunnelto_name)
  end

  ## Vault
  #
  def vault_name
    @vault_name ||= 'vault'
  end

  def vault_version
    @vault_version ||= @node[vault_name]['version']
  end

  def vault_checksum
    @vault_version ||= @node[vault_name]['checksum']
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