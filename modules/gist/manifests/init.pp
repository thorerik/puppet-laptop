# == Class: gist
#
class gist {
  package { 'gist':
    ensure => installed,
    provider => 'gem'
  }
}
