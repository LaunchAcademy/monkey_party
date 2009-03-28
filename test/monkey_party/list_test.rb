require "test_helper"

class MonkeyParty::ListTest < Test::Unit::TestCase
  context "a list" do
    should "have a set of members" do

    end
    
    should "allow me to add members to the list" do
    end

    should "allow me to unsubscribe members from the list" do

    end

    should "have an id" do

    end

    should "have a web_id" do

    end

    should "have a name" do

    end

    should "have a date of creation" do

    end

    should "have a member count" do

    end
    
  end

  context "lists" do
    should "retrieving all of the lists" do
      mock_all_response
      lists = MonkeyParty::List.all
      assert_kind_of Array, lists
      assert_not_nil lists[0]
      assert_not_nil lists[0].name
    end

    should "raise an error if something goes wrong" do
      mock_all_response(false)
      assert_raises MonkeyParty::Error do 
        lists = MonkeyParty::List.all
      end
    end
  end

  private
  def mock_all_response(success = true)
    mock_response("apikey=2491541245g978jkasf&method=lists&output=xml",
      success ? "successful_lists" : "failed_lists")
  end
end
