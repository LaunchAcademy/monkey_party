# -*- encoding: utf-8 -*-
require File.expand_path('../lib/monkey_party/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Pickett"]
  gem.email         = ["dan.pickett@launchware.com"]
  gem.description   = %q{A web wrapper for mailchimp}
  gem.summary       = %q{A web wrapper for mailchimp}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "monkey_party"
  gem.require_paths = ["lib"]
  gem.version       = MonkeyParty::VERSION

  gem.add_dependency "httparty"
  gem.add_dependency "happymapper", "0.4.0"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "fakeweb"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "guard-rspec"
end

