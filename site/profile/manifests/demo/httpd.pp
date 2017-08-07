class profile::demo::httpd {
  service { 'apache2':
    ensure => running,
    enable => true,
    require => [ Package['apache2'], File['/var/www/html/hi.html'] ],
  }

  package { 'apache2':
    ensure => installed,
  }
  
  file { '/var/www/html/hi.html':
    ensure  => file,
    content => "<h1>Hello Forrester</h1>",
    mode    => '0644',
    require => Package['apache2'],
  }
} 
