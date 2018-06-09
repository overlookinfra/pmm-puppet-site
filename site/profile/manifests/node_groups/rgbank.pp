class profile::node_groups::rgbank {
  node_group { 'Load Balancers':
    ensure      => 'present',
    classes     => { 'role::loadbalancer' => {} },
    environment => 'production',
    rule        => ['or', ['=', ['trusted', 'extensions', 'pp_role'], 'loadbalancer'], ['=', ['trusted','certname'], 'rgbank-dev.pdx.puppet.vm']],
    parent      => 'All Nodes',
  }

  node_group { 'RG Bank Web Servers':
    ensure      => 'present',
    classes     => { 'role::rgbank::web' => {} },
    environment => 'production',
    rule        => ['and', ['=', ['trusted', 'extensions', 'pp_role'], 'rgbank-web']],
    parent      => 'All Nodes',
  }

  node_group { 'Database Servers':
    ensure      => 'present',
    classes     => { 'role::databaseserver' => {} },
    environment => 'production',
    rule        => ['or', ['=', ['trusted', 'extensions', 'pp_role'], 'database'], ['=', ['trusted','certname'], 'rgbank-dev.pdx.puppet.vm']],
    parent      => 'All Nodes',
  }
}
