# == Class: mopidy
#
class mopidy {
  include mopidy::deps

  python::pip { 'mopidy' :
    pkgname   => 'mopidy',
    ensure    => latest,
  }
  ->
  python::pip { 'mopidy-spotify' :
    pkgname   => 'mopidy-spotify',
    ensure    => latest,
  }
  ->
  python::pip { 'Mopidy-Scrobbler' :
    pkgname   => 'Mopidy-Scrobbler',
    ensure    => latest,
  }
}
