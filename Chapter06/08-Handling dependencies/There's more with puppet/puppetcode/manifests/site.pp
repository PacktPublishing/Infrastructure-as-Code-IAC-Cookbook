node 'web.pomes.pro' {
    class {
      'mysite':
         website  => $fqdn,
         docroot  => "/var/www/$fqdn",
    }
}
