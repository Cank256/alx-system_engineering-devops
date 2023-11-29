# File: killmenow_manifest.pp

exec { 'kill_killmenow':
  command     => '/usr/bin/pkill -9 killmenow',
  refreshonly => true,
}
