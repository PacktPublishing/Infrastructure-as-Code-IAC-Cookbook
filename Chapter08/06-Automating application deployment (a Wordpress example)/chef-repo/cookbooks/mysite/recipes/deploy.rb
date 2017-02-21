#
# Cookbook Name:: mysite
# Recipe:: deploy
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apache::virtualhost'
include_recipe 'mysite::mysql'

package 'git'
package 'mysql-community-devel'

mysql2_chef_gem 'default' do
  action :install
end

mysql_connection_info = {
  host: '127.0.0.1',
  username: 'root',
  password: 'super_secure_password'
}

mysql_database 'wordpress' do
  connection  mysql_connection_info
  action      :create
end

mysql_database_user 'wordpress_user' do
  connection    mysql_connection_info
  password      'changeme'
  database_name 'wordpress'
  host          '%'
  privileges    [:all]
  action        [:create, :grant]
end

deploy_revision 'wordpress' do
  repo 'https://github.com/WordPress/WordPress'
  revision 'HEAD'
  user 'apache'
  deploy_to "/var/www/#{node['sitename']}"
  keep_releases 5
  symlinks({})
  symlink_before_migrate({})
  migrate false
  action :deploy
end
