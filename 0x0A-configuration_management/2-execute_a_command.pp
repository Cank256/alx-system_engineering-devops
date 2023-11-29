# File: killmenow_manifest.pp

exec { 'kill_killmenow':
  command     => 'pkill -9 killmenow',
  refreshonly => true,
}
