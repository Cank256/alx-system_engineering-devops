# 2-puppet_custom_http_response_header.pp

# Install Nginx
class { 'nginx':
  ensure => 'installed',
}

# Define custom HTTP header
$custom_header_name = 'X-Served-By'
$custom_header_value = $facts['hostname']

# Configure Nginx to add custom header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {\n\tlocation / {\n\t\tadd_header ${custom_header_name} \
  ${custom_header_value};\n\t\t# Other Nginx configurations...\n\t}\n}",
  notify  => Service['nginx'],
}

# Restart Nginx for changes to take effect
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => File['/etc/nginx/sites-available/default'],
}
