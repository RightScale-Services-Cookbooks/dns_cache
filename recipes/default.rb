#
# Cookbook Name:: dns_cache
# Recipe:: default
#
# Copyright 2014, RightScale Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
package node[:dns_cache][:package]

template "#{node[:dns_cache][:conf_dir]}/dnscache.conf" do
  source "dnscache.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables( :ip => node[:cloud][:private_ips][0] )
  action :create
end

template "#{node[:dns_cache][:conf_dir]}/servers/roots" do
  source "roots.erb"
  owner "root"
  group "root"
  mode "0644"
  variables( :roots => node[:dns_cache][:roots] )
  action :create
end

node[:dns_cache][:subnets_allowed].each do |subnet|
  template "#{node[:dns_cache][:conf_dir]}/ip/#{subnet}" do
    source "subnet.erb"
    owner "root"
    group "root"
    mode "0644"
    action :create
  end
end

service "dnscache" do
  action :start
end
