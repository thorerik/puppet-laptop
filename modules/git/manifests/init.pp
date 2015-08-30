class git {
  package { 'git':
    ensure => installed,
    allow_virtual => true,
  }
}
