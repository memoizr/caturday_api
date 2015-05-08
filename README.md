# Caturday

This is the open source project for the Caturday API backend app. 

**Description**

Caturday is an application that lets user see, share and comment
on images of cats. These images are organized in "streams"
by category.

# License

GNU GENERAL PUBLIC LICENSE
Version 2, June 1991

Copyright (C) 1989, 1991 Free Software Foundation, Inc., <http://fsf.org/>
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.

# Configuration

Add a config file in config/app_environment_variables.rb with a link to your own Google Cloud Storage bucket

    ENV['GOOGLE_KEY'] = "xxxxxxxxxxx"
    ENV['GOOGLE_SECRET'] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    ENV['CATURDAY_GOOGLE_BUCKET'] = "xxxx"

# Database creation

To initialize the db with test data run db:seed

# Tests 

Run bundle exec rspec spec/
