# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/json_stringify/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-json_stringify'
  spec.version       = Rack::JsonStringify::VERSION
  spec.authors       = ['Roberto Decurnex']
  spec.email         = ['decurnex.roberto@gmail.com']
  spec.summary       = %q{This Rack middleware takes any JSON response and format all the values (but null) to string whenever the proper header value is set.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = [
    'lib/rack/json_stringify.rb',
    'lib/rack/json_stringify/version.rb',
    'spec/spec_helper.rb',
    'spec/json_stringify_spec.rb',
    'README.md'
  ]
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'rack'

  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
