# == Class: php
#
class php {

  $packages = [
    'php5',
    'php5-ctype',
    'php5-curl',
    'php5-devel',
    'php5-dom',
    'php5-ftp',
    'php5-gd',
    'php5-iconv',
    'php5-json',
    'php5-mbstring',
    'php5-mcrypt',
    'php5-openssl',
    'php5-pdo',
    'php5-phar',
    'php5-sqlite',
    'php5-tokenizer',
    'php5-xmlreader',
    'php5-xmlwriter',
    'php5-zlib',
  ]

  package { $packages:
    ensure => installed,
    allow_virtual => true,
  }
}
