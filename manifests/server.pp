# == Class: foreman::server
#
# This class installs and configures the foreman server.
# Full description of class foreman is in the README.
#
class foreman::server (
  $config_ensure  = 'present',
  $config_options = {},
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $foreman::defaults::server_service_name,
  $package_name   = $foreman::defaults::server_package_name,
  $config_file    = $foreman::defaults::server_config_file,
) inherits foreman::defaults {
  anchor { 'foreman::server::begin':   } ->
  class  { 'foreman::server::package': } ->
  class  { 'foreman::server::config':  } ~>
  class  { 'foreman::server::service': } ->
  anchor { 'foreman::server::end': }
}
