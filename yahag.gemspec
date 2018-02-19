# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yahag/version'

Gem::Specification.new do |gem|
  gem.name          = 'yahag'
  gem.version       = Yahag::VERSION
  gem.authors       = ['Max Riveiro']
  gem.email         = ['kavu13@gmail.com']
  gem.description   = 'Yahag is just a little gem for HockeyApp API endpoints. For now it supports only Team endpoint.'
  gem.summary       = 'Yahag is Yet Another HockeyApp Gem'
  gem.homepage      = "https://github.com/kavu/yahag"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec',     '~> 2.12.0'
  gem.add_development_dependency 'yard',      '~> 0.9.11'
  gem.add_development_dependency 'redcarpet', '~> 2.2.2'

  gem.add_dependency 'httparty', '~> 0.10.0'
end
