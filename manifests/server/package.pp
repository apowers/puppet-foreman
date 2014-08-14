# == Class: foreman::server::package
#
# Full description of class foreman is in the README.
#
class foreman::server::package (
  $ensure       = $foreman::server::package_ensure,
  $package_name = $foreman::server::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
