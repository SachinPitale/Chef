
if node['platform'] == 'ubuntu'
    default['webserver']['apache_package'] = "apache2"
    default['webserver']['php_package'] =  %w(php libapache2-mod-php php-mysql php-cli)
elsif node['platform'] == 'redhat'
    default['webserver']['apache_package'] = "httpd"
    default['webserver']['php_package']   =   %w(php php-mysqlnd php-mbstring php-opcache php-gd)
end