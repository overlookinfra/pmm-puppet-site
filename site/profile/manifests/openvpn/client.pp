class profile::openvpn::client(
  $server,
) {
  openvpn::client { $hostname:
    server =>  $server,
  }
}
