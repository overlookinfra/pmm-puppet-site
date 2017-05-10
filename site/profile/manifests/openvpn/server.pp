class profile::openvpn::server(
  $country,
  $province,
  $city,
  $organization,
  $email,
  $server,
) {
  openvpn::server { $hostname: 
    country      => $country,
    province     => $province,
    city         => $city,
    organization => $organization,
    email        => $email,
    server       => $server,
  }
}
