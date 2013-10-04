# FakeServer
FakeServer proxies web requests to another host but records GET requests and plays them back, which is useful for running tests which make external requests without actually hitting the server after the first time.

    $ gem install "fake_server"

    $ fake_server start 'http://some.other.place.com'

It defaults to running on port 5555, and records GET requests in the directory `cassettes`.

For all options, use

    $ fake_server help start
