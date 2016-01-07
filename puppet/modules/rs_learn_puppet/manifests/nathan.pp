class rs_learn_puppet::nathan {
  user { 'nathan':
    name      => nathan,
    ensure    => present,
    comment   => 'Nathan Dunn',
    groups    => [sudo, www-data],
    managehome => true,
    shell     => '/bin/bash'
  }
  ssh_authorized_key { 'nathan@nathan.digital':
    require => User['nathan'],
    user => 'nathan',
    type => 'ssh-rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDnabNiB4Vgn14mScVS23oGHLWWlbjU9SkGjJdoVK+NpIdBp+8wmL6pdUt6uqtptK1SCxMiarxo/KPBRrYxuHIfSraZQNB9KnMKKI3TL5Q5AIqs/XXvgnqDYGUL9onhCBOzCRcFptoCHWP27wo/BY5u+cYe6MAiwiRZDOViFHYgSn1QGa6cadbU6YV7Wei2kQbHMBB25YQlphlytOeseOCjYYxRnlt46fBdKhhZmgtvz6bl/vRtXsyjrVoV59+7M7erWrMa3pYUOb1bHo2o9ofB45ylBztewJ3CriIFiSedHQrnKzIzBQ2gpJJo0AEfD2zJn9Wo3Xam8/v5tdb6KX5JcDpWA1EyX7DC1q9cJDVnhw1I9NkrnU8TESVR4PXyDo5gfF4YlNR6+733fWx/E4DKbZ21lfgNifzBQYuvT5UMY1S2vVNUuT0ohSRPddKR7C6xthTaT5oeKi6C4lO6krAlYuQhV0+PyDndiN+WEg4AZ9qj76qc+pVH/BfIFP9ERJtSdLaGuv5rP/yhrhd45TVdoqT7yYKfmCGmQYoMABDovoFsr35mlaDmqNYJHQ+F/cXcjjqBLvMJ48PwON7M2H3gSSRiJ+G1hWgH2OCP4yGr+AqUAMS8eOQml0BVGlUvUn+qsQ5wJbenwclzE4jYDH28q6RtsihzyhScSUENTvqF4w==',

  }
  file { '/etc/sudoers.d/nathan':
    ensure => present,
    content => 'nathan ALL=(ALL) NOPASSWD:ALL'
  }
}
