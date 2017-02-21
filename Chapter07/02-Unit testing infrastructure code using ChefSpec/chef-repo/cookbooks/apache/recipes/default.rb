#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd" do
  action :install
end

service "httpd" do
  action [:enable, :start]
end
