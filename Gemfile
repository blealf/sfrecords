source 'https://rubygems.org'
# Gemfile
# source "https://rails-assets.org"
# gem 'rails-assets-bootstrap', ">= 4.0.0.alpha.2" 

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'seed_dump'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5.0'
gem 'sass-rails', '~> 5.0.1'
gem 'bootstrap-sass', '= 3.3.4.1' # I downgraded to this version
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Bootstrap
# gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'
gem 'popper_js', '~> 1.9.9'

# gem 'bootstrap-sass'
gem 'rails_bootstrap_navbar'
gem 'bcrypt', '3.1.11'
# gem 'bcrypt-ruby', '~> 3.0.0'
# gem 'data-confirm-modal', github: 'ifad/data-confirm-modal', branch: 'bootstrap2'
gem 'data-confirm-modal'
# Charts
gem "chartkick"
gem 'groupdate'

gem 'bootstrap_form'
gem 'bootstrap-datepicker-rails'
gem 'will_paginate-bootstrap'

#money
gem 'concurrency'


gem 'rails_12factor', group: :production
gem 'ckeditor', github: 'galetahub/ckeditor'
gem "paperclip", "~> 5.0.0"
gem 'cancancan', '~> 2.0'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
