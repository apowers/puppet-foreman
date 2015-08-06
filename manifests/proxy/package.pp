# == Class: foreman::package
#
# Full description of class foreman is in the README.
#
class foreman::proxy::package (
  $ensure       = $foreman::proxy::package_ensure,
  $package_name = $foreman::proxy::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
