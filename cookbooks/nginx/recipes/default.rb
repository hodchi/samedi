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


execute "nginxinstallstatus" do
  command "touch /tmp/nginxinstall"
end
