require 'rubygems'
require 'test/unit'
require 'shoulda'

begin 
  require "redgreen"
rescue LoadError; end

require 'fake_web'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'monkey_party'

FakeWeb.allow_net_connect = false

configatron.mailchimp.api_key = "api_key"

class Test::Unit::TestCase
  protected
  def mock_response(path, fixture)
    FakeWeb.register_uri(
      "http://api.mailchimp.com/1.2?#{path}",
      :response => xml_fixture_path(fixture))
  end

  def xml_fixture_path(fixture)
    File.join(File.dirname(__FILE__), "fixtures", "#{fixture}.xml")
  end

end
