require 'celluloid/autostart'

module DnsLoad
  class Dig

    include Celluloid

    def cmd( domain )
      "dig @127.0.0.1 -p 5300 #{domain}"
    end

    def execute( num_requests, domains )
      cmds = []
      num_requests.times { cmds << cmd( domains.sample ) }
      `#{cmds.join( '; ' )}`
    end

  end
end
