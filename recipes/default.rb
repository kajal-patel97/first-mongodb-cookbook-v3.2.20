#
# Cookbook:: mongodb_cookbook_final
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
include_recipe 'apt'
# include_recipe 'debian'

execute 'mongod_apt_key'do
  command 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927'
  action :run
end

execute 'mongod_update_sourcelist' do
  command "echo 'deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list"
  action :run
end

include_recipe apt
apt-update


execute 'mongodb_install' do
  command 'sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20'
  action :run
end

execute 'mongod_provision_script' do
  command 'sudo systemctl restart mongod'
  action :run
end

execute 'mongod_provision_script' do
  command 'sudo systemctl enable mongod'
  action :run
end
