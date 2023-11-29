# puppet_redirect_and_error_handling.pp

# Update the package list
exec { 'apt-update':
  command => '/usr/bin/apt-get update',
}

# Install nginx
package { 'nginx':
  ensure => 'installed',
  require => Exec['apt-update'],
}

# Ensure nginx is running
service { 'nginx':
  ensure => 'running',
  enable => true,
  require => Package['nginx'],
}

# Create a custom 404 page
file { '/var/www/html/404.html':
  ensure  => file,
  content => 'Ceci n\'est pas une page',
  notify  => Service['nginx'],
}

# Restart nginx without using systemctl
exec { 'nginx-restart':
  command => '/usr/sbin/service nginx restart',
}

# Verify nginx configuration
exec { 'nginx-verify':
  command => '/usr/sbin/nginx -t',
  require => Exec['nginx-restart'],
}

# Reload nginx configuration
exec { 'nginx-reload':
  command => '/usr/sbin/service nginx reload',
  require => Exec['nginx-verify'],
}
