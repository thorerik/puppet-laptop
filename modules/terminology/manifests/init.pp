class terminology {

  $folders = [
    "${home}/.config",
    "${home}/.config/terminology",
    "${home}/.config/terminology/standard"
  ]

  package { 'terminology':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  file { $folders:
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
