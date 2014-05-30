#
# Cookbook Name:: sch-base
# Recipe:: default
#
# Copyright (C) 2014 David F. Severski

#include_recipe 'htop'

package "screen"
package "tcpdump"

#install htop
case node["platform_family"]
  when "rhel"
    include_recipe 'yum-repoforge'
end
package "htop"

if node.attribute?('cloud') && node['cloud']['provider'] == "ec2"
  case node["platform_family"]
    when "debian"
      homeuser = 'ubuntu'
    when "rhel"
      homeuser = 'ec2-user'
    end
else
  homeuser = 'vagrant'
end
#homeuser = node['current_user']

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

#elasticsearch recipie takes care of all of tis
#directory "/es" do
#	action :create
#end

#mount "/es" do
#	device "/dev/sdb1"
#	fstype "ext4"
#	options "rw"
#	action [:mount, :enable]
#end