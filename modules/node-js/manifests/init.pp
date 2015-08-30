# == Class: node-js
#
class node-js {
    package { 'nodejs':
      ensure => installed,
      allow_virtual => true,
    }
}
