#
# Cookbook Name:: chef_newrelic_server
# Recipe:: default
#
# Copyright 2015, Faizal F Zakaria
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

case node["platform"]
when "debian", "ubuntu"
  # Apt
  execute 'configure-new-relic-apt' do
    command "sudo sh -c 'echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list'"
    action :run
  end

  execute 'get-gpg' do
    command "wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -"
    action :run
  end

  execute 'apt-update' do
    command "apt-get update"
    action :run
  end
when "redhat", "centos"
  # Yum, support only 64 bits
  execute 'install-newrelic-sysmond' do
    command "rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm"
    action :run
  end
else
  return
end

package 'newrelic-sysmond'

execute 'set-newrelic-license-key' do
  command "nrsysmond-config --set license_key=#{node[:newrelic_server][:license_key]}"
  action :run
end

execute 'set-newrelic-license-key' do
  command "nrsysmond-config --set license_key=#{node[:newrelic_server][:license_key]}"
end

service 'newrelic-sysmond' do
  action :start
end
