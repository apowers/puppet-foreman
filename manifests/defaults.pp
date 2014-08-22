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
    'puppet_server'         => 'puppet',
    'unattended'            => false,
    'puppetconfdir'         => '/etc/puppet/puppet.conf',
    'login'                 => false,
    'require_ssl'           => false,
    'locations_enabled'     => false,
    'organizations_enabled' => false,

  }
  $default_sysconf_options = {
    'FOREMAN_HOME'  => '/usr/share/foreman',
    'FOREMAN_IFACE' => '0.0.0.0',
    'FOREMAN_PORT'  => '3000',
    'FOREMAN_USER'  => 'foreman',
    'FOREMAN_ENV'   => 'production',
  }
  $default_puppet_options = {
    'url'         => "https://${::fqdn}",
    'ssl_ca'      => '/var/lib/puppet/ssl/certs/ca.pem',
    'ssl_cert'    => "/var/lib/puppet/ssl/certs/${::fqdn}.pem",
    'ssl_key'     => "/var/lib/puppet/ssl/private_keys/${::fqdn}.pem",
    'puppetdir'   => '/var/lib/puppet',
    'puppetuser'  => 'puppet',
    'facts'       => true,
    'timeout'     => '10',
    'threads'     => 'null',
  }

}
