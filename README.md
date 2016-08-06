# Caturday
A sample legacy Rails app to practice refactoring.

# License

GNU GENERAL PUBLIC LICENSE V3 https://www.gnu.org/licenses/gpl.html

# Configuration

Add a config file in config/app_environment_variables.rb with a link to your own Google Cloud Storage bucket

    ENV['GOOGLE_KEY'] = "xxxxxxxxxxx"
    ENV['GOOGLE_SECRET'] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    ENV['CATURDAY_GOOGLE_BUCKET'] = "xxxx"

# Database creation

To initialize the db with test data run db:seed

# Tests 

Run bundle exec rspec spec/
