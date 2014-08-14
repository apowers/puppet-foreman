# == Class: foreman::defaults
#
# Full description of class foreman is in the README.
#
class foreman::defaults {
  $config_path  = $::osfamily ? {
    'Debian' => '/etc/foreman',
    default  => fail('Unsupported Platform')
  }
  $package_name = $::osfamily ? {
    'Debian' => 'foreman',
    default  => fail('Unsupported Platform')
  }
  $config_file  = $::osfamily ? {
    'Debian' => 'foreman.conf',
    default  => fail('Unsupported Platform')
  }

  $default_options = {
  }

  $service_name = $::osfamily ? {
    'Debian' => 'foreman',
    default  => fail('Unsupported Platform')
  }
  $server_package_name = $::osfamily ? {
    'Debian' => 'foreman',
    default  => fail('Unsupported Platform')
  }
  $server_config_file  = $::osfamily ? {
    'Debian' => 'foreman.conf',
    default  => fail('Unsupported Platform')
  }
  $server_service_name = $::osfamily ? {
    'Debian' => 'foreman',
    default  => fail('Unsupported Platform')
  }

  $default_server_options = {
  }

}
