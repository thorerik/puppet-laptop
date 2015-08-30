# == Class: mutt
#
class mutt {
  package { 'mutt':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  file { "${home}/.mutt":
    ensure => present,
    source => "puppet:///modules/${module_name}/.mutt",
    recurse => true,
    owner => $real_id,
    group => 'users',
  }
  ->
  file { "${home}/Mail":
    ensure => directory,
    mode => '0600',
    owner => $real_id,
    group => 'users',
  }
}
