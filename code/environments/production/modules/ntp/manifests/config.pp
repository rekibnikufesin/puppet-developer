# Class for ntp configuration
class ntp::config inherits ntp{
  $servers     = $ntp::servers
  $config_file = $ntp::config_file
  $ntp_service = $ntp::ntp_service
  if ($::kernel == 'linux'){
    file {$config_file:
      ensure  => file,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template('ntp/ntp.conf.erb'),
      notify  => Service[$ntp_service],
    }
  }
  if ($::kernel == 'windows'){
    file {$config_file:
      ensure  => file,
      content => template('ntp/ntp.conf.erb'),
      notify  => Service[$ntp_service],
      require => Package['meinberg-ntp'],
    }
  }
}
