#
# Cookbook:: .
# Recipe:: dotnet
#
# Copyright:: 2021, The Authors, All Rights Reserved.

dotnet_app_url = node['nopcommerce']['package_Url']
dotnet_app_location= node['nopcommerce']['package_location_temp']
dotnet_packages = node['nopcommerce']['dotnet_packages'] 

remote_file dotnet_app_location do
    source dotnet_app_url
    action :create
    notifies :run, 'execute[registerkey]', :immediate
end


execute 'registerkey' do
    command "sudo dpkg -i #{dotnet_app_location}"
    action :run
end


apt_update 'name' do
    ignore_failure true
    action :update
end


package 'install dotnet packages' do
    package_name dotnet_packages
    action :install
end

