#
# Cookbook:: .
# Recipe:: deploy
#
# Copyright:: 2021, The Authors, All Rights Reserved.

war_url = node['tomcat']['warfile_url']
war_dest = node['tomcat']['warfile_destination']


remote_file war_dest do
    source war_url
    action :create
end
