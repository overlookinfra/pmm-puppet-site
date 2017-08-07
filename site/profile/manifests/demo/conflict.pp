class profile::demo::conflict {
  package { 'apache2':
    ensure => uninstalled,
  }
}
