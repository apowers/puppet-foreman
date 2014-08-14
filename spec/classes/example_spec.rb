require 'spec_helper'

describe 'foreman' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "foreman class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('foreman::params') }
        it { should contain_class('foreman::install').that_comes_before('foreman::config') }
        it { should contain_class('foreman::config') }
        it { should contain_class('foreman::service').that_subscribes_to('foreman::config') }

        it { should contain_service('foreman') }
        it { should contain_package('foreman').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'foreman class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('foreman') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
