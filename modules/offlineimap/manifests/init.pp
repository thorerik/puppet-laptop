# == Class: offlineimap
#
class offlineimap {
  package { 'offlineimap':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  file { "${home}/.offlineimaprc":
    ensure => present,
    source => "puppet:///modules/${module_name}/.offlineimaprc",
    mode => '0600',
    owner => $real_id,
    group => 'users',
  }
  ->
  file { "${home}/.offlineimap.py":
    ensure => present,
    source => "puppet:///modules/${module_name}/.offlineimap.py",
    owner => $real_id,
    group => 'users',
  }
  ->
  file { "${home}/.offlineimap":
    ensure => directory,
    owner => $real_id,
    group => 'users',
  }

}
