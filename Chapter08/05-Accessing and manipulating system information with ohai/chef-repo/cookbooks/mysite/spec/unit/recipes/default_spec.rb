#
# Cookbook Name:: mysite
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mysite::default' do
  context 'Default attributes on CentOS 7.2' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.create_data_bag('webusers', {
        'john' => {
          'id' => 'john',
          'htpasswd' => '$apr1$AUI2Y5pj$0v0PaSlLfc6QxZx1Vx5Se.'
        }
      })
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the `apache` recipes' do
      expect(chef_run).to include_recipe('apache::default')
      expect(chef_run).to include_recipe('apache::virtualhost')
    end

    it 'includes the `php` recipe' do
      expect(chef_run).to include_recipe('php::default')
    end

    it 'includes the `mysite` recipes' do
      expect(chef_run).to include_recipe('mysite::htaccess')
      expect(chef_run).to include_recipe('mysite::mysql')
    end

  end
end
