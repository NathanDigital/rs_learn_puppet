class rs_learn_puppet::web {
  class { 'apache':
    docroot => '/var/www/default'
  }
  file { '/var/www/default':
    ensure => directory,
    group  => 'www-data',
    force  => true,
    purge  => true,
    recurse => true,
    source => 'puppet:///modules/rs_learn_puppet/www/default'
  }
  apache::vhost { 'vhost.example.com':
    port    => '80',
    docroot => '/var/www/vhost',
  }
  file { '/var/www/ssl':
    ensure => directory,
    group  => 'www-data',
    force  => true,
    purge  => true,
    recurse => true,
    source => 'puppet:///modules/rs_learn_puppet/www/ssl'
  }
  file { '/etc/apache2/ssl':
    ensure => directory,
    force  => true,
    purge  => true,
    recurse => true,
    source => 'puppet:///modules/rs_learn_puppet/ssl'
  }
  apache::vhost { 'ssl.rs_learn_puppet.local':
    subscribe => File['/etc/apache2/ssl'],
    require    => File['/var/www/ssl'],
    port     => '443',
    docroot  => '/var/www/ssl',
    ssl      => true,
    ssl_cert => '/etc/apache2/ssl/rs_learn_puppet.local.crt',
    ssl_key  => '/etc/apache2/ssl/rs_learn_puppet.local.key'
  }  
}
