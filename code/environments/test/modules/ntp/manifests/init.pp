# Class: ntp
class ntp (
  $servers = $ntp::params::servers
  ) inherits ntp::params {
  contain 'ntp::install','ntp::config','ntp::service'

}
