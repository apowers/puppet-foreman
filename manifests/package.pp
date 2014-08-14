# == Class: foreman::package
#
# Full description of class foreman is in the README.
#
class foreman::package (
  $ensure       = $foreman::package_ensure,
  $package_name = $foreman::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
