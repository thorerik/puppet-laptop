# == Class: systemd-user-services
#
class systemd-user-services {
  $folders = [
    "${home}/.config/systemd",
    "${home}/.config/systemd/user"
  ]
  file { $folders:
    ensure => directory,
    mode => '0644',
    owner => $real_id,
    group => 'users'
  }
}
