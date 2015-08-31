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
}
