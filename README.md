# Optional

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/optional`. To experiment with that code, run `bin/console` for an interactive prompt.

Do you like nil?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'optional'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optional

## Usage
```ruby
value = 100 # or nil
some = Optional::some(value)
new_some = some.map{|s| s+50}
    .map{|s| s+50}
    .map{|s| s+50}
puts new_some.wrap() # 250 or nil

value2 = nil
some2 = Optional::some(value2)
new_some2 = some2.map_or(50){|s| s+50}
puts new_some2.wrap() # 100

# Look at test for detail.
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/optional.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
