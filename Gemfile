source 'https://rubygems.org'

def darwin_only(gem)
  RUBY_PLATFORM.include?('darwin') && gem
end

def linux_only(gem)
  RUBY_PLATFORM.include?('linux') && gem
end

gem 'rails', '4.0.2'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'devise', '~> 3.2.0'
gem 'compass-rails', '~> 2.0.alpha.0'
gem 'haml-rails'
gem 'pygments.rb'
gem 'redcarpet'
gem 'decent_exposure'
gem 'rails-observers'
gem 'actionpack-page_caching'
gem 'settingslogic'
gem 'bootstrap-sass', '3.0.3.0'
gem 'pg'
gem 'capistrano'

group :development do
  gem 'capistrano'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test, :development do
  gem 'launchy'
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'ffaker'
  gem 'guard-rspec'
  gem 'rb-fsevent', require: darwin_only('rb-fsevent')
  gem 'growl', require: darwin_only('growl')
  gem 'rb-inotify', require: linux_only('rb-inotify')
  gem 'poltergeist'
end

group :test do
  gem 'nyan-cat-formatter'
end
