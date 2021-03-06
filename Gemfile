source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'dynamic_form'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'carrierwave'
gem 'fog'
gem 'nested_form'
gem 'pg'

# User Authentication
gem 'devise'
gem 'bcrypt-ruby'

# Sign in with Twitter
gem 'omniauth-twitter'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# To deploy to Heroku
group :development do
#  gem 'capistrano'
end

# Manages concurrency - one dyno on Heroku can handle 3.
gem 'unicorn'

# Dev testing
group :test, :development do
  gem 'rspec-rails', '~> 2.11'
  gem 'launchy'
  gem 'pry-debugger' #REPL - read evaluate print loop
  gem 'database_cleaner'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'pry-debugger'
  gem 'factory_girl', '2.6.4'
  gem 'email_spec', '1.2.1'
  gem 'simplecov', :require => false, :group => :test
  gem 'database_cleaner'
  gem 'timecop'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'twitter-bootstrap-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'figaro'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'



