require 'spec_helper'

# Description of the “apache::htaccess” ‘define’ resource
describe 'apache::htaccess', :type => :define do

  # As a requirement, we should load the apache class
  let :pre_condition do
    'class {"apache":;}'
  end

  # Define a title for the 'define' resource
  let :title do
    'myhtaccess'
  end

  # Parameters list
  let :params do 
    {
      :filepath => '/tmp/htpasswd' , 
      :docroot => '/var/www/docroot',
    }
  end

  # Assertion list
  it { is_expected.to compile }
  it { is_expected.to contain_class('apache') }
  it { is_expected.to contain_file('/var/www/docroot/.htaccess')
    .with_content(/AuthUserFile \/tmp\/htpasswd/) }
end

