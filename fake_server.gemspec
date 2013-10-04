# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_server/version'

Gem::Specification.new do |spec|
  spec.name          = "fake_server"
  spec.version       = FakeServer::VERSION
  spec.authors       = ["Mark Evans"]
  spec.email         = ["mark@new-bamboo.co.uk"]
  spec.description   = %q{Proxy server that records requests}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "puma"
  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "vcr"
  spec.add_runtime_dependency "webmock"
end
