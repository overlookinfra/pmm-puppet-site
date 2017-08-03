class profile::redis {
  include docker

  docker::image {'redis': }

  docker::run { 'redis':
    image   => 'redis',
    ports   => ["6379:6379"],
  }
}
