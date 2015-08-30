# == Class: plaidchat
#
class plaidchat {
  package { 'plaidchat':
    ensure => present,
    provider => 'npm',
    require => [
      Package['nodejs']
    ]
  }
}
