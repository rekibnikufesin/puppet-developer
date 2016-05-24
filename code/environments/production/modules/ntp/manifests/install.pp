# Install class manages installation of ntp package
class ntp::install {

  case $::kernel {
    'Linux': {
      package { 'ntp':
        ensure => installed,
      }
    }
    'Windows': {
      file{ 'c:\\meinberg-ntp.4.2.8.nupkg':
        ensure => file,
        source => 'puppet:///modules/ntp/meinberg-ntp.4.2.8.nupkg',
      }
      package{ 'meinberg-ntp':
        ensure   => latest,
        provider => 'chocolatey',
        source   => 'c:\\meinberg-ntp.4.2.8.nupkg',
        require  => File['c:\\meinberg-ntp.4.2.8.nupkg'],
      }
    }
    default: {
      fail("Sorry, ${::kernel} is unsupported by this ntp module!")
    }
  }
}
