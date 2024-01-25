# Puppet manifest to fix the web server configuration for better performance

# Fix for Nginx to handle more concurrent connections
exec { 'fix--for-nginx':
  command => 'sed -i "s/worker_processes 1;/worker_processes auto;/g" /etc/nginx/nginx.conf',
  notify  => Service['nginx'],
}

# Restart Nginx after fixing the configuration
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Exec['fix--for-nginx'],
}
