node default {

  zypprepo { 'nVidia Graphics Drivers':
    name => 'nVidia Graphics Drivers',
    enabled => 1,
    autorefresh => 1,
    baseurl => 'http://download.nvidia.com/opensuse/13.2/',
    path => '/'
  }
  opensuse_repo { 'mozilla':
    enabled => 1,
    autorefresh => 1,
  }
  opensuse_repo { 'Virtualization':
    enabled       => 1,
    autorefresh   => 1,
  }

  include zsh
  include vim
  include puppet-vim
  include curl
  include terminology

  user { 'thor':
    ensure => present,
    shell => '/usr/bin/zsh'
  }

  class { 'ohmyzsh': }

  ohmyzsh::install { ['root','thor']: }


}
