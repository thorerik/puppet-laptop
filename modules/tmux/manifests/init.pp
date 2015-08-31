# == Class: tmux
#
class tmux {
  package { 'tmux':
    ensure => installed,
    allow_virtual => true,
  }
}
