require 'spec_helper'

describe yumrepo('mysql57-community') do
    it { should be_exist   }
    it { should be_enabled }
end

describe service('mysql-default') do
  it { should be_enabled }
  it { should be_running }
end

describe port('3306') do
  it { should be_listening }
end
