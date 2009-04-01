require "test_helper"

class MonkeyParty::ErrorTest < Test::Unit::TestCase
  context "An error" do
    setup do
      error_body = File.read(xml_fixture_path("login_failed")).gsub(/.*<MCAPI/m, "<MCAPI")
      @error = MonkeyParty::Error.parse(error_body)
    end

    should "have a code" do
      assert_not_nil @error.code
    end

    should "have an error message" do
      assert_not_nil @error.message
    end
  end
end
