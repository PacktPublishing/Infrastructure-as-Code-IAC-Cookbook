#
# Cookbook Name:: platform
# Recipe:: docker
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Enables the main Docker repo (otherwise: 'test' or 'experimental')
docker_installation 'default' do
  repo 'main'
  action :create
end

# Create and starts the docker engine service
docker_service 'default' do
  action [:create, :start]
end

# Pulls a Terraform docker image
docker_image 'sjourdan/terraform' do
  tag '0.7.10'
  action :pull
end
