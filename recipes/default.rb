#
# Cookbook Name:: screenshot_as_a_service
# Recipe:: default
#
# Copyright 2014, Sho Yoshida
#
# All rights reserved - Do Not Redistribute
#

# source: git@github.com:yss44/screenshot-as-a-service.git

Chef::Log.logger.info 'Nodejs should be installed before this Recipe'

directory node['screenshot_as_a_service']['app_dir'] do
  recursive true
  owner "root"
  mode 0755
  action :create
end

#
# インストール
#
git "#{node['screenshot_as_a_service']['app_dir']}/screenshot-as-a-service" do
  repository "https://github.com/yss44/screenshot-as-a-service.git"
  reference "master"
  action :sync
  user "root"
end


#
# 設定ファイルを指定
#
template "#{node['screenshot_as_a_service']['app_dir']}/screenshot-as-a-service/config/default.yaml" do
  source 'default.yaml'
  owner "root"
  group "root"
  mode  "0755"
end

#
# 依存関係解決
#
bash "install dependencies" do
  cwd "#{node['screenshot_as_a_service']['app_dir']}/screenshot-as-a-service"
  code "npm install && touch #{node['screenshot_as_a_service']['app_dir']}/screenshot-as-a-service/.installed;"
  creates "#{node['screenshot_as_a_service']['app_dir']}/screenshot-as-a-service/.installed"
end

#
# 永続化のためのforeverのインストール
#
bash "install forever" do
  code "npm install forever -g"
  creates "/usr/local/bin/forever"
end


#
# 設定ファイルを指定
#
template "/etc/init.d/screenshot-as-a-service-init" do
  source 'screenshot-as-a-service-init'
  owner "root"
  group "root"
  mode  "0755"
end

service "screenshot-as-a-service-init" do
  supports status:true, restart:true, reload:true
  action [:enable, :start]
end









