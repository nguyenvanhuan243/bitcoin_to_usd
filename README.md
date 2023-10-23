# BitcoinToUsdtExchange

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bitcoin_to_usdt_exchange`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bitcoin_to_usdt_exchange.

How to create

# Create a new Ruby gem project
gem install bundler
bundle gem bitcoin_to_usdt_exchange

# Navigate to the gem directory
cd bitcoin_to_usdt_exchange

# Edit the gemspec to include dependencies
# Add the following to bitcoin_to_usdt_exchange.gemspec
#
#   spec.add_runtime_dependency 'coinbase', '>= 5.0.0'
#   spec.add_runtime_dependency 'usdt_wallet', '>= 0.1.0'

# Create a new file in the lib directory, e.g., lib/bitcoin_to_usdt_exchange.rb

# Add the following code to lib/bitcoin_to_usdt_exchange.rb

require 'coinbase'
require 'usdt_wallet'

module BitcoinToUSDTExchange
  class Converter
    def initialize(api_key, api_secret)
      @coinbase = Coinbase::Wallet.new(api_key, api_secret)
    end

    def bitcoin_to_usdt(amount_in_btc)
      begin
        bitcoin_price = @coinbase.price(currency: 'BTC-USD')
        usd_price = @coinbase.price(currency: 'USDT-USD')
        amount_in_usd = amount_in_btc * bitcoin_price.amount
        amount_in_usdt = amount_in_usd / usd_price.amount
        amount_in_usdt
      rescue Coinbase::Wallet::APIError => e
        raise "Error fetching exchange rates: #{e.message}"
      end
    end

    def send_usdt(amount_in_usdt, recipient_address)
      # Implement code to send USDT here using the usdt_wallet gem
    end
  end
end

# Create a README.md file with instructions on how to use the gem

# Update the gem version in the bitcoin_to_usdt_exchange.gemspec

# Push the gem to RubyGems
gem build bitcoin_to_usdt_exchange.gemspec
gem push bitcoin_to_usdt_exchange-0.1.0.gem

# Users can now install and use your gem
# gem install bitcoin_to_usdt_exchange
