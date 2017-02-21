# @param filepath Path of the htpasswd database
# @param docroot DocumentRoot where the .htaccess should be generated
# See README
define apache::htaccess (
  $filepath,
  $docroot
) {
  file { "${docroot}/.htaccess":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/htaccess.erb'),
  }
}
