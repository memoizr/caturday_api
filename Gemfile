source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.9'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'json'

#gem 'spring',        group: :development

gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'bcrypt', '~> 3.1.7'
gem 'mongo_mapper'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'
#gem 'grape-kaminari'
#gem 'garner'

# Authorization
gem 'devise', '~> 3.0.1'
gem 'warden'
gem 'mm-devise'
gem 'bson_ext'


group :test, :development do
  gem 'pry-rails'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails', require: false # manually load in spec/support/factory_girl.rb. its for spring workaround.
  gem 'faker', '1.3.0' # with faker 1.4.0, I18n::InvalidLocale error is raised.
end
