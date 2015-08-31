class puppet-vim {
  package { 'puppet-vim':
    ensure => installed,
    allow_virtual => true,
    require => [
      Package['vim']
    ]
  }
}
