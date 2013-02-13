# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dependor-sinatra/version'

Gem::Specification.new do |gem|
  gem.name          = "dependor-sinatra"
  gem.version       = Dependor::Sinatra::VERSION
  gem.authors       = ["Adam Pohorecki"]
  gem.email         = ["adam@pohorecki.pl"]
  gem.description   = %q{An extension to Sinatra enabling dependency injection}
  gem.summary       = %q{An extension to Sinatra enabling dependency injection}
  gem.homepage      = "https://github.com/psyho/dependor-sinatra"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'dependor'
  gem.add_dependency 'sinatra'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-ctags-bundler'
  gem.add_development_dependency 'growl'
  gem.add_development_dependency 'rb-inotify', '~> 0.8.8'
  gem.add_development_dependency 'relish'
  gem.add_development_dependency 'rack-test'
end
