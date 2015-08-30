node default {

  include repositories
  include zsh
  include vim
  include puppet-vim
  include curl
  include terminology
  include virtualbox
  include offlineimap
  include mutt
  include msmtp
  include node-js
  include plaidchat

  if $hostname == 'thor-opensuse' {
    include dell
  }

  user { 'thor':
    ensure => present,
    shell => '/usr/bin/zsh',
    groups => ['vboxusers'],
    require => [
      Package['virtualbox'],
      Package['zsh']
    ]
  }

  class { 'ohmyzsh': }

  ohmyzsh::install { ['root','thor']: }


}
