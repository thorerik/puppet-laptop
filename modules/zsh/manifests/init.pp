class zsh {
  package { 'zsh':
    ensure => installed,
    allow_virtual => true,
  }
}
