source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.4.0'
# Use SCSS for stylesheets
gem 'rails', '~>5.0.1'
gem 'puma', '~> 3.4.0'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bootstrap-sass', '3.3.6'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.1.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.4.1'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
###### Active Admin ######
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'devise'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.11'

#tagging gem
gem 'acts-as-taggable-on'

# Use Unicorn as the app server
# gem 'unicorn'
#yuyin
gem 'toastr-rails'
#yuyin
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Read and parse emails - see UserMailer.rb
gem 'mail' #https://github.com/mikel/mail

gem 'will_paginate', '~> 3.1.0'
           #
           
#used for scheduler.rb  
gem 'rufus-scheduler'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 9.0.0', platform: :mri
  gem 'sqlite3', '~> 1.3.12'
end
gem 'remotipart', github: 'mshibuya/remotipart'
gem 'rails_admin', '>= 1.0.0.rc'
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.8'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
  #gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  #gem 'database_cleaner'
end

group :production do
  gem 'pg', '0.18.4'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions  
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'ransack' #search gem