source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'

# gem 'puma' allows gems to provide multiple plugins
gem 'puma', '~> 3.4.0'

# This gem provides official integration for Ruby on Rails projects with 
# the Sass stylesheet language.
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.1'


# bootstrap-sass is a Sass-powered version of Bootstrap 3, 
# ready to drop right into your Sass powered applications.
gem 'bootstrap-sass', '3.3.6'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.1.1'

# Turbolinks makes following links in your web application faster. 
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.0.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.4.1'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# gems used for active admin
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'devise'


# the gem we used for tagging
gem 'acts-as-taggable-on'

# toastr is a Javascript library for Gnome / Growl type non-blocking 
# notifications, whcih can create a simple core library that can be 
# customized and extended.
gem 'toastr-rails'

# the gems we used for reading and parsing emailsz
gem 'mail' #https://github.com/mikel/mail
gem 'will_paginate', '~> 3.1.0'
           #
           

# Job scheduler for Ruby (at, cron, in and every jobs).
gem 'rufus-scheduler'

group :development, :test do
# Call 'byebug' anywhere in the code to stop execution and get 
# a debugger console
  gem 'byebug', '~> 9.0.0', platform: :mri
#allows Ruby programs to interface with the SQLite3 database engine
  gem 'sqlite3', '~> 1.3.12'
end

# Remotipart is a Ruby on Rails gem enabling AJAX file uploads with 
# jQuery in Rails 3 and Rails 4 remote forms. 
gem 'remotipart', github: 'mshibuya/remotipart'

#this gem provides an easy-to-use interface for managing your data.
gem 'rails_admin', '>= 1.0.0.rc'

group :development do
# Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
#The Listen gem listens to file modifications and notifies you about the changes
  gem 'listen', '~> 3.0.8'
# Spring speeds up development by keeping your application running in the 
# background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.1'
# This gem makes Spring watch the filesystem for changes using Listen 
# rather than by polling the filesystem.
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# gems for testing 
group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

# gems for production
group :production do
  gem 'pg', '0.18.4'
end

# gems for testing
group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions  
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
  gem 'rspec'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
#the gem we used for searching
gem 'ransack' #search gem