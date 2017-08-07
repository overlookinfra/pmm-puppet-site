class profile::apache::conflict {
  package { 'apache2':
    ensure => absent,
  }
}
