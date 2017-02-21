#
# Cookbook Name:: php
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'php::default' do
  context 'Default attributes on CentOS 7.2' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs php' do
      expect(chef_run).to install_package('php')
    end

    it 'installs php-cli' do
      expect(chef_run).to install_package('php-cli')
    end

    it 'installs php-mysql' do
      expect(chef_run).to install_package('php-mysql')
    end

    it 'creates a phpinfo.php file' do
      expect(chef_run).to create_file('/var/www/html/phpinfo.php').with(
        user: 'root',
        group: 'root'
      )
    end
  end
end
