require 'rubygems'
require 'dns_load'
require 'trollop'

opts = Trollop::options do
  version DnsLoad::VERSION_COPYRIGHT
  banner <<-EOS
DNS Load #{DnsLoad::VERSION_COPYRIGHT}

Usage:
  dns_load [options]

options:
EOS
  opt :domains, "One or more domains to query for", short: '-d', type: String
  opt :num_requests, "The number of requests to perform per iteration", default: 5000, short: '-r', type: Integer
  opt :num_iterations, "The number of iterations to perform", default: 1, short: '-i', type: Integer
  opt :pool_size, "The size of the execution pool", default: 2, short: '-p', type: Integer
end


Trollop::die( :domains, "is required" ) unless opts[:domains]

$stdout.puts "No. of Requests: #{opts[:num_requests]}",
             "No. of Iterations: #{opts[:num_iterations]}",
             "Pool Size: #{opts[:pool_size]}"

pool = DnsLoad::Dig.pool( size: opts[:pool_size] )

future = nil

opts[:num_iterations].times do
  future = pool.future.execute( opts[:num_requests], opts[:domains].split( ',' ))
end

future.value
