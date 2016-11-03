# encoding: utf-8

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'baby_jbuilder/version'

Gem::Specification.new do |s|
  s.name          = 'baby_jbuilder'
  s.version       = BabyJbuilder::VERSION
  s.authors       = ['Phil Chen']
  s.email         = ['06fahchen@gmail.com']
  s.homepage      = 'https://github.com//fahchen/baby_jbuilder'
  s.summary       = 'A tiny jbuilder implementation with original Rails render'
  s.description   = s.summary
  s.license       = 'MIT'

  s.files         = `git ls-files lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.add_dependency 'activesupport', '>= 5.0.0'

  s.add_development_dependency 'rake', '> 10.0'
end
