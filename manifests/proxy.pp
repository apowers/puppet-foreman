# == Class: foreman
#
# This class installs and configures the foreman client.
# Full description of class foreman is in the README.
#
class foreman::proxy (
  $config_ensure    = 'present',
  $config_options   = {},
  $sysconf_options  = {},
  $package_ensure   = 'present',
  $service_ensure   = 'running',
  $service_enable   = true,
  $service_name     = $foreman::defaults::proxy_service_name,
  $service_owner    = $foreman::defaults::proxy_service_owner,
  $package_name     = $foreman::defaults::proxy_package_name,
  $config_path      = $foreman::defaults::proxy_config_path,
  $sysconf_path     = $foreman::defaults::proxy_sysconf_path,
  $bmc_proxy_options       = $foreman::defaults::disabled_proxy_options,
  $dhcp_proxy_options      = $foreman::defaults::disabled_proxy_options,
  $dns_proxy_options       = $foreman::defaults::disabled_proxy_options,
  $facts_proxy_options     = $foreman::defaults::disabled_proxy_options,
  $puppetca_proxy_options  = $foreman::defaults::disabled_proxy_options,
  $puppet_proxy_options    = $foreman::defaults::disabled_proxy_options,
  $realm_proxy_options     = $foreman::defaults::disabled_proxy_options,
  $templates_proxy_options = $foreman::defaults::disabled_proxy_options,
  $tftp_proxy_options      = $foreman::defaults::disabled_proxy_options,
) inherits foreman::defaults {
  anchor { 'foreman::proxy::begin':   } ->
  class  { 'foreman::proxy::package': } ->
  class  { 'foreman::proxy::config':  } ~>
  class  { 'foreman::proxy::service': } ->
  anchor { 'foreman::proxy::end': }
}
