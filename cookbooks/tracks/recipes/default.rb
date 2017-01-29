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


#äset up db
execute "create db" do
sshpass -p root mysql -u root -p -e "CREATE DATABASE tracks; GRANT ALL PRIVILEGES ON tracks.* TO root@localhost IDENTIFIED BY 'root' WITH GRANT OPTION;  "



##download and unzip tracks

execute "get tracks code" do  
  command "cd /opt && wget https://github.com/TracksApp/tracks/archive/v2.3.0.zip && unzip v2.3.0.zip && cd tracks* && bundle install --without development test"
end


