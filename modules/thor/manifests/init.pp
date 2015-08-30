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
  include gist
  include php
  include powerlinefonts
  include dotfiles

  class { 'composer':
    command_name => 'composer',
    target_dir   => "${home}/bin",
    auto_update => true,
    user => $real_id
  }

  if $hostname == 'thor-opensuse' {
    include dell
  }

  user { $real_id:
    ensure => present,
    shell => '/usr/bin/zsh',
    groups => ['vboxusers'],
    require => [
      Package['virtualbox'],
      Package['zsh']
    ]
  }
  ->
  file { "${home}/src":
    ensure => directory,
    mode => '0644',
    owner => $real_id,
    group => 'users'
  }

  class { 'ohmyzsh': }

  ohmyzsh::install { ['root', $real_id]: }


}
