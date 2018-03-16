source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'solidus_auth_devise', github: 'solidusio/solidus_auth_devise'

if branch == 'master' || branch >= 'v2.3'
  gem 'rails', '~> 5.1.0'
  gem 'rails-controller-testing', group: :test
elsif branch >= 'v2.0'
  gem 'rails', '~> 5.0.0'
  gem 'rails-controller-testing', group: :test
else
  gem 'rails', '~> 4.2.0'
  gem 'rails_test_params_backport', group: :test
end

gem 'mysql2'
gem 'pg', '~> 0.21'
gem 'sqlite3'

group :development, :test do
  gem 'i18n-tasks', '~> 0.9' if branch == 'master'
  gem 'byebug'
  gem 'pry-rails'
end

gemspec
