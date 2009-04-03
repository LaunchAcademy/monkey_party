# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{monkey_party}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Pickett"]
  s.date = %q{2009-04-03}
  s.email = %q{dpickett@enlightsolutions.com}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "lib/monkey_party", "lib/monkey_party/account.rb", "lib/monkey_party/base.rb", "lib/monkey_party/error.rb", "lib/monkey_party/list.rb", "lib/monkey_party/subscriber.rb", "lib/monkey_party.rb", "test/fixtures", "test/fixtures/batch_subscribe_failed.xml", "test/fixtures/batch_subscribe_successful.xml", "test/fixtures/batch_unsubscribe_failed.xml", "test/fixtures/batch_unsubscribe_successful.xml", "test/fixtures/lists_failed.xml", "test/fixtures/lists_successful.xml", "test/fixtures/login_failed.xml", "test/fixtures/login_successful.xml", "test/monkey_party", "test/monkey_party/account_test.rb", "test/monkey_party/error_test.rb", "test/monkey_party/list_test.rb", "test/monkey_party/subscriber_test.rb", "test/test_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/dpickett/monkey_party}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jnunemaker-httparty>, [">= 0.3.1"])
      s.add_runtime_dependency(%q<jnunemaker-happymapper>, [">= 0.2.2"])
      s.add_runtime_dependency(%q<configatron>, [">= 2.2.2"])
    else
      s.add_dependency(%q<jnunemaker-httparty>, [">= 0.3.1"])
      s.add_dependency(%q<jnunemaker-happymapper>, [">= 0.2.2"])
      s.add_dependency(%q<configatron>, [">= 2.2.2"])
    end
  else
    s.add_dependency(%q<jnunemaker-httparty>, [">= 0.3.1"])
    s.add_dependency(%q<jnunemaker-happymapper>, [">= 0.2.2"])
    s.add_dependency(%q<configatron>, [">= 2.2.2"])
  end
end
