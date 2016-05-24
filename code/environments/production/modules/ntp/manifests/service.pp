# ntp::service class
class ntp::service inherits ntp {
  $ntp_service = $ntp::ntp_service
  $ntp_package = $ntp::ntp_package
  service {$ntp_service:
    ensure  => running,
    enable  => true,
    require => Package[$ntp_package],
  }
}
