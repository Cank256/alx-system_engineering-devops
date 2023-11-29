# This Puppet manifest kills a
# process named 'killmenow' using pkill

exec { 'kill_killmenow':
  command     => 'pkill killmenow',
  refreshonly => true,
}
