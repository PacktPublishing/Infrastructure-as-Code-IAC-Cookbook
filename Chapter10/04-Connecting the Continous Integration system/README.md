# NGINX Docker Container

This demonstration container launches NGINX 1.6.2 on Debian stable (8/Jessie at the moment), with simple rspec tests.

Dependencies:

* Docker and optionally docker-compose
* Ruby (for the tests)

## Running

Using docker-compose:

    $ docker-compose up

This will also build the container if not found.

## Testing

To install the testing environment:

    $ bundle install

To execute the tests:

    $ make test
