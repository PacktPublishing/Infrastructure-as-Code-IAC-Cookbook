class mysite (
   $website,
   $docroot
){
    class {
      'apache':;
      'php':;
      'mariadb':;
    }
    apache::vhost {$fqdn:
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
