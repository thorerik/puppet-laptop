class curl {
  package { 'curl':
    ensure => installed,
    allow_virtual => true,
  }
}
