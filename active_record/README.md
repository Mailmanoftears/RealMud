## MUD in Ruby

# MVC, SQLite3 and ActiveRecord

This is a database backed MVC based small MUD that needs needs a lot of work.

### Setup instructions

- Clone Repo

- edit rekefile and comment out ```require 'rspec/core/rake_task'```

  so it should look like this:

```
# require 'rspec/core/rake_task'
```

- setup the db with:

```
user@host:~$ rake db:setup
```

- install the required gems with:

```
user@host:~$ bundle install
```
...make sure you have bundler installed before running that command

Bundler can be installed with ```gem install bundler``` if it is missing.

### Run the Game

In order to run the game just type:

```
user@host:~$ rake
```

There are several in game commands, which can be viewed by typing ```help```

To exit the game just type ```exit``` or ```quit```.

### Additional DB options

The Rakefile also allows to create, destroy and migrate. 

```
user@host:~$ rake db:create
user@host:~$ rake db:drop
user@host:~$ rake db:migrate
```
