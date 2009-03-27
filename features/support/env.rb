require "shoulda"

require 'test/unit/assertions'

World do |world|
  world.extend(Test::Unit::Assertions)
  world
end

