# Apache module

## Table of Contents

1. [Description](#description)
1. [Usage](#usage)
    * [Apache installation](#installation)
    * [Defining a vhost](#vhost)
    * [Defining a htpasswd database](#htpasswd)
    * [Defining a .htaccess file](#htaccess)

## Description

Sample module for Apache on Ubuntu systems

## Usage

### installation

To install apache2:

```
class { 
  'apache':; 
}
```


### vhost

To create a vhost:

```
apache::vhost{'mysite':
  website => 'www.example.com',
  docroot => '/var/www/example',
}
```

### htpasswd

To define a htpasswd file:

```
apache::htpasswd{'htpasswd':
  filepath => '/etc/apache2/htpasswd',
  users    => hiera('webusers'),
}
```

Note: here webusers is an an array of hash stored in Hiera:

```
webusers:
 - id: user1
   htpasswd: *hash*
 - id: user2
   htpasswd: *hash*
```


### htaccess

To define a .htaccess file:

```
apache::htaccess{'htaccess':
  filepath => '/etc/apache2/htpasswd',
  docroot  => '/var/www/example',
}
```
