# DnsLoad

Toolset for testing DNS server loads.

## Installation

Add this line to your application's Gemfile:

    gem 'dns_load'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dns_load

## Usage

    $ dns-load -r 5000 -i 1 -d google.com,yahoo.com, -a 127.0.0.1 -p 53 --pool-size 4
