class role::vpn_server {
  include profile::epel
  include profile::network::ipforward
  include profile::openvpn::server
}
