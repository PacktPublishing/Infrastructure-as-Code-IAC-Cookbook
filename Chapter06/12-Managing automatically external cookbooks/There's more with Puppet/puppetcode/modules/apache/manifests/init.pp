class apache {
    package {'apache2':
       ensure => present,
    }

    service {'apache2':
       ensure => running,
       enable => true
    }

    file {'/etc/apache2/sites-enabled/000-default.conf':
       ensure => absent,
       notify => Service['apache2'],
    }
}

