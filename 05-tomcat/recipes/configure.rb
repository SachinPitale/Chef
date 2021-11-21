#
# Cookbook:: .
# Recipe:: configure
#
# Copyright:: 2021, The Authors, All Rights Reserved.

tomcat_group = node['tomcat']['tomcat_group'] 
tomcat_user = node['tomcat']['tomcat_user'] 
home_dir = node['tomcat']['tomcat_home']
tocmat_shell = node['tomcat']['tomcat_user_login'] 
tomcat_download_url = node['tomcat']['tomcat_installation_url']
tomcat_destination = node['tomcat']['tomcat_download_temp_location']

group tomcat_group do
    action :create
end


user tomcat_user do
    gid tomcat_group
    home home_dir
    shell tocmat_shell
    action :create
end


remote_file tomcat_destination do
    source tomcat_download_url
    action :create
end

directory home_dir do
    action :create
end

execute 'untartomcat' do
    command "tar xzvf #{tomcat_destination} -C #{home_dir} --strip-components=1"
    action :run
    only_if {not Dir.exist?"#{home_dir}/conf"}
end

execute 'change group permission to tomcat' do
    command "chgrp -R #{tomcat_user} #{home_dir}"
    action :run 
    subscribes :run, 'execute[untartomcat]',:immediately
    
end

execute 'give read permissions to the group for conf folder' do
    command "sudo chmod -R g+r #{home_dir}/conf"
    action :run
    subscribes :run, 'execute[untartomcat]', :immediately
end

execute 'give execute permissions to the group for conf folder' do
    command "sudo chmod g+x #{home_dir}/conf"
    action :run
    subscribes :run, 'execute[untartomcat]', :immediately
end

execute 'change ownership for tomcat folders' do
    command "sudo chown -R #{tomcat_user} #{home_dir}/webapps/  #{home_dir}/work/ #{home_dir}/temp/ #{home_dir}/logs/"
    action :run
    subscribes :run, 'execute[untartomcat]', :immediately
end

tomcat_service = node['tomcat']['tomcat_service_location']

#cookbook_file tomcat_service do
#    source 'tomcat.sevice'
#    action :create
#    notifies :enable, 'service[tomcat]'
#end

template tomcat_service do
    source 'tomcat.service.erb'
    action :create
end


service 'tomcat' do
    action :start
end


