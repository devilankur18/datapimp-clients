# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "datapimp-clients"
  spec.version       = "0.0.1" 
  spec.authors       = ["Jonathan Soeder"]
  spec.email         = ["jonathan.soeder@gmail.com"]
  spec.description   = %q{API Client Implementations}
  spec.summary       = %q{Implementations of several APIs I use frequently}
  spec.homepage      = ""
  spec.license       = "MIT"
  
  spec.add_dependency 'datapimp'
  spec.add_dependency "aws-sdk" 
  spec.add_dependency "urbanairship"
  spec.add_dependency "redis"
  spec.add_dependency "redis-objects"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  spec.require_paths = ["lib"]
end
