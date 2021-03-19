# Flow Ruby

Flow Ruby is a Ruby wrapper for the Flow API. You can find more information about the Flow API [here](https://docs.onflow.org/access-api).

This gem was inspired by Daniel Podaru's [post](https://www.onflow.org/post/interact-with-flow-using-ruby).

This gem is currently in development, if you would like to help please contribute. Some things to focus on:
- #send_transaction
- #get_events_for_height_range and #get_events_for_block_ids
- #get_latest_protocol_state_snapshot
- TESTS!!!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flow-ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install flow-ruby

## Usage

In order to use Flow you must first instantiate the client and call the methods directly from there.
```ruby
require 'flow'

client = Flow::Client.new
client.ping #==> Flow::Access::PingResponse
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Testing

To test the gem simply run  `rake test`  from the root of the library folder.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davidmetta/flow_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/davidmetta/flow_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FlowRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/davidmetta/flow_ruby/blob/master/CODE_OF_CONDUCT.md).
