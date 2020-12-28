# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hive_sql/version'

Gem::Specification.new do |spec|
  spec.name          = 'hive_sql'
  spec.version       = HiveSQL::VERSION
  spec.authors       = ['Anthony Martin (inertia)']
  spec.email         = ['hive_sql@martin-studio.com']

  spec.summary       = %q{Ruby/Rails wrapper for HiveSQL.io}
  spec.description   = %q{Rails compatible gem that provides full DB connection and models to HiveSQL.io}
  spec.homepage      = 'https://github.com/inertia186/hive_sql'
  spec.license       = 'CC0-1.0'

  spec.files         = Dir.glob("{bin,lib}/**/*") + %w(Rakefile LICENSE README.md)
  spec.bindir        = 'bin'
  spec.executables   = 'hive_sql'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0', '>= 2.0.1'
  spec.add_development_dependency 'rake', '~> 12.1', '>= 12.1.0'
  spec.add_development_dependency 'minitest-proveit', '~> 1.0', '>= 1.0.0'
  spec.add_development_dependency 'minitest', '~> 5.10', '>= 5.10.3'
  spec.add_development_dependency 'minitest-line', '~> 0.6', '>= 0.6.4'
  spec.add_development_dependency 'simplecov', '~> 0.11', '>= 0.11.2'
  spec.add_development_dependency 'yard', '~> 0.9', '>= 0.9.16'
  spec.add_development_dependency 'rb-readline', '~> 0.5', '>= 0.5.5'
  spec.add_development_dependency 'irb', '~> 1.0', '>= 1.0.0'

  spec.add_runtime_dependency 'nokogiri', ['~> 1.8']
  spec.add_runtime_dependency 'rest-client', ['~> 2.0']
  spec.add_runtime_dependency 'activerecord', ['>= 4']
  spec.add_runtime_dependency 'tiny_tds', ['~> 2.1']
  spec.add_runtime_dependency 'activerecord-sqlserver-adapter', ['>= 4']
  spec.add_runtime_dependency 'activesupport', ['>= 4']
  spec.add_runtime_dependency 'awesome_print', '~> 1.7', '>= 1.7.0'
end
