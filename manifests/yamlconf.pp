#
# Creates a Yaml file from the contents of a hash.
#
define foreman::yamlconf (
  $ensure  = 'file',
  $path    = $name,
  $options = {},
  $owner   = 'root',
  $group   = 'root',
  $mode    = '0400',
) {
  $merged_settings = $options

  file { $path:
    ensure  => $ensure,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template('foreman/settings.yml.erb'),
  }
}

