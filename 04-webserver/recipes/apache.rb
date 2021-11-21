#
# Cookbook:: .
# Recipe:: apache
#
# Copyright:: 2021, The Authors, All Rights Reserved.

apt_update 'Update ubuntu package' do
    ignore_failure true
    action :update
    only_if { node['platform'] == 'ubuntu'}
end

apache_package =  node['webserver']['apache_package']
php_packages = node['webserver']['php_package']

package apache_package do
    action :install
end


package 'Install php package' do
    package_name php_packages
    action :install
end

service apache_package do
    action [:start, :enable]
end


file '/var/www/html/info.php' do
    content '<?php phpinfo(); ?>'
    action :create
end

service apache_package do
    action :restart
end
