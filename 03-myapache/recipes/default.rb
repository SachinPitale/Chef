#
# Cookbook:: myapache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
apt_update 'update_ubuntu_package' do
  action :update
end

apt_package 'apache2' do
    action :install
end
