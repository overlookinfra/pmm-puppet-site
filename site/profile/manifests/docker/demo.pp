class profile::docker::demo {
  docker::image { 'redis': }

  docker::run { 'helloworld':
    image =>  'redis',
  }
}
