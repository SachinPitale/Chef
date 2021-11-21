#
# Cookbook:: .
# Recipe:: lamp
#
# Copyright:: 2021, The Authors, All Rights Reserved.


apt_update 'name' do
    ignore_failure true
    action :update
end

apt_package 'apache2' do
    action :install
end

php_packages = %w(php libapache2-mod-php php-mysql php-cli)


php_packages.each do |php_package|
    package  php_package do
        action :install
    end
end  





file '/var/www/html/info.php' do
    content '<?php phpinfo(); ?>'
    action :create
end

service 'apache2' do
    action :restart
end
