# PHP class
class php {
  package {['php','php-mysql','libapache2-mod-php']:
    ensure => present,
  }
}
