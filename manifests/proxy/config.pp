# == Class: foreman::config
#
# Full description of class foreman is in the README.
#
class foreman::proxy::config (
  $ensure           = $foreman::proxy::config_ensure,
  $service_enable   = $foreman::proxy::service_enable,
  $service_owner    = $foreman::proxy::service_owner,
  $config_path      = $foreman::proxy::config_path,
  $config_options   = $foreman::proxy::config_options,
  $sysconf_path     = $foreman::proxy::sysconf_path,
  $sysconf_options  = $foreman::proxy::sysconf_options,
  $bmc_proxy_options       = $foreman::proxy::bmc_proxy_options,
  $dhcp_proxy_options      = $foreman::proxy::dhcp_proxy_options,
  $dns_proxy_options       = $foreman::proxy::dns_proxy_options,
  $facts_proxy_options     = $foreman::proxy::facts_proxy_options,
  $puppetca_proxy_options  = $foreman::proxy::puppetca_proxy_options,
  $puppet_proxy_options    = $foreman::proxy::puppet_proxy_options,
  $realm_proxy_options     = $foreman::proxy::realm_proxy_options,
  $templates_proxy_options = $foreman::proxy::templates_proxy_options,
  $tftp_proxy_options      = $foreman::proxy::tftp_proxy_options,
) {
  $merged_options = merge($foreman::defaults::default_proxy_sysconf_options, $sysconf_options)
  $merged_settings = merge($foreman::defaults::default_proxy_settings, $config_options)

  $groupname = $foreman::defaults::web_service_groupname

  file { $sysconf_path:
    ensure  => $ensure,
    owner   => $service_owner,
    mode    => '0444',
    content => template('foreman/config.erb'),
  }
  file { $config_path:
    ensure  => directory,
    owner   => $service_owner,
    mode    => '0555',
  } ->
  file { "$config_path/settings.yml":
    ensure  => $ensure,
    owner   => $service_owner,
    mode    => '0440',
    content => template('foreman/settings.yml.erb'),
  }

  Foreman::Yamlconf {
    ensure  => $ensure,
    owner   => $service_owner,
    mode    => '0440',
    require => File[$config_path],
    notify  => Class['foreman::proxy::service'],
  }

  foreman::yamlconf { "$config_path/settings.d/bmc.yml":
    options => $bmc_proxy_options,
  }
  foreman::yamlconf { "$config_path/settings.d/dhcp.yml":
    options => $dhcp_proxy_options,
  }
  foreman::yamlconf { "$config_path/settings.d/dns.yml":
    options => $dns_proxy_options,
  }
  foreman::yamlconf { "$config_path/settings.d/facts.yml":
    options => $facts_proxy_options,
  }
  foreman::yamlconf { "$config_path/settings.d/puppet.yml":
    options => $puppet_proxy_options,
  }
  foreman::yamlconf { "$config_path/settings.d/puppetca.yml":
    options => $puppetca_proxy_options,
  }
  foreman::yamlconf { "$config_path/settings.d/realm.yml":
    options => $realm_proxy_options,
  }
  foreman::yamlconf { "$config_path/settings.d/templates.yml":
    options => $templates_proxy_options,
  }
  foreman::yamlconf { "$config_path/settings.d/tftp.yml":
    options => $tftp_proxy_options,
  }

}

