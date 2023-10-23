# frozen_string_literal: true
require 'coinbase'
require 'usdt_wallet'
require_relative "bitcoin_to_usdt_exchange/version"

module BitcoinToUsdtExchange

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

  class Error < StandardError; end
  # Your code goes here...
end
