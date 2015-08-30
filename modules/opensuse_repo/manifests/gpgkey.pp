# Define: opensuse_repo::gpgkey
#
# This definition saves and imports public GPG key for RPM. Key can
# be stored on Puppet's fileserver or as inline content. Key can be
# also removed from system.
#
# Parameters:
#   [*path*]     - alternative file location (defaults to name)
#   [*ensure*]   - specifies if key should be present or absent
#   [*content*]  - content
#   [*source*]   - source (e.g.: puppet:///)
#   [*owner*]    - file owner
#   [*group*]    - file group
#   [*mode*]     - file mode
#
# Actions:
#
# Requires:
#   RPM based system
#
# Sample usage:
#   opensuse_repo::gpgkey { '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppet-smoketest1':
#     ensure  => present,
#     content => '-----BEGIN PGP PUBLIC KEY BLOCK-----
#   ...
#   -----END PGP PUBLIC KEY BLOCK-----';
#   }
#
define opensuse_repo::gpgkey (
  $path    = $name,
  $ensure  = present,
  $content = '',
  $source  = '',
  $owner   = 'root',
  $group   = 'root',
  $mode    = '0644'
) {
  if ($content == '') and ($source == '') {
    fail('Missing params: $content or $source must be specified')
  }

  file { $path:
    ensure => $ensure,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

  if $content {
    File[$path] { content => $content }
    $rpmname = "gpg-pubkey-$( \
echo '${content}' | \
gpg --quiet --with-colon --homedir=/root --throw-keyids | \
cut -d: -f5 | cut -c9- | tr '[A-Z]' '[a-z]' | head -1)"
  }

  if $source {
    File[$path] { source => $source }
    $rpmname = "gpg-pubkey-$( \
gpg --quiet --with-colon --homedir=/root --throw-keyids <${path} | \
cut -d: -f5 | cut -c9- | tr '[A-Z]' '[a-z]' | head -1)"
  }

  case $ensure {
    present: {
      exec { "rpm-import-${name}":
        path    => '/bin:/usr/bin:/sbin/:/usr/sbin',
        command => "rpm --import ${path}",
        unless  => "rpm -q ${rpmname}",
        require => File[$path],
      }
    }

    absent: {
      exec { "rpm-delete-${name}":
        path    => '/bin:/usr/bin:/sbin/:/usr/sbin',
        command => "rpm -e ${rpmname}",
        onlyif  => ["test -f ${path}", "rpm -q ${rpmname}"],
        before  => File[$path],
      }
    }

    default: {
      fail("Invalid ensure state: ${ensure}")
    }
  }
}
