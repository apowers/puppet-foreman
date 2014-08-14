# == Class: foreman::server::config
#
# Full description of class foreman is in the README.
#
class foreman::server::config (
  $ensure      = $foreman::server::config_ensure,
  $options     = $foreman::server::config_options,
  $config_path  = $foreman::server::config_path,
  $config_file = $foreman::server::config_file,
) {
  $merged_options = merge($foreman::defaults::default_server_options, $options)
  $assignment_character = ' = '

  file { "${config_path}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('foreman/config.erb')
  }
}

