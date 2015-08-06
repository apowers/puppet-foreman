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
  $service_name = $::osfamily ? {
    'Debian' => 'foreman',
    'RedHat' => 'foreman',
    default  => fail('Unsupported Platform for package_names')
  }

  $web_service_groupname = $::osfamily ? {
    'Debian' => 'www-data',
    'RedHat' => 'apache',
    default  => fail('Unsupported Platform for package_names')
  }

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

  $proxy_config_path  = $::osfamily ? {
    'Debian' => '/etc/foreman-proxy',
    'RedHat' => '/etc/foreman-proxy',
    default  => fail('Unsupported Platform for config_path')
  }
  $proxy_sysconf_path = $::osfamily ? {
    'Debian' => '/etc/default/foreman-proxy',
    'RedHat' => '/etc/sysconfig/foreman-proxy',
    default  => fail('Unsupported Platform for sysconf_path')
  }
  $proxy_package_name = $::osfamily ? {
    'Debian' => 'foreman-proxy',
    'RedHat' => 'foreman-proxy',
    default  => fail('Unsupported Platform for package_names')
  }
  $proxy_service_name = $::osfamily ? {
    'Debian' => 'foreman-proxy',
    'RedHat' => 'foreman-proxy',
    default  => fail('Unsupported Platform for package_names')
  }
  $proxy_service_owner = $::osfamily ? {
    'Debian' => 'foreman-proxy',
    'RedHat' => 'foreman-proxy',
    default  => fail('Unsupported Platform for package_names')
  }

  $default_proxy_sysconf_options = {
    'FOREMAN_PROXY_HOME'     => '/usr/share/foreman-proxy',
    'FOREMAN_PROXY_USER'     => 'foreman-proxy',
    'FOREMAN_PROXY_SETTINGS' => '/etc/foreman-proxy/settings.yml',
  }
  $default_proxy_settings = {
    'settings_directory' => '/etc/foreman-proxy/settings.d',
    'foreman_url'        => 'http://127.0.0.1:3000',
    'daemon'             => 'true',
    'daemon_pid'         => '/var/run/foreman-proxy/foreman-proxy.pid',
    'http_port'          => '8443',
    'virsh_network'      => 'default',
    'log_file'           => '/var/log/foreman-proxy/proxy.log',
    'log_level'          => 'ERROR',
  }
  $disabled_proxy_options = {
    'enabled' => 'false'
  }

}
