#
# Cookbook Name:: custom
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME

package "screen"
package "htop"

#if node['cloud']['provider'] == 'ec2'
  homeuser = 'ec2-user'
#else
#  homeuser = 'vagrant'
#end

directory "/home/#{homeuser}/.config" do
  action :create
end

directory "/home/#{homeuser}/.config/htop" do
  action :create
end

file "/home/#{homeuser}/.config/htop/htoprc" do
	content "show_thread_names=1"
	only_if do ! File.exists?("/home/#{homeuser}/.config/htop/htoprc") end
end

package "lsof"

directory "/es" do
	action :create
end

#mount "/es" do
#	device "/dev/sdb1"
#	fstype "ext4"
#	options "rw"
#	action [:mount, :enable]
#end