# MonkeyParty

An extremely young API for interacting with the MailChimp API

Currently only supports 

* adding api keys
* finding lists by name
* batch subscribing 
* unsubscribing

Uses the excellent HTTParty and HappyMapper tools and is well tested

## Installation

Add this line to your application's Gemfile:

    gem 'monkey_party'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monkey_party

## Usage

```ruby
  account = MonkeyParty::Account.login("monkey_username", "party_password")
  list = MonkeyParty::List.find_by_name("list_name")
  list.create_subscribers([MonkeyParty::Subscriber.new("user@example.com")])
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
