# This Puppet manifest kills a
# process named 'killmenow' using pkill

exec { 'kill_killmenow':
  command => 'pkill -TERM killmenow',
  onlyif  => 'pgrep killmenow',
  timeout => 10, # Adjust the timeout value as needed
  notify  => Exec['check_process_status'],
}

exec { 'check_process_status':
  command => 'pgrep killmenow',
  unless  => 'pgrep killmenow',
}
