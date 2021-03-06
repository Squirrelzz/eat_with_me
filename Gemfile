source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.0'
gem 'thin'
gem 'pg'
gem 'zurb-foundation', '~> 4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'devise',              github: 'plataformatec/devise'
gem 'formtastic',          github: 'justinfrench/formtastic'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack',             github: 'ernie/ransack'
gem 'responders',          github: 'plataformatec/responders'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

group :production do
  gem 'rails_12factor'
end

# Use debugger
# gem 'debugger', group: [:development, :test]
group :development do
  gem "rails-dev-boost", git: "git://github.com/thedarkone/rails-dev-boost.git"
  gem "pry-debugger"
  gem "rails-dev-boost", git: "git://github.com/thedarkone/rails-dev-boost.git"
  gem "better_errors", git: "https://github.com/charliesome/better_errors.git"
  gem "binding_of_caller"
  gem "pry-rails"
  gem "pry-coolline"
  gem "pry-stack_explorer", git: "https://github.com/pry/pry-stack_explorer.git"

  # Guard and friends
  gem "guard"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-spork"
  gem "rb-fchange", require: false
  gem "rb-fsevent", require: false
  gem "rb-inotify", require: false
  gem "ruby_gntp"
  gem "terminal-notifier-guard"

  gem "thin"
  gem 'yajl-ruby'
  gem 'rspec-rails'
end
