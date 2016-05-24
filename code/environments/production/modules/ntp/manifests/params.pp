# Class for ntp parameters
class ntp::params{
  $servers = [
  '0.pool.ntp.org',
  '1.pool.ntp.org',
  '2.pool.ntp.org',
  ]
  if($::kernel == 'linux'){
    $config_file = '/etc/ntp.conf'
    $ntp_package = 'ntp'
  }
  if($::kernel == 'windows'){
    $config_file = 'c:\\ntp\\etc\\ntp.conf'
    $ntp_package = 'meinberg-ntp'
  }
  case $::operatingsystem {
    'CentOS': {
      $ntp_service = 'ntpd'
    }
    default: {
      $ntp_service = 'ntp'
    }
  }
}
