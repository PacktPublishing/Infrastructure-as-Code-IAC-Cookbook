#
# Cookbook Name:: mysite
# Recipe:: aws
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'chef-vault'

aws = Chef::EncryptedDataBagItem.load('aws', 'us-east-1', 's3cr3t')

directory '/etc/aws' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/aws/credentials' do
  source 'aws.erb'
  owner 'root'
  group 'root'
  mode '0600'
  variables(
    aws_region: aws['id'],
    aws_access_key: aws['aws_access_key'],
    aws_secret_key: aws['aws_secret_key']
  )
end
