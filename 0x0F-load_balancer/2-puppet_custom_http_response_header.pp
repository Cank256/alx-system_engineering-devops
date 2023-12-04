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

# Create a custom index page
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  notify  => Service['nginx'],
}

# Create a custom 404 page
file { '/var/www/html/404.html':
  ensure  => file,
  content => 'Ceci n\'est pas une page',
  notify  => Service['nginx'],
}

# Configure Nginx default site
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
        listen 80;
        listen [::]:80;

        server_name cank.tech;

        root /var/www/html;
        index index.html;

        location / {
            try_files \$uri \$uri/ =404;
        }

        location /redirect_me {
            return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }

        error_page 404 /404.html;
        location = /404.html {
            root /var/www/html;
            internal;
            return 404 \"Ceci n'est pas une page\";
        }
    }
    add_header X-Served-By \$HOSTNAME;
  ",
  notify => Service['nginx'],
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
