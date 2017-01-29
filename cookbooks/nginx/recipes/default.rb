#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


##includes update before install nginx
include_recipe "adhoc"


##install nginx
package 'nginx' do
  action :install
end

## start right away and after boot
service 'nginx' do
  action [ :enable, :start ]
end

cookbook_file "/tmp/nginxinstall" do
  source "/files/nginxinstall"
  mode "777"
end
