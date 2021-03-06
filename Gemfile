source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use sqlite3 as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'bootstrap-sass', '~> 3.3.6'

#icons for styling
gem 'font-awesome-sass', '~> 4.6.2'

#create testing environment
gem 'rails-controller-testing'

#add to images in models
gem 'carrierwave', '~> 2.0'

#pdf generator page
gem 'prawn'

#scroll effect for page
gem "scrollreveal-rails" 

#jquery helper for rails
gem 'popper_js', '~> 1.14.5'

#pagination 
gem 'will_paginate', '3.1.0'
#pagination with bootstrap
gem 'bootstrap-will_paginate', '0.0.10'
#charts with data from models
gem 'chartkick', '~> 2.2.0'

#generate erd diagrams automatically
gem 'ruby-graphviz'

gem 'railroady', '~> 1.5', '>= 1.5.3'

gem 'rails-erd', :require=>false

#translation gem
gem 'rails-i18n'



# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
 gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'rails-controller-testing'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  
  gem 'mail_form', '~> 1.5', '>= 1.5.1'
  
  
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'redis', '~> 3.3.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
