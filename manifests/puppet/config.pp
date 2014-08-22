# Install the report processor
class foreman::puppet::config (
  $ensure         = 'present',
  $puppet_path    = '/etc/puppet',
  $options        = {},
) {
  include  'foreman::defaults'
  $merged_settings = merge($foreman::defaults::default_puppet_options, $options)

  file { "${puppet_path}/foreman.yaml":
    ensure  => $ensure,
    mode    => '0444',
    content => template('foreman/settings.yml.erb'),
  }

}
