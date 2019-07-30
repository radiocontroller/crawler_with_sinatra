source "https://gems.ruby-china.com"

gem 'sinatra'
gem 'json'
gem 'redis'
gem 'mechanize'
gem 'activesupport'
gem 'rake'
gem 'will_paginate', '~> 3.1.0'
gem 'newrelic_rpm'
gem 'puma'
gem 'whenever'

group :production do
  gem 'capistrano', '~> 3.5.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-rails-console'
  gem 'rbnacl'
  gem 'bcrypt_pbkdf'
end

group :development do
    # 修改route不必重启server, rerun 'ruby app.rb'
    gem 'rerun', '~> 0.8.2'
    gem 'byebug'
    gem 'thin'

    gem 'capistrano-rails'
    gem 'capistrano3-puma'
    gem 'capistrano-rvm'
end
