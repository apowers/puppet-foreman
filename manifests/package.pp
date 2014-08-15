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
}
