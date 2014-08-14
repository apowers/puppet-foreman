# == Class: foreman::server::service
#
# Full description of class foreman is in the README.
#
class foreman::server::service (
  $ensure       = $foreman::server::service_ensure,
  $enable       = $foreman::server::service_enable,
  $service_name = $foreman::server::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
