source 'https://rubygems.org'

ruby '3.1.7'
gem 'rails', '5.2.8'
gem 'ffi', '1.14.2'

gem 'sassc-rails', '~> 2.1'
gem 'uglifier', '>= 4.2.0'

gem 'jquery-rails'
gem 'bigdecimal', '1.3.5'
gem 'web-console', '~> 2.0'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-byebug'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'
end

group :production do
  gem 'pg', '~> 0.2'
  gem 'rails_12factor'
end

gem 'faraday', '1.8.0'  # in main group; simplifies calling TMDb
group :test do
  gem "webmock", '2.3.2'
  gem 'rails-controller-testing'
  gem 'guard-rspec'                 # automates re-running tests
end

