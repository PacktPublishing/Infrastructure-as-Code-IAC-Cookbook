require 'spec_helper'

# Description of the “apache::htpasswd” ‘define’ resource
describe 'apache::htpasswd', :type => :define do

  # As a requirement, we should load the apache class
  let :pre_condition do
    'class {"apache":;}'
  end

  # Define a title for the 'define' resource
  let :title do
    'myhtpasswd'
  end

  # Parameters list
  let :params do 
    {
      :filepath => '/tmp/htpasswd' , 
      :users => [ { "id" => "user1", "htpasswd" => "hash1" } ]
    }
  end

  # Assertion list
  it { is_expected.to compile }
  it { is_expected.to contain_class('apache') }
  it { is_expected.to contain_file('/tmp/htpasswd')
    .with_content(/user1:hash1/) }
end

