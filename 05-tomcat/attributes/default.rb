
if node['platform'] == 'ubuntu'
    default['tomcat']['java_version'] = 'openjdk-8-jdk'
    default['tomcat']['JAVA_HOME'] = '/usr/lib/jvm/java-1.8.0-openjdk-amd64'
elsif node['platform'] == 'redhat'
    default['tomcat']['java_version'] = 'java-1.8.0-openjdk'
    default['tomcat']['JAVA_HOME'] = '/usr/lib/jvm/jre'
end

default['tomcat']['tomcat_group'] = 'tomcat'
default['tomcat']['tomcat_user'] = 'tomcat'
default['tomcat']['tomcat_user_login'] = '/bin/false'
default['tomcat']['tomcat_home'] = '/opt/tomcat'

default['tomcat']['tomcat_installation_url'] = "https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.54/bin/apache-tomcat-9.0.54.tar.gz"
default['tomcat']['tomcat_download_temp_location']  = '/tmp/apache-tomcat-9.0.54.tar.gz'
default['tomcat']['tomcat_service_location'] = "/etc/systemd/system/tomcat.service"
default['tomcat']['Xmsvalue'] = "Xms512M"
default['tomcat']['Xmxvalue'] =  "Xmx1024M"

default['tomcat']['warfile_url'] = 'https://referenceapplicationskhaja.s3-us-west-2.amazonaws.com/gameoflife.war'
default['tomcat']['warfile_destination'] = '/opt/tomcat/webapps/gameoflife.war'