# == Class: repositories
#
class repositories {
  if $osfamily == 'Suse' {
    zypprepo { 'nVidia Graphics Drivers':
      name => 'nVidia Graphics Drivers',
      enabled => 1,
      autorefresh => 1,
      baseurl => 'http://download.nvidia.com/opensuse/13.2/',
      path => '/'
    }
    zypprepo { 'Packman Repository':
      name => 'Packman Repository',
      enabled => 1,
      autorefresh => 1,
      baseurl => 'http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_13.2/',
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
  }
}
