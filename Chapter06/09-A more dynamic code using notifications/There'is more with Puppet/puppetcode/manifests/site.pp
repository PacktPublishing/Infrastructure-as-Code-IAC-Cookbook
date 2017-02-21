node 'web.pomes.pro' {
    $website=$fqdn;
    $docroot="/var/www/$fqdn";

    class {
      'apache':;
      'php':;
      'mariadb':;
    }
    apache::vhost {$website:
       website => $website,
       docroot => $docroot,
    }
    file { $docroot:
      ensure => directory,
      owner   => 'www-data',
      group   => 'www-data',
      mode    => '0755',
    }
    file {"$docroot/index.php":
      ensure => present,
      owner   => 'www-data',
      group   => 'www-data',
      mode    => '0644',
      content => "<?php phpinfo() ?>",
    }
}
