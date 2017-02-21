require 'spec_helper'

# Description of the “apache” class
describe 'apache' do
  # Assertion list
  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_package('apache2').with(
     {
      'ensure' => 'present',
    }
  ) }
  it { is_expected.to contain_service('apache2').with(
     {
      'ensure' => 'running',
      'enable' => 'true',
    }
  ) }
end

