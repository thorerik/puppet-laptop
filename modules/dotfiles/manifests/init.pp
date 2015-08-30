# == Class: dotfiles
#
class dotfiles {
  vcsrepo { "${home}/dotfiles":
    ensure => present,
    provider => 'git',
    source => 'https://github.com/thorerik/dotfiles.git',
    user => $real_id,
  }

  exec { 'install-dotfiles':
    command => "${home}/dotfiles/install.sh",
    user => $real_id,
    cwd => "${home}/dotfiles",
    environment => "HOME=${home}",
    creates => "${home}/.tmux.conf",
    require => [
      Vcsrepo["${home}/dotfiles"]
    ]
  }
}
