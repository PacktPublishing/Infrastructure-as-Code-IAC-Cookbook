#
# Cookbook Name:: apache
# Recipe:: virtualhost
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory "/var/www/#{node["sitename"]}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file "/var/www/#{node["sitename"]}/index.html" do
  owner 'root'
  group 'root'
  mode '0644'
  content '<html><h1>Hello from Chef!</h1></html>'
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
