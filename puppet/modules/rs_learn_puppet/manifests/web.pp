class rs_learn_puppet::web {
  class { 'apache':
    docroot => '/var/www/default'
  }
  file { '/var/www/default':
    ensure => directory,
    group  => 'www-data'
    force  => true
    purge  => true
    recurse => true
    source => 'puppet:///modules/rs_learn_puppet/files/www/default'
  }
  apache::vhost { 'vhost.example.com':
    port    => '80',
    docroot => '/var/www/vhost',
  }
}
