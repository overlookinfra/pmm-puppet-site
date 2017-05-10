class role::vpn_client {
  include profile::epel
  include profile::openvpn::client
}
