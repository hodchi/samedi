#
# Cookbook:: adhoc
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#adhoc commands

#add ruby apt 2.3 repo

execute "add repo" do
  command "apt-add-repository ppa:brightbox/ruby-ng -y"
end

##update
 
execute "apt-get update" do
  command "apt-get update"
end


##usual dependencies
execute "apt-get update" do
  command "apt-get install libmysqlclient-dev libsqlite3-dev libgmp3-dev build-essential"
end

