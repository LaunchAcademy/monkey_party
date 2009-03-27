require 'rubygems'
require 'test/unit'
require 'shoulda'

require 'fake_web'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'monkey_party'

FakeWeb.allow_net_connect = false

class Test::Unit::TestCase
  protected
  def mock_response(path, fixture)
    FakeWeb.register_uri(
      "http://api.mailchimp.com/1.1?#{path}&output=xml",
      :response => xml_fixture_path(fixture))
  end

  def xml_fixture_path(fixture)
    File.join(File.dirname(__FILE__), "fixtures", "#{fixture}.xml")
  end

end
