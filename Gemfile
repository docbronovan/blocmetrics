source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use sqlite3 as the development database for Active Record and pg as prod
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
group :development do
  gem 'sqlite3'
  gem 'binding_of_caller'
  gem 'better_errors'
  #gem 'thin'
end
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring', '1.3.6'
  gem 'factory_girl_rails', '~> 4.0'
end

gem 'raygun4ruby'

# puma
gem 'puma'
# pagination
gem 'will_paginate', '~> 3.0.5'

# S3 uploader
gem 'fog', '1.24'
# uploading software
gem 'carrierwave'
# manipulating images
gem 'mini_magick'
# reder input in markdowm
gem 'redcarpet'
# authorize different users for different tasks
gem 'pundit'
# store credentials as enviornment variables
gem 'figaro', '1.0'
# devise authentication
gem 'devise'
# User pry
gem 'pry-rails'
# Use bootstrap
gem 'bootstrap-sass'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# generate development data automatically
gem 'faker'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# for nice looking urls
gem'friendly_id'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

