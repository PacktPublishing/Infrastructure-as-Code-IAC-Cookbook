require 'spec_helper'

# Description of the “apache::vhost” ‘define’ resource
describe 'apache::vhost', :type => :define do

  # As a requierement, we should load the apache class
  let :pre_condition do
    'class {"apache":;}'
  end

  # Define a title for the 'define' resource
  let :title do
    'mysite'
  end

  # Define parameters 
  let :params do 
    {
      :site => 'www.sample.com' , 
      :docroot => '/var/www/docroot',
    }
  end

  # Assertions list !
  it { is_expected.to compile }
  it { is_expected.to contain_class('apache') }
  it { is_expected.to contain_file('/etc/apache2/sites-available/www.sample.com.conf')
    .with_content(/DocumentRoot \/var\/www\/docroot/) }
  it { is_expected.to contain_file('/etc/apache2/sites-enabled/www.sample.com.conf').with(
    'ensure' => 'link',
    'target' => '/etc/apache2/sites-available/www.sample.com.conf'
  ) }
end

