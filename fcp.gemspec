$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require './lib/fcp_modules/version'

Gem::Specification.new do |s|
  s.name        =  'fcp_completed'
  s.version     =  FCPVersion::VERSION
  s.date        =  FCPVersion::DATE
  s.executables << 'fcp_completed'
  s.summary     =  'Get completed course names and dates on freeCodeCamp'
  s.description =  'Get completed course names and dates on freeCodeCamp'
  s.authors     =  %w(stozuka)
  s.email       =  %w(stozuka@gmail.com)
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/stozuka/freeCodeCamp-scraper'
  s.license     =  'MIT'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_runtime_dependency 'nokogiri'
end
