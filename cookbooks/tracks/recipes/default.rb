#
# Cookbook:: tracks
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.



##update gem
 
execute "gem update" do
  command "gem update"
end

#install bundler for tracks install
gem_package 'bundler' do
  action :install
end


#install mysql
package ['mysql-server'] do
  action :install
end

##run at start
service 'mysql' do
  action [ :enable, :start ]
end


#set up db
#copy .sh file to root directory to hide pw and execute

cookbook_file '/root/mysql.sh' do
  source 'mysql.sh'
  owner 'root'
  group 'root'
  mode '0700'
  action :create
end

execute "run script" do
  command "bash /root/mysql.sh"
end


##download and unzip tracks

execute "get tracks code" do  
  command "cd /opt && wget https://github.com/TracksApp/tracks/archive/v2.3.0.zip && unzip v2.3.0.zip && cd tracks* && bundle install --without development test"
end

#copy variable files

cookbook_file '/opt/tracks-2.3.0/config/database.yml' do
  source 'database.yml'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file '/opt/tracks-2.3.0/config/site.yml' do
  source 'site.yml'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end


#populate db
execute "populate" do
  command "cd /opt && bundle exec rake db:migrate RAILS_ENV=production"
end


#precompile assets
execute "precompile" do
  command "cd /opt && bundle exec rake assets:precompile RAILS_ENV=production"
end

#start server

execute "start webricks" do
  command "cd /opt && bundle exec rails server -e production"
end

