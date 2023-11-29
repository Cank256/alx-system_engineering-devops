# 7-puppet_install_nginx_web_server.pp

# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Ensure Nginx service is running
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

# Template for Nginx default configuration
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  notify  => Service['nginx'],
}

# Create a custom 404 page
file { '/var/www/html/404.html':
  ensure  => file,
  content => 'Ceci n\'est pas une page',
  notify  => Service['nginx'],
}
