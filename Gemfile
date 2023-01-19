source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.0.0'

gem 'bootsnap', require: false
gem 'graphql', '~> 2.0'
gem 'graphiql-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'pg_party'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'redis' # Redis
gem 'sidekiq' # Background Jobs
gem "http" # for send request the 3rd party
# ActiveRecord Addons
# gem 'attr_json'
# gem 'activerecord-postgres_enum'
gem 'active_model_serializers'
gem 'composite_primary_keys'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '>= 3.9.0'
  gem 'dotenv-rails'
  gem "bullet" # detecting eager loading
  gem "timecop" # time freezing/traveling
end

group :development do
  gem "overcommit" # git hook manager
  gem "rubocop", require: false # code analyzing
  gem "brakeman", require: false # Security
  gem "foreman"
  gem "awesome_print" # excellent debugging tool
  gem "better_errors" # print better errors in development
  gem "lol_dba" # find missing indexes
  gem "derailed" # benchmarking
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
