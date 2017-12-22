# Consense
A rails engine made for giving consent!

## Installing
Add this to your gemfile: `gem 'consense', path: 'path/to/consense'`

To mount the engine add this to your *config/routes.rb* file: `mount Consense::Engine, at: "/consense"`

Run `rake consense:install:migrations && rake db:migrate`, to import necessary migrations.

# Usage
Run `rails g consense:consempt_prompt` to generate a view for a specified agreement name. Keep in mind that it must have buttons for accepting and denying the agreement through the engine.

To prompt the newly generated view, add this to a controller:
```ruby
# app/controllers/my_controller.rb
include Consense::Promptable

before_action do
  prompt_consent :my_deal,
                 approved_path: approved_path,
                 denied_path: denied_path
end
```

- `:my_deal` refers the name of the agreement.
- `approved_path` is the path the user will be redirected if the consent is given
- `denied_path` is the path the user will be redirected if the consent is not given

Behind the scenes the engine will look up the user and check if it has a consent in the database. Because of this it is important that you define the user before calling the before action.

The user is recognized with `current_user`. If you have any other method for reaching the current user, you can specify it with the option `:user_method`, like so: `prompt_consent ..., user_method: :my_user`.

And you're ready to go! The consent prompt will not be gone until the user accepts the deal! :D
