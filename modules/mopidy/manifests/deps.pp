# == Class: mopidy::deps
#
class mopidy::deps {
  package { 'gcc':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  package { 'libffi48-devel':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  package { 'python-devel':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  package { 'python-pip':
    ensure => installed,
    allow_virtual => true,
  }
  ->
  package { 'python3-pip':
    ensure => absent,
  }
  ->
  wget::fetch{ 'https://developer.spotify.com/download/libspotify/libspotify-12.1.51-Linux-x86_64-release.tar.gz':
    destination => '/tmp/libspotify.tar.gz'
  }
  ->
  exec { 'extract libspotify':
    command => '/bin/tar xzf /tmp/libspotify.tar.gz',
    cwd     => '/tmp/',
    creates => '/tmp/libspotify-12.1.51-Linux-x86_64-release/Makefile'
  }
  ->
  exec { 'make install libspotify':
    command => '/usr/bin/make install',
    cwd     => '/tmp/libspotify-12.1.51-Linux-x86_64-release',
    creates => '/usr/local/lib/libspotify.so'
  }
  ->
  exec { 'install-pattern-devel_C_C++':
    command => '/usr/bin/zypper in -t pattern devel_C_C++',
  }
}
