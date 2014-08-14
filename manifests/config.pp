# == Class: foreman::config
#
# Full description of class foreman is in the README.
#
class foreman::config (
  $ensure      = $foreman::config_ensure,
  $options     = $foreman::config_options,
  $config_path = $foreman::config_path,
  $config_file = $foreman::config_file,
) {
  $merged_options = merge($foreman::defaults::default_options, $options)
  $assignment_character = ' = '

  file { "${config_path}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('foreman/config.erb')
  }
}

