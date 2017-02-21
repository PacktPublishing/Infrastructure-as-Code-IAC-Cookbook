#
# Cookbook Name:: mysite
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mysite::mysql' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      # The selinux cookbook raises this error.
      expect { chef_run }.to raise_error(RuntimeError, 'chefspec not supported!')
    end

    it 'includes the dependant recipes' do
      expect(chef_run).to include_recipe('selinux::disabled')
      expect(chef_run).to include_recipe('yum-mysql-community::mysql57')
    end

  end
end
