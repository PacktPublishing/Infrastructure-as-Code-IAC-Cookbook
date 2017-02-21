require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('php') do
  it { should be_installed }
end

describe package('php-cli') do
  it { should be_installed }
end

describe package('php-mysql') do
  it { should be_installed }
end

describe file('/var/www/html/phpinfo.php') do
  it { should exist }
  it { should be_mode 644 }
  its(:content) { should match /phpinfo()/ }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
