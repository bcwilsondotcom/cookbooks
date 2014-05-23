#
# Cookbook Name:: sch-collectd
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

node.override["collectd"]["url"] = 'http://s3.amazonaws.com/collectd-5.4.1/collectd-5.4.1.tar.gz'
include_recipe 'collectd::default'

collectd_plugin "cpu" do
  action            :create
end

collectd_plugin "interface" do
  action            :create
end

collectd_plugin "load" do
  action            :create
end

collectd_plugin "memory" do
  action            :create
end

collectd_plugin "write_graphite" do
  action            :create
end