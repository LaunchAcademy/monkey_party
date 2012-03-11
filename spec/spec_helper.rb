require 'rspec'
require 'vcr'

require 'monkey_party'

require "pry"
Dir[File.dirname(__FILE__) + "/support/*.rb"].each{|f| require f }

RSpec.configure do |c|
  # so we can use `:vcr` rather than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

