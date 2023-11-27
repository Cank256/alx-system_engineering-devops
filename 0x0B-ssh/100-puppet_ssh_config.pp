# ssh_config.pp

file { '/etc/ssh/ssh_config':
  ensure => present,
  content => '
    Host school
      HostName 18.207.3.75
      User ubuntu
      IdentityFile ~/.ssh/school
      PreferredAuthentications publickey
      PasswordAuthentication no
  ',
  owner => 'ubuntu',
  group => 'ubuntu',
  mode  => '0600',
}
