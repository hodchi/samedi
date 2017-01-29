#
# Cookbook:: tracks
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.



##update gem
 
execute "gem update" do
  command "gem update"
end

#install bundler
gem_package 'bundler' do
  action :install
end




#install mysql
package ['mysql-server'] do
  action :install
end

service 'mysql' do
  action [ :enable, :start ]
end

##
#create a mysql database
#mysql_database 'tracks' do
#  connection(
#    :host     => '127.0.0.1',
#    :username => 'root',
#    :password => node['tracks']['mysql']['root']
#  )
#  action :create
#end
