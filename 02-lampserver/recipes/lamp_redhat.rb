#
# Cookbook:: lampserver
# Recipe:: lamp_redhat
#
# Copyright:: 2021, The Authors, All Rights Reserved.


#sudo dnf update
#sudo dnf install httpd -y
#sudo systemctl enable httpd.service
#sudo systemctl start httpd.service
#sudo dnf install php php-mysqlnd php-mbstring php-opcache php-gd -y
# echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

apache_package = 'httpd'
php_packages = %w(php php-mysqlnd php-mbstring php-opcache php-gd)
package apache_package do
    action :install
end

service apache_package do
    action [:start, :enable]
end

package 'phppackages' do
    package_name php_packages
    action :install
end

file '/var/www/html/info.php' do
    content '<?php phpinfo(); ?>'
    action :create
end

service 'restartapache' do
    service_name apache_package
    action :restart
end



