#
# Cookbook Name:: sch-base
# Recipe:: default
#
# Copyright (C) 2014 David F. Severski

package "screen"
package "htop"

#if node['cloud']['provider'] == 'ec2'
  #homeuser = 'ec2-user'
  #homeuser = 'ubuntu'
#else
#  homeuser = 'vagrant'
#end
homeuser = node['current_user']

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