# == Class: virtualbox
#
class virtualbox {
  package { ['virtualbox', 'virtualbox-qt']:
    ensure => installed,
    allow_virtual => true,
  }
}
