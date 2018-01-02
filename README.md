# Consense
A rails engine made for giving consent!

## Installing
Add this to your gemfile: `gem 'consense', git: 'git://github.com/standout/consense'`

To mount the engine add this to your *config/routes.rb* file: `mount Consense::Engine, at: "/consense"`

Run `rake consense:install:migrations && rake db:migrate`, to import necessary migrations.

# Usage
Run `rails g consense:consempt_prompt <my_deal>` to generate a view for a specified agreement name. Keep in mind that it must have buttons for accepting and denying the agreement through the engine.

To prompt the newly generated view, add this to a controller:
```ruby
# app/controllers/my_controller.rb
include Consense::Promptable

before_filter { prompt_consent :my_deal }
```

- `:my_deal` refers the name of the agreement.

Behind the scenes the engine will look up the user and check if it has a consent in the database. Because of this it is important that you define the user before calling the before action.

The user is recognized by calling `current_user`. If you have any other method for reaching the current user, you can specify it with the option `:user_method`, like so: `prompt_consent ..., user_method: :my_user`.

And you're ready to go! The consent prompt will not be gone until the user accepts the deal! :D
