class rs_learn_puppet::jenkins {
  
  apache::vhost { 'jenkins.example.com':
    port    => '80',
    docroot => '/var/www/jenkins',
    proxy_pass => [ 
      { 'path' => '/', 'url' => 'http://localhost:8080' }
    ]
  }
}
