#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'ubuntu' || node['platform'] == 'redhat'
    include_recipe 'webserver::apache'
else
    raise 'This cookbook is supporting only ubuntu and redhat distributions'
end