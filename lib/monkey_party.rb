require "monkey_party/version"

module MonkeyParty
  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.api_key
    @api_key
  end

  def self.data_center=(data_center)
    @data_center = data_center
  end

  def self.data_center
    @data_center
  end
end

require "httparty"
require "happymapper"

require "monkey_party/base"

require "monkey_party/list"
require "monkey_party/error"
require "monkey_party/subscriber"

