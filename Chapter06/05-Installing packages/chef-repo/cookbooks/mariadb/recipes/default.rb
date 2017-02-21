#
# Cookbook Name:: mariadb
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

%w(mariadb mariadb-server).each do |name|
  package name do
    action :install
  end
end
