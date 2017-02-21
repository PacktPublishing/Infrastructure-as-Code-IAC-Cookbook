node 'web.pomes.pro' {

  class { 'baseconfig':
    agentmode => 'cron';
  }

  # Ensure git is installed
  package { 'git':
    ensure  => installed,
  }

  # Install Apache and PHP
  class {
    'apache':;
    'php':;
  }

  # Define the vhost for wordpress
  apache::vhost { 'web.pomes.pro':
    website => 'web.pomes.pro',
    docroot => '/var/www/wordpress',
  }

  # Install Mysql
  class { 'mysql::server':
    root_password => 'super_secure_password',
  }

  # Create the DB for wordpress
  mysql::db {'wordpress':
    user     => 'wordpress_user',
    password => 'changeme',
    host     => '%',
    grant    => 'ALL',
  }

  # Install Wordpress from github
  vcsrepo {'/var/www/wordpress':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/WordPress/WordPress',
    revision => 'master',
  }

  # Give rights to Apache
  file {'/var/www/wordpress':
    ensure  => directory,
    owner   => 'www-data',
    group   => 'www-data',
    recurse => true,
  }

}

node 'puppet.pomes.pro' {
  class { 'baseconfig':
    agentmode => 'cron';
  }
}
