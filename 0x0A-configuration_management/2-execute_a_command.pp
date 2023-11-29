# File: killmenow_manifest.pp

exec { 'kill_killmenow':
  command     => 'pkill killmenow',
  refreshonly => true,
}
