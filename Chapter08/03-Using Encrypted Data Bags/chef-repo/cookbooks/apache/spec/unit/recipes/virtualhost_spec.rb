#
# Cookbook Name:: apache
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::virtualhost' do
  context 'Default attributes on CentOS 7.2' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates a virtualhost directory' do
      expect(chef_run).to create_directory('/var/www/default').with(
        user: 'root',
        group: 'root'
      )
    end

    it 'creates and index.html file' do
      expect(chef_run).to create_file('/var/www/default/index.html').with(
        user: 'root',
        group: 'root'
      )
    end
    
    it 'creates a virtualhost configuration file' do
      expect(chef_run).to create_template('/etc/httpd/conf.d/default.conf').with(
        user: 'root',
        group: 'root'
      )
    end
  end
end
