define apache::htpasswd (
     $filepath,
     $users
) {

  file { "$filepath":
     ensure  => present,
     owner   => 'root',
     group   => 'root',
     mode    => '0644',
     content => template('apache/htpasswd.erb'),
  }
}
