# == Class: foreman::package
#
# Full description of class foreman is in the README.
#
class foreman::package (
  $ensure       = $foreman::package_ensure,
  $package_name = $foreman::package_name,
  $foreman_pkgs = $foreman::foreman_pkgs,
  $db_adapter   = $foreman::db_adapter,
) {
  $db_package = $db_adapter ? {
    'sqlite'      => 'foreman-sqlite3',
    'mysql'       => 'foreman-mysql2',
    'postgresql'  => 'foreman-postgresql',
    default       => [],
  }
  package { $package_name:
    ensure => $ensure,
  }
  package { $db_package:
    ensure => $ensure,
  }
  ensure_packages($foreman_pkgs)

  # Foreman report processor and fact/enc script.
#  exec { 'install_foreman_report_script':
#    command => '/usr/bin/wget -O /usr/lib/ruby/vendor_ruby/puppet/reports/foreman.rb https://raw.githubusercontent.com/theforeman/puppet-foreman/master/files/foreman-report_v2.rb',
#    creates => '/usr/lib/ruby/vendor_ruby/puppet/reports/foreman.rb',
#  }
#  exec { 'install_foreman_enc_script':
#    command => '/usr/bin/wget -O /etc/puppet/bin/foreman_enc.erb https://raw.githubusercontent.com/theforeman/puppet-foreman/master/files/external_node_v2.rb',
#    creates => '/etc/puppet/bin/foreman_enc.erb',
#  }


}
