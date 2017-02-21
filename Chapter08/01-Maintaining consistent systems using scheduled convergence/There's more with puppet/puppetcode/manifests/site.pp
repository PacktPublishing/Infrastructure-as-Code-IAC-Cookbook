node 'web.pomes.pro' {
  $website=$fqdn;
  $docroot="/var/www/${website}";
  $users=hiera('webusers');

  class { 'baseconfig':
    agentmode => 'cron';
  }

  class {
    'apache':;
    'php':;
  }

  class { 'mysql::server':
    root_password => 'super_secure_password';
  }

  apache::vhost{$website:
    website => $website,
    docroot => $docroot,
  }

  apache::htpasswd{'htpasswd':
    filepath => '/etc/apache2/htpasswd',
    users    => hiera('webusers'),
  }

  apache::htaccess{"${docroot}-htaccess":
    filepath => '/etc/apache2/htpasswd',
    docroot  => $docroot,
  }

  file { $docroot:
    ensure => directory,
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0755',
  }

  file {"${docroot}/index.php":
    ensure  => present,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    content => '<?php phpinfo() ?>',
  }
}

node 'puppet.pomes.pro' {
  class { 'baseconfig':
    agentmode => 'cron';
  }
}
