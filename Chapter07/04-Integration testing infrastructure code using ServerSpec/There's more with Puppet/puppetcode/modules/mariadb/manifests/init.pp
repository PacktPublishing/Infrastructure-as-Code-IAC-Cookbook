# MariaDB module
class mariadb {
  package {'mariadb-server':
    ensure => present,
  }

  service {'mysql':
    ensure => running,
    enable => true,
  }
}

