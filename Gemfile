source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Rails API
gem 'rails-api'

# Authentication
gem 'devise'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

# Gems for Everyday Rails Testing with RSpec
group :development, :test do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
  gem 'guard', '~> 2'
  gem 'guard-rspec',require: false
  gem 'spring'
  gem "spring-commands-rspec"
end

group :test do
  gem "faker", "~> 1.1.2"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem "selenium-webdriver", "~> 2.35.1"
  gem "shoulda-matchers"
end

# 모델관계를 깔끔하게 다이어그램으로 그려줍니다. PDF출력 제공
group :development do
  gem "rails-erd"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
