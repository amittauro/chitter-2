# Chitter

This is a small twitter clone. I completed this in approx. 4 to 5 hours. The focus is on functionality and TDD

## Run the app

```
$ bundle install
$ rake db:create
$ APP_ENV=test rake db:migrate
$ rake db:migrate
$ bundle exec rspec
$ bundle exec rackup
http://localhost:9292/
```
## Technologies

* BCrypt for password encryption
* Sinatra for running the app
* RSpec for testing
* Sinatra/active-records for CRUD
* PSQL for the database
* PG for connecting to the database
* DatabaseCleaner for truncating the database during testing
* Sinatra/flash for flash messages when running the app

## Further steps

If I had more time I would have liked to:

* Style the app
* Tag Chitter posts via their user
* Potentially more refactoring but I dont think theres much I can take out of the controller.
* Creating controller files for the routes.

## Troubleshooting

You will need to have postgresql installed to run the database. If not you can change the database in the config/database.yml file by changing the adapter to your choice.
