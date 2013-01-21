source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'jruby-openssl'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
end


gem 'slim'
gem 'jquery-rails'
gem "twitter-bootstrap-rails"

gem "simple_form", ">= 2.0.4"
gem 'rails-backbone'


gem 'factory_girl_rails'
gem 'rspec-rails'

gem 'mongo'
gem 'mongoid'
gem 'activeadmin-mongoid', :git => 'git://github.com/Ostrzy/activeadmin-mongoid.git', :branch => 'filter_support'
gem 'database_cleaner'

gem 'capybara'

gem 'devise'




# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# the javascript engine for execjs gem
platforms :jruby do
  group :assets do
    gem 'therubyrhino'
  end
end
