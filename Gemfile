source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails'
gem 'bootstrap-sass'
gem "bootstrap-x-editable-rails"
gem "bcrypt-ruby", require: "bcrypt"
gem 'faker'
gem 'jquery-rails'
gem 'jquery-ui-rails'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test do
  gem 'capybara'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'guard-spork'
  gem 'spork'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end