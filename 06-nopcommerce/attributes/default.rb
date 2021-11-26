
default['nopcommerce']['package_Url'] = "https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb"
default['nopcommerce']['package_location_temp'] = "/tmp/packages-microsoft-prod.deb"

default['nopcommerce']['dotnet_packages'] = %w(apt-transport-https aspnetcore-runtime-3.1)

default['nopcommerce']['nginx']['package_name'] = "nginx"
default['nopcommerce']['nginx']['sites_available'] =  "/etc/nginx/sites-available/default"

default['nopcommerce']['nginx']['proxy'] = "http://localhost:5000"



default['nopcommerce']['home_dir'] = '/var/www/nopCommerce440'
default['nopcommerce']['download_url'] = 'https://github.com/nopSolutions/nopCommerce/releases/download/release-4.40.3/nopCommerce_4.40.3_NoSource_linux_x64.zip'
default['nopcommerce']['download_temp_location'] = '/tmp/nopCommerce_4.40.3_NoSource_linux_x64.zip'