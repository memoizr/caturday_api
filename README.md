# Caturday

This is the open source project for the Caturday API backend app. 

**Description**

Caturday is an application that lets user see, share and comment
on images of cats. These images are organized in "streams"
by category.

# License

This software is released under:

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
