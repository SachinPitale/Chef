#
# Cookbook:: nopcommerce
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'nopcommerce::mysql'
include_recipe 'nopcommerce::dotnet'
include_recipe 'nopcommerce::nginx'
include_recipe 'nopcommerce::nopcommerce'