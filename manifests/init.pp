# == Class: foreman
#
# This class installs and configures the foreman client.
# Full description of class foreman is in the README.
#
class foreman (
  $config_ensure  = 'present',
  $config_options = {},
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $foreman::defaults::service_name,
  $package_name   = $foreman::defaults::package_name,
  $config_path    = $foreman::defaults::config_path,
  $config_file    = $foreman::defaults::config_file,
) inherits foreman::defaults {
  anchor { 'foreman::begin':   } ->
  class  { 'foreman::package': } ->
  class  { 'foreman::config':  } ~>
  class  { 'foreman::service': } ->
  anchor { 'foreman::end': }
}
