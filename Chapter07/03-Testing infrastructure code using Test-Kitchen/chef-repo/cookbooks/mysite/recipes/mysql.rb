#
# Cookbook Name:: mysite
# Recipe:: mysql
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# mysql requirement https://github.com/chef-cookbooks/mysql
include_recipe 'selinux::disabled'
include_recipe 'yum-mysql-community::mysql57'

mysql_service 'default' do
  port '3306'
  version '5.7'
  initial_root_password 'super_secure_password'
  action [:create, :start]
end
