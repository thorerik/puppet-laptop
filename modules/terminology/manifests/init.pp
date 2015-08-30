class terminology {


  package { 'terminology':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  file { "${home}/.config":
    ensure => directory,
    owner => $real_id,
    group => 'users',
  }
  ->
  file { "${home}/.config/terminology":
    ensure => directory,
    owner => $real_id,
    group => 'users',
  }
  ->
  file { "${home}/.config/terminology/standard":
    ensure => directory,
    owner => $real_id,
    group => 'users',
  }
  ->
  file { "${home}/.config/terminology/standard/base.cfg":
    ensure => present,
    source => "puppet:///modules/${module_name}/base.cfg",
    owner => $real_id,
    group => 'users',
  }
}
