# Puppet manifest to increase user limit for the holberton user

# Increase the open file limit for the holberton user
exec { 'change-os-configuration-for-holberton-user':
  command => 'echo "holberton - nofile 65535" >> /etc/security/limits.conf',
}

# Ensure the changes take effect immediately
exec { 'reload-limits-for-holberton-user':
  command => 'su - holberton -c "ulimit -n unlimited"',
  require => Exec['change-os-configuration-for-holberton-user'],
}
