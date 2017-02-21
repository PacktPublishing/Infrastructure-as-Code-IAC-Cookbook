#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# node.override['chef_client']['interval'] = '900'
# include_recipe 'chef-client'

node.override['chef_client']['init_style'] = 'none'
node.override['chef_client']['cron']['minute'] = '*/15'
node.override['chef_client']['cron']['hour'] = '*'

include_recipe 'chef-client::cron'
