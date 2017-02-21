require 'beaker-rspec'
require 'beaker/puppet_install_helper'

# Install puppet
run_puppet_install_helper


RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Output should contain test descriptions
  c.formatter = :documentation

  # Configure nodes
  c.before :suite do
    # Install module 
    puppet_module_install(:source => proj_root, :module_name => 'apache')
  end
end
