# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dns_load/version'

Gem::Specification.new do |spec|
  spec.name          = "dns_load"
  spec.version       = DnsLoad::VERSION
  spec.authors       = ["C. Jason Harrelson"]
  spec.email         = ["jason@lookforwardenterprises.com"]
  spec.description   = %q{Toolset for testing DNS server loads.}
  spec.summary       = %q{Toolset for testing DNS server loads.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ['dns-load'] #spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "celluloid"#, "~> 0"
  #spec.add_dependency "spoon", "~> 0"
  spec.add_dependency "trollop", "~> 2"
  #spec.add_dependency "yell", "~> 1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  #spec.add_development_dependency "ruby-debug"
end
