#
# Cookbook:: .
# Recipe:: nginx
#
# Copyright:: 2021, The Authors, All Rights Reserved.


package_nginx = node['nopcommerce']['nginx']['package_name']
sites_available_path  = node['nopcommerce']['nginx']['sites_available'] 

package package_nginx do
    action :install
end


#cookbook_file sites_available_path do
#    source 'default'
#    action :create
#end

template sites_available_path do
    source 'default.erb'
    action :create
end


