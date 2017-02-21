require 'spec_helper'

describe package('docker-engine') do
  it { should be_installed }
end

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end

describe command('docker images') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(%r{^sjourdan/terraform\s.*0.7.10}) }
end
