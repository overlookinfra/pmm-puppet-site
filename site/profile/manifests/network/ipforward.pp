class profile::network::ipforward {
  sysctl { 'net.ipv4.ip_forward':
    value =>  1,
  }
}
