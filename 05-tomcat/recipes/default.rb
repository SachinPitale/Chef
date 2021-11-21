#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'ubuntu' || node['platform'] == 'redhat'
    include_recipe 'tomcat::install_java'
    include_recipe 'tomcat::configure'
    include_recipe 'tomcat::deploy'
else
    raise 'This cookbook supports only ubuntu and redhat platforms'
end