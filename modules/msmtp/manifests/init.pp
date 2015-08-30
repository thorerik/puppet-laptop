# == Class: msmtp
#
class msmtp {
  package { 'msmtp':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  file { "${home}/.msmtprc":
    ensure => present,
    source => "puppet:///modules/${module_name}/.msmtprc",
    mode => '0600',
    owner => $real_id,
    group => 'users'
  }
}
