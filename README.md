# Book management system
## What does this do?
It is test task of books management system backend.

## Setting up the project to run locally

### Step 1 - Clone the project
Use git to clone the project to your local machine

### Step 2 - Install required dependencies
This project was built using Ruby on Rails

Once you have ruby installed, you will need the bundler gem.  To install bundler, simply run:

```
gem install bundler
```

After bundler is installed, run the following command from the root directory of the application (you may need to install some dependencies):

```
bundle install
```

### Step 3 - Configure environment variables

Ensure that all the variables defined in `.env` file have appropriate values for your system. Ask other team member for it.

### Step 4 - Create local database for development and testing
This part is pretty easy, if you have your configuration set up correctly and your database server is running.

Run the following commands in terminal from the root of the project:

```
rake db:setup
```

Later we can use the script `bin/setup` to automate all these steps.

### Step 5 - Start the server
Start the redis server using the following command:

```
redis-server
```
You can now start web server as well as sidekiq workers using [foreman](https://github.com/theforeman/foreman) though if `
release: bundle exec rake db:migrate` is in the Procfile it might give you issues and heroku CLI would be the way to go (see below):

```
foreman s -p 8000 -f Procfile.dev
```

OR you can start them individually:

Start the background job server (Sidekiq) with the following command:

```
bundle exec sidekiq -C config/sidekiq.yml
```

Start your local webserver with the following:

```
rails s -p 8000
```

### Step 6 - Set up git hooks

Install [overcommit](https://github.com/brigade/overcommit) git hook manager

```
overcommit --install
```

Sign configuration file so overcommit is able to read it

```
overcommit --sign
```

Now the configured hooks in `.overcommit.yml` will run everytime you run `git commit`, being `RuboCop` the most important one.

If, for any reason, you need to commit changes that fail to pass the rubocop check, you can skip it by running

```
SKIP=RuboCop git commit
```

### Testing

Note: By default, log is not enabled on test environment for [better performance](https://jtway.co/speed-up-your-rails-test-suite-by-6-in-1-line-13fedb869ec4). If you want to enable logs, just set the `RAILS_ENABLE_TEST_LOG` environment variable to `true`.

See `spec` directory for configuration. Make sure to test locally first for changes you've made.

```
rake spec
```