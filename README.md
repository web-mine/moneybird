# Moneybird

Gem to talk to the Moneybird REST API. Right now you'll need to get a 'bearer' token for the client to work, oauth2 support may added later. This gem is still under construction and any methods may still change signature without notice until 1.0 is released.

Feel free to file Pull Requests

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moneybird'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moneybird

## Usage

```ruby

Moneybird::Client.new('fe3f7f9e239e7d925f9caf695028e60fd3e5c2085f7aebb983cea731dea6b44f').administrations.first.sales_invoices.first

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maartenvanvliet/moneybird. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

