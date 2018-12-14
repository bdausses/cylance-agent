#
# Cookbook:: cylance-agent
# Recipe:: default
#
# Copyright:: 2018, Chef Software, All Rights Reserved.

# Create /opt/cylance
directory '/opt/cylance' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

# Configuring config_defaults.txt
template '/opt/cylance/config_defaults.txt' do
  source 'cylance_config_defaults.txt.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

remote_file '/tmp/CylancePROTECT.el7.rpm' do
  source 'https://s3.amazonaws.com/sysco-security/cylance/CylancePROTECT.el7.rpm'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

# Install Cylance
package 'CylancePROTECT' do
  source '/tmp/CylancePROTECT.el7.rpm'
  action :install
end

# Start and enable Cylance
service 'cylancesvc' do
  action [:enable, :start]
end
