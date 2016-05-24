require 'spec_helper'
describe 'ntp::service' do
  context 'for a Linux distribution' do
    let(:facts) {{ :kernel => 'linux', :operatingsystem => 'foo' }}
    it do
      should contain_service('ntp').with({
        'ensure' => 'running',
        'enable' => 'true',
        })
    end
  end
end
