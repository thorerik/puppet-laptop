# == Class: skype
#
class skype ($skypeversion = "4.3.0.37") {
  $url = "http://download.skype.com/linux/skype-${skypeversion}-suse.i586.rpm"

  wget::fetch { $url:
    destination => '/tmp/skype.rpm'
  }
  ->
  exec { 'install-skype':
    command => '/usr/bin/zypper in -y /tmp/skype.rpm',
    creates => '/usr/bin/skype',
  }
}
