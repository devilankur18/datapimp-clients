# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'datapimp/clients/version'

Gem::Specification.new do |spec|
  spec.name          = "datapimp-clients"
  spec.version       = Datapimp::Clients::Version
  spec.authors       = ["Jonathan Soeder"]
  spec.email         = ["jonathan.soeder@gmail.com"]
  spec.description   = %q{API Client Implementations}
  spec.summary       = %q{Implementations of several APIs I use frequently}
  spec.homepage      = ""
  spec.license       = "MIT"
  
  spec.add_dependency "hashie"
  spec.add_dependency "aws-sdk" 
  spec.add_dependency "pry" 
  spec.add_dependency "pry-nav" 
  spec.add_dependency 'typhoeus'
  spec.add_dependency 'colored'
  spec.add_dependency 'redis'
  spec.add_dependency 'redis-objects'
  spec.add_dependency 'commander'

  spec.add_development_dependency 'guard'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  spec.require_paths = ["lib"]
end
