#
# Cookbook Name:: apache
# Recipe:: virtualhost
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apache::default'

directory "/var/www/#{node["sitename"]}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template "/var/www/#{node["sitename"]}/index.html" do
  source 'index.html.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template "/etc/httpd/conf.d/#{node["sitename"]}.conf" do
  source "virtualhost.erb"
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    :website => "#{node["sitename"]}"
  )
  notifies :restart, resources(:service => "httpd")
end
