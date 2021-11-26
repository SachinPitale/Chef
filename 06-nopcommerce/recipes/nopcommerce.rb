#
# Cookbook:: .
# Recipe:: nopcommerce
#
# Copyright:: 2021, The Authors, All Rights Reserved.

nop_download_url = node['nopcommerce']['download_url']
nop_download_temp_location = node['nopcommerce']['download_temp_location']
nop_home_dir = node['nopcommerce']['home_dir']





remote_file nop_download_temp_location do
    source nop_download_url
    action :create
end

archive_file 'unzip_nop' do
    path nop_download_temp_location
    destination nop_home_dir
    action :extract
    # create a notification to change group permissions
end
