# == Class: foreman::service
#
# Full description of class foreman is in the README.
#
class foreman::proxy::service (
  $ensure       = $foreman::proxy::service_ensure,
  $enable       = $foreman::proxy::service_enable,
  $service_name = $foreman::proxy::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
