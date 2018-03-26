source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch

gem 'rails-controller-testing', group: :test
if branch == 'master' || branch >= "v2.3"
  gem 'rails', '~> 5.1.0' # HACK: broken bundler dependency resolution
elsif branch >= "v2.0"
  gem 'rails', '~> 5.0.0' # HACK: broken bundler dependency resolution
end
gem 'pg', '~> 0.21'
gem 'mysql2', '~> 0.4.10'

# Provides basic authentication functionality for testing parts of your engine
gem 'solidus_auth_devise', '~> 1.0'

gemspec
