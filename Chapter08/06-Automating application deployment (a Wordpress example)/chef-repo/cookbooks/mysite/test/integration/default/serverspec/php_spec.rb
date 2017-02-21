require 'spec_helper'

describe package('php') do
  it { should be_installed }
end

describe package('php-cli') do
  it { should be_installed }
end

describe package('php-mysql') do
  it { should be_installed }
end
