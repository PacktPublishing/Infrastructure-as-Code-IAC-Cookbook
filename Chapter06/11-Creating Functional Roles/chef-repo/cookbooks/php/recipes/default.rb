#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

%w(php php-cli php-mysql).each do |name|
  package name do
    action :install
  end
end

file '/var/www/html/phpinfo.php' do
  content '<?php phpinfo(); ?>'
  mode '0644'
  owner 'root'
  group 'root'
end
