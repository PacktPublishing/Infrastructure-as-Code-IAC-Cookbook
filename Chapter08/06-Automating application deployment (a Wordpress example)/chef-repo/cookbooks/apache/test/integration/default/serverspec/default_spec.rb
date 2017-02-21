require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('httpd') do
  it { should be_installed }
end

describe port('80') do
  it { should be_listening }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end
