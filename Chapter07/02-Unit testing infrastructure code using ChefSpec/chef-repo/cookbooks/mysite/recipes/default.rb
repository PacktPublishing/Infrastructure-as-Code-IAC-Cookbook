#
# Cookbook Name:: mysite
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
node.override['sitename'] = 'mysite'

include_recipe 'apache'
include_recipe 'apache::virtualhost'
include_recipe 'php'
include_recipe 'mysite::htaccess'
include_recipe 'mysite::mysql'
