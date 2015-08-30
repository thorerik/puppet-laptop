# == Class: atom
#
class atom {
  wget::fetch { 'https://atom.io/download/rpm':
    destination => '/tmp/atom.rpm'
  }
  ->
  exec { 'install-atom':
    command => '/usr/bin/zypper in -y /tmp/atom.rpm',
    creates => '/usr/bin/atom',
  }
}
