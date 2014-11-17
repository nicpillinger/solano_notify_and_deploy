# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solano_notify_and_deploy/version'

Gem::Specification.new do |spec|
  spec.name          = "solano_notify_and_deploy"
  spec.version       = SolanoNotifyAndDeploy::VERSION
  spec.authors       = ["Nic Pillinger"]
  spec.email         = ["nic@lsf.io"]
  spec.summary       = 'Notify on solano labs build failure or success and optionally deploy'
  spec.description   = 'Notify on solano labs build failure or success and optionally deploy'
  spec.homepage      = "http://lsf.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"

  spec.add_runtime_dependency 'hipchat'
end
