#
# Cookbook Name:: mysite
# Recipe:: htaccess
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apache::virtualhost'

if Chef::Config[:solo]
  Chef::Log.warn('This recipe uses search. Chef Solo does not support search.')
else
  users = search(:webusers, '*:*')
end

template '/etc/httpd/htpasswd' do
  source 'htpasswd.erb'
  owner 'root'
  group 'root'
  mode '0660'
  variables(
    users: users
  )
end

template "/var/www/#{node["sitename"]}/.htaccess" do
  source 'htaccess.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
