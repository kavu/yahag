# Yahag

## Installation

Add this line to your application's Gemfile:

    gem 'yahag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yahag

## Usage

```ruby
  @hockey = Yahag::App.new do
    app_id      'your HockeyApp Application ID'
    app_token   'your HockeyApp [API Token](https://rink.hockeyapp.net/manage/auth_tokens "API Tokens")'
    app_secret  'your HockeyApp Application Secret'
  end

  @hockey.list_users
  @hockey.add_user 'some@email.su'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2013 Max Riveiro. See LICENSE.txt for further details.
