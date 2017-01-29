#
# Cookbook:: adhoc
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#adhoc commands 
execute "apt-get update" do
  command "apt-get update"
end
