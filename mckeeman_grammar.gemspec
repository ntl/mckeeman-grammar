# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'mckeeman_grammar'
  s.version = ENV.fetch('VERSION', '0')

  s.authors = ['Nathan Ladd']
  s.email = 'nathanladd+github@gmail.com'
  s.homepage = 'https://github.com/ntl/mckeeman-grammar'
  s.licenses = %w(Proprietary)
  s.summary = "Lexical scanning of any grammar specified in McKeeman form"
  s.platform = Gem::Platform::RUBY

  s.require_paths = %w(lib)
  s.files = Dir.glob 'lib/**/*'

  s.add_runtime_dependency 'evt-initializer'
  s.add_runtime_dependency 'test_bench-random'

  s.add_development_dependency 'test_bench'
end
