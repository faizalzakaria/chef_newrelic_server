require_relative '../spec_helper'

shared_examples :run_the_rest do
  it { expect(chef_run).to install_package('newrelic-sysmond').at_converge_time }
  it { expect(chef_run).to run_execute('set-newrelic-license-key').at_converge_time }
end

describe 'chef_newrelic_server::default' do

  let(:chef_run) { ChefSpec::SoloRunner.new(platform).converge(described_recipe) }

  context 'ubuntu/debian' do
    let(:platform) { { platform: 'ubuntu', version: '14.04' } }

    it { expect(chef_run).to run_execute('configure-new-relic-apt').at_converge_time }
    it { expect(chef_run).to run_execute('get-gpg').at_converge_time }
    it { expect(chef_run).to run_execute('apt-update').at_converge_time }
    include_examples :run_the_rest
  end

  context 'centos/redhat/amazon' do
    let(:platform) { { platform: 'centos', version: '5.10' } }

    it { expect(chef_run).to run_execute('install-newrelic-sysmond').at_converge_time }
    include_examples :run_the_rest
  end

end
