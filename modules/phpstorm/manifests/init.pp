# == Class: phpstorm
#
class phpstorm ($version = '9.0.2') {
  wget::fetch { "https://download.jetbrains.com/webide/PhpStorm-${version}.tar.gz":
    destination => "/tmp/PhpStorm-${version}.tar.gz"
  }
  ->
  exec { 'extract-phpstorm':
    command => "/bin/tar xf PhpStorm-${version}.tar.gz",
    cwd => '/tmp/',
    unless => "/usr/bin/test -f /opt/phpstorm/bin/phpstorm.sh"
  }
  ->
  exec { 'delete-phpstorm-tar':
    command => "/usr/bin/rm /tmp/PhpStorm-${version}.tar.gz",
    unless => "/usr/bin/test -f /opt/phpstorm/bin/phpstorm.sh"
  }
  ->
  exec { 'move-phpstorm-dir':
    command => "/usr/bin/mv -f PhpStorm-* /opt/phpstorm",
    cwd => '/tmp/',
    unless => "/usr/bin/test -f /opt/phpstorm/bin/phpstorm.sh"
  }
}
