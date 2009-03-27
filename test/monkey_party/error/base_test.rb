require "test_helper"

class MonkeyParty::Error::BaseTest < Test::Unit::TestCase
  include MonkeyParty::Error

  context "An error" do
    setup do
      error_body = File.read(xml_fixture_path("failed_login")).gsub(/.*<MCAPI/m, "<MCAPI")
      @error = Base.parse(error_body)
    end

    should "have a code" do
      assert_not_nil @error.code
    end

    should "have an error" do
      assert_not_nil @error.error
    end
  end
end
