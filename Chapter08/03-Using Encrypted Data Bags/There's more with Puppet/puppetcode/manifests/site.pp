node 'web.pomes.pro' {
  $website=$fqdn;
  $docroot="/var/www/${website}";
  $users=hiera('webusers');
  $pass=hiera('root_password');

  class { 'baseconfig':
    agentmode => 'cron';
  }

  class {
    'apache':;
    'php':;
  }

  class { 'mysql::server':
    root_password => $pass;
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
    content => "<?php phpinfo() ?>",
  }
}

node 'puppet.pomes.pro' {
  class { 'baseconfig':
    agentmode => 'cron';
  }
  # Create a service resource for the puppetserver
  # This is needed by the hiera module, in order
  # to restart the server once hiera-eyaml is installed
  service {'puppetserver':
    ensure => running,
  }
  # Configure hiera
  class { 'hiera':
    hierarchy => [
      'nodes/%{::trusted.certname}',
    ],
    eyaml          => true,
    manage_package => true,
    provider       => 'puppetserver_gem',
    master_service => 'puppetserver',
  }
}
