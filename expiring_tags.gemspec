# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'expiring_tags/version'

Gem::Specification.new do |spec|
  spec.name          = 'expiring_tags'
  spec.version       = ExpiringTags::VERSION
  spec.authors       = ['Wilson Silva']
  spec.email         = ['me@wilsonsilva.net']
  spec.summary       = 'A simple tagging extension for ActiveRecord that allows tags to expire.'
  spec.description   = 'A simple tagging extension for ActiveRecord that allows tags to expire.'
  spec.homepage      = 'https://github.com/QuiqUpLTD/expiring_tags'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_runtime_dependency     'activerecord', '>= 4.1'
  spec.add_development_dependency 'combustion',   '~> 0.5.2'
  spec.add_development_dependency 'rspec-rails',  '~> 3.1.0'
  spec.add_development_dependency 'factory_girl_rails', '~> 4.5'
  spec.add_development_dependency 'pg',      '~> 0.17'
end
