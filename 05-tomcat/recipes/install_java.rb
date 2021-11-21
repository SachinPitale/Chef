#
# Cookbook:: .
# Recipe:: install_java
#
# Copyright:: 2021, The Authors, All Rights Reserved.

java_Package = node['tomcat']['java_version']

apt_update 'Update Ubuntu os' do
    ignore_failure true
    action :update
    only_if { node['platform'] == 'ubuntu' }
end

package java_Package do
    action :install
end

