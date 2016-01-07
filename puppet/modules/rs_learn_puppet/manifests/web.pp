class rs_learn_puppet::web {
  class { 'apache':
    default_vhost => false,
  }
  apache::vhost { 'vhost.example.com':
    port    => '80',
    docroot => '/var/www/vhost',
  }
}
