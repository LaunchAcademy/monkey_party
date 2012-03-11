# -*- encoding: utf-8 -*-
require File.expand_path('../lib/monkey_party/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Pickett"]
  gem.email         = ["dpickett@enlightsolutions.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "monkey_party"
  gem.require_paths = ["lib"]
  gem.version       = MonkeyParty::VERSION

  gem.add_dependency "httparty"
  gem.add_dependency "happymapper"
  gem.add_dependency "configatron"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "shoulda"
end

