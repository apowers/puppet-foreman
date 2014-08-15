# == Class: foreman::defaults
#
# Full description of class foreman is in the README.
#
class foreman::defaults {
  $config_path  = $::osfamily ? {
    'Debian' => '/etc/foreman',
    'RedHat' => '/etc/foreman',
    default  => fail('Unsupported Platform for config_path')
  }
  $sysconf_path = $::osfamily ? {
    'Debian' => '/etc/default',
    'RedHat' => '/etc/sysconfig',
    default  => fail('Unsupported Platform for sysconf_path')
  }
  $package_name = $::osfamily ? {
    'Debian' => 'foreman',
    'RedHat' => 'foreman',
    default  => fail('Unsupported Platform for package_names')
  }
  $service_name = 'foreman'

  $default_settings_options = {
    'puppet_server' => 'puppet',
    'unattended'    => true,
    'puppetconfdir' => '/etc/puppet/puppet.conf',
    'login'         => false,
    'require_ssl'   => false,
  }
  $default_sysconf_options = {
    'START'         => 'yes',
    'FOREMAN_HOME'  => '/usr/share/foreman',
    'FOREMAN_IFACE' => '0.0.0.0',
    'FOREMAN_PORT'  => '3000',
    'FOREMAN_USER'  => 'foreman',
    'FOREMAN_ENV'   => 'production',
  }


}
