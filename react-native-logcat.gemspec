# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'react-native-logcat/version'

Gem::Specification.new do |spec|
  spec.name          = "react-native-logcat"
  spec.version       = ReactNativeLogCat::VERSION
  spec.authors       = ["cesar ferreira"]
  spec.email         = ["cesar.manuel.ferreira@gmail.com"]

  spec.summary       = %q{Colored logcat for react native}
  spec.description   = %q{Colored logcat for react native}
  spec.homepage      = "https://github.com/cesarferreira/react-native-logcat"
  spec.license       = 'MIT'


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'


  spec.add_development_dependency 'rake', '~> 10.4'
  
  spec.add_dependency 'bundler', '~> 1.7'
  spec.add_dependency 'colorize', '~> 0.7'
end
