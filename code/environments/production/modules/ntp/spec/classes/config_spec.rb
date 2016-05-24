require 'spec_helper'
describe 'ntp::config' do

  context 'for a Linux distribution' do
    let(:facts) {{ :kernel => 'linux' }}
    it do
      should contain_file('/etc/ntp.conf').with({
        'ensure'  => 'file',
        'mode'    => '0644',
        'owner'   => 'root',
        'group'   => 'root',
        'content' => /server 0.pool.ntp.org iburst\nserver 1.pool.ntp.org iburst\nserver 2.pool.ntp.org iburst/,
        'notify'  => 'Service[ntp]',
        })
    end
  end

  context 'for a Windows distribution' do
    let(:facts) {{ :kernel => 'windows' }}
    it do
      should contain_file('c:\\ntp\\etc\\ntp.conf').with({
        'ensure'  => 'file',
        'content' => /server 0.pool.ntp.org iburst\nserver 1.pool.ntp.org iburst\nserver 2.pool.ntp.org iburst/,
        'notify'  => 'Service[ntp]',
        })
    end
  end
end
