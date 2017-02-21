define apache::htaccess (
     $filepath,
     $docroot
) {

  file { "$docroot/.htaccess":
     ensure  => present,
     owner   => 'root',
     group   => 'root',
     mode    => '0644',
     content => template('apache/htaccess.erb'),
  }
}
