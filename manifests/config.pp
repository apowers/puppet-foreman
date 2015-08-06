# == Class: foreman::config
#
# Full description of class foreman is in the README.
#
class foreman::config (
  $ensure           = $foreman::config_ensure,
  $service_enable   = $foreman::service_enable,
  $config_path      = $foreman::config_path,
  $config_options   = $foreman::config_options,
  $sysconf_path     = $foreman::sysconf_path,
  $sysconf_options  = $foreman::sysconf_options,
  $db_adapter       = $foreman::db_adapter,
  $db_owner         = $foreman::db_owner,
  $db_name          = $foreman::db_name,
  $db_password      = $foreman::db_password,
  $db_server        = $foreman::db_server,
) {
  $merged_options = merge($foreman::defaults::default_sysconf_options, $sysconf_options)
  $merged_settings = merge($foreman::defaults::default_settings_options, $config_options)

  $groupname = $foreman::defaults::web_service_groupname

  file { "${sysconf_path}/foreman":
    ensure  => $ensure,
    group   => $groupname,
    mode    => '0444',
    content => template('foreman/config.erb'),
  }
  file { "${config_path}/settings.yaml":
    ensure  => $ensure,
    owner   => $db_owner,
    mode    => '0440',
    content => template('foreman/settings.yml.erb'),
  }
  file { "${config_path}/database.yml":
    ensure  => $ensure,
    owner   => $db_owner,
    mode    => '0440',
    content => template('foreman/database.yml.erb'),
  }
}

