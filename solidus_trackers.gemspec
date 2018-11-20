# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_trackers/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_trackers'
  s.version     = SolidusTracker::VERSION
  s.summary     = 'Provides analytic trackers for solidus'
  s.description = 'Breaking out trackers from solidus core'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Mike Conlin'
  s.email     = 'mike@stembolt.com'
  s.homepage  = 'https://github.com/swively'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  solidus_version = ['>= 2.0', '< 3']
  s.add_dependency 'solidus', solidus_version
  s.add_dependency 'solidus_support'
  s.add_dependency 'deface'

  s.add_development_dependency 'capybara', '~> 2.18'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.43.0'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'ffaker'
end
