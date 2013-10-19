require 'celluloid/autostart'

module DnsLoad
  class Dig

    include Celluloid

    def cmd( domain, address, port )
      "dig @#{address} -p #{port} #{domain}"
    end

    def execute( options )
      cmds = []
      domains = options[:domains].split( ',' )

      options[:num_requests].times do
        cmds << cmd( domains.sample, options[:address], options[:port] )
      end

      `#{cmds.join( '; ' )}`
    end

  end
end
