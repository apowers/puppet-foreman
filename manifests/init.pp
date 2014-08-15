# == Class: foreman
#
# This class installs and configures the foreman client.
# Full description of class foreman is in the README.
#
class foreman (
  $config_ensure    = 'present',
  $config_options   = {},
  $sysconf_options  = {},
  $package_ensure   = 'present',
  $service_ensure   = 'running',
  $service_enable   = true,
  $db_adapter       = 'sqlite',
  $db_owner         = 'foreman',
  $db_name          = 'foreman',
  $db_password      = 'foreman',
  $db_server        = 'localhost',
  $foreman_pkgs     = ['foreman-assets'],
  $service_name     = $foreman::defaults::service_name,
  $package_name     = $foreman::defaults::package_name,
  $config_path      = $foreman::defaults::config_path,
  $sysconf_path     = $foreman::defaults::sysconf_path,
) inherits foreman::defaults {
  anchor { 'foreman::begin':   } ->
  class  { 'foreman::package': } ->
  class  { 'foreman::config':  } ~>
  class  { 'foreman::service': } ->
  anchor { 'foreman::end': }
}
