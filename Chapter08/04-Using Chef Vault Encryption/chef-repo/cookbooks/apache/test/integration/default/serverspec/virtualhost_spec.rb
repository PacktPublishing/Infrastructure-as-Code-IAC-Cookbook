require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/var/www/default') do
  it { should be_directory }
end

describe file('/var/www/default/index.html') do
  it { should exist }
  it { should be_mode 644 }
  its(:content) { should match /Hello from Chef!/ }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/httpd/conf.d/default.conf') do
  it { should exist }
  it { should be_mode 644 }
  its(:content) { should match /ServerName default/ }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
