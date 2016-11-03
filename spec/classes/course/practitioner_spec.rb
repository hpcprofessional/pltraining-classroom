require 'spec_helper'

describe 'classroom::course::practitioner' do

  parameter_matrix = [
    { :offline => true },
    { :time_servers => ["time.apple.com"] }
  ]
  parameter_matrix.each do |params|
    context "applied to master: #{params.to_s}" do
      let(:pre_condition) {
        "service { 'pe-puppetserver':
          ensure => running,
        }"
      }
      let(:node) { 'master.puppetlabs.vm' }
      let(:facts) { {
        :servername => 'master.puppetlabs.vm'
      } }
      let(:params) { params }

      it { should compile }
    end

    context "applied to agent: #{params.to_s}" do
      let(:node) { 'agent.puppetlabs.vm' }
      let(:facts) { {
        :servername => 'master.puppetlabs.vm'
      } }
      let(:params) { params }

      it { should compile }
    end
  end
end
