#
# Cookbook Name:: sch-kibana
# Recipe:: default
#
# Copyright (C) 2014 David F. Severski
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
if node['kibana']['user'].empty?
  if !node['kibana']['webserver'].empty?
    webserver = node['kibana']['webserver']
    kibana_user = node[webserver]['user']
  else
    kibana_user = 'nobody'
  end
else
  kibana_user = node['kibana']['user']
end

log("Kibaba user is " + kibana_user)

kibana_user kibana_user do
  name kibana_user
  group kibana_user
  home node['kibana']['install_dir']
  action :create
end

kibana_install 'kibana' do
  user kibana_user
  group kibana_user
  install_dir node['kibana']['install_dir']
  install_type node['kibana']['install_type']
  action :create
end

template "#{node['kibana']['install_dir']}/current/config.js" do
  source node['kibana']['config_template']
  cookbook node['kibana']['config_cookbook']
  mode '0750'
  user kibana_user
end

link "#{node['kibana']['install_dir']}/current/app/dashboards/default.json" do
  to 'logstash.json'
  only_if { !File.symlink?("#{node['kibana']['install_dir']}/current/app/dashboards/default.json") }
end

kibana_web 'kibana' do
  type node['kibana']['webserver']
  docroot "#{node['kibana']['install_dir']}/current"
  es_server node['kibana']['es_server']
  not_if { node['kibana']['webserver'].empty? }
end