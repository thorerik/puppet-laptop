# == Class: powerlinefonts
#
class powerlinefonts {
  vcsrepo { "${home}/src/fonts":
    ensure => present,
    provider => 'git',
    source => 'https://github.com/powerline/fonts.git',
    user => $real_id,
    require => [
      File["${home}/src"]
    ]
  }

  exec { 'install-script':
    command => "${home}/src/fonts/install.sh",
    user => $real_id,
    cwd => "${home}/src/fonts",
    environment => "HOME=${home}",
    creates => "${home}/.fonts/ter-powerline-x12b.pcf.gz",
    require => [
      Vcsrepo["${home}/src/fonts"]
    ]
  }
}
