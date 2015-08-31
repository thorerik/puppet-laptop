# == Class: sky
#
class sky ($version = 'v2.0.391'){
  zypprepo { 'telred-suse':
    name => 'telred-suse',
    enabled => 1,
    autorefresh => 1,
    baseurl => 'http://repos.tel.red/suse',
    path => '/'
  }
  ->
  package { 'sky':
    ensure => installed,
    allow_virtual => false,
  }
  package { 'libopenssl0_9_8':
    ensure => installed,
    allow_virtual => true,
  }
}
