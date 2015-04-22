source 'https://rubygems.org'

gem 'rails', '4.1.9'
gem 'json'

gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bcrypt', '~> 3.1.7'
gem 'mongo_mapper'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'gcm'

#gem 'grape-kaminari'
#gem 'garner'

gem 'bson_ext'

gem 'kaminari'
gem 'faker', '1.3.0' # with faker 1.4.0, I18n::InvalidLocale error is raised.

group :test, :development do
  gem 'pry-rails'
  gem 'timecop'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'factory_girl_rails', require: false # manually load in spec/support/factory_girl.rb. its for spring workaround.
end
