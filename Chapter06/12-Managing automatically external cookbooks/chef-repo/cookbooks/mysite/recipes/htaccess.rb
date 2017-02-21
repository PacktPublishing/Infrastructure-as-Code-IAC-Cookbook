#
# Cookbook Name:: mysite
# Recipe:: htaccess
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

users = search(:webusers, "*:*")

template "/etc/httpd/htpasswd" do
  source "htpasswd.erb"
  owner 'root'
  group 'root'
  mode '0660'
  variables(
    :users => users
  )
end

template "/var/www/mysite/.htaccess" do
  source "htaccess.erb"
  owner 'root'
  group 'root'
  mode '0644'
end
