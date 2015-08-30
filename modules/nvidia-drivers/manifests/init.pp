# == Class: nvidia-drivers
#
class nvidia-drivers {
  package { 'nvidia-gfxG04-kmp-desktop':
    ensure => installed,
    allow_virtual => true,
    require => [
      Zypprepo['nVidia Graphics Drivers']
    ]
  }
}
