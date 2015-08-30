class vim {
  package { 'vim':
    ensure => installed,
    allow_virtual => true,
  }
}
