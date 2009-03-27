require "shoulda"

require 'test/unit/assertions'

require "monkey_party"

World do |world|
  world.extend(Test::Unit::Assertions)
  world
end

