require 'spec_helper'

describe file('/var/www/mysite') do
  it { should be_directory }
end

describe file('/var/www/mysite/index.html') do
  it { should exist }
  it { should be_mode 644 }
  its(:content) { should match /Hello from Chef!/ }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/httpd/conf.d/mysite.conf') do
  it { should exist }
  it { should be_mode 644 }
  its(:content) { should match /ServerName mysite/ }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
