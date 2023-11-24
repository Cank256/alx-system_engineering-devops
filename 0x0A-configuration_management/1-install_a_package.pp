# This Puppet manifest installs Flask
# version 2.1.0 using pip3

package { 'python3-pip':
  ensure => 'installed',
}

exec { 'install_flask':
  require => Package['python3-pip'],
  command => 'pip3 install flask==2.1.0',
  path    => ['/usr/bin/'],
  unless  => '/usr/bin/test -f /usr/local/lib/python3.4/dist-packages/flask/app.py'
}
