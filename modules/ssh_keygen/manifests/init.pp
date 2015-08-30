class ssh_keygen {

  file { "${home}/.ssh":
    ensure => "directory",
    owner  => $real_id,
    group  => 'users',
    mode   => 750
  }
  ->
  exec { "generate ssh key":
    command => "ssh-keygen -t rsa -b 4096 -N '' -f ${home}/.ssh/id_rsa",
    path => "/usr/bin",
    creates => "${home}/.ssh/id_rsa",
    user => $real_id
  }
  ->
  file { ["${home}/.ssh/id_rsa", "${home}/.ssh/id_rsa.pub"]:
    ensure => "file",
    owner  => $real_id,
    group  => 'users',
    mode   => 600
  }
}
