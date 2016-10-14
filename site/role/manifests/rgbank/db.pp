class role::rgbank::db {
  include profile::common
  include profile::mysql::server

  class { 'profile::rgbank::db':
    dbname   => 'rgbank',
    user     => 'rgbank',
    password => 'rgbankPassw0rd',
  }

  Class['profile::mysql::server'] -> Class['profile::rgbank::db']
}
