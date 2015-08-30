# == Class: broadcom-wl
#
class broadcom-wl {
  package { ['broadcom-wl', 'broadcom-wl-kmp-desktop']:
    ensure => installed,
    allow_virtual => true,
    require => [
      Zypprepo['Packman Repository']
    ]
  }
}
