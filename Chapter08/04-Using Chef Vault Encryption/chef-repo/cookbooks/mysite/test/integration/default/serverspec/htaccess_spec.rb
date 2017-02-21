require 'spec_helper'

describe file('/etc/httpd/htpasswd') do
  it { should exist }
  it { should be_mode 660 }
  its(:content) { should match /john/ }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/var/www/mysite/.htaccess') do
  it { should exist }
  it { should be_mode 644 }
  its(:content) { should match /AuthUserFile \/etc\/httpd\/htpasswd/ }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
