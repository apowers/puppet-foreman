# == Class: foreman::service
#
# Full description of class foreman is in the README.
#
class foreman::service (
  $ensure       = $foreman::service_ensure,
  $enable       = $foreman::service_enable,
  $service_name = $foreman::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
