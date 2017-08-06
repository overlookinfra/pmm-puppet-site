class profile::docker::demo {
  docker::image { 'redis': }

  docker::run { 'redis':
    image =>  'redis',
  }
}
