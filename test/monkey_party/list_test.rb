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

  context "subscribing" do

    setup do
      mock_all_response

      @list = MonkeyParty::List.all[0]
      
      @subscribers = []
      @subscribers << MonkeyParty::Subscriber.new("user@example.com", 
        {:fname => "A User"})
      @subscribers << MonkeyParty::Subscriber.new("user3@example.com", 
        {:fname => "Another User"})
      

    end

    context "successful subscriptions" do
      setup do
        mock_subscription
        @resultant_subscribers = @list.create_subscribers(@subscribers)
      end

      should "return an array of subscribers" do
        assert_kind_of MonkeyParty::Subscriber, @resultant_subscribers[0]
      end

      should "indicate that each subscription was valid" do
        @resultant_subscribers.each do |s|
          assert s.valid?
        end
      end
    end


    context "failed subscriptions" do
      setup do
        mock_subscription(false)
        @resultant_subscribers = @list.create_subscribers(@subscribers)
      end

      should "indicate have invalid subscribers" do
        assert !@resultant_subscribers[0].valid?
      end

      should "have a subscriber with an error" do
        assert_not_nil @resultant_subscribers[0].error
        assert_kind_of MonkeyParty::Error, @resultant_subscribers[0].error
      end
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

    should "find by name" do
      mock_all_response
      assert_equal "Testing", MonkeyParty::List.find_by_name("Testing").name
    end
  end

  private
  def mock_all_response(success = true)
    mock_response("apikey=2491541245g978jkasf&method=lists&output=xml",
      success ? "successful_lists" : "failed_lists")
  end

  def mock_subscription(success = true)
    mock_response("double_optin=&update_existing=false&" +
      "method=listBatchSubscribe&replace_interests=true&" + 
      "batch[1][EMAIL]=user3%40example.com&batch[1][FNAME]=Another%20User&" + 
      "output=xml&batch[0][EMAIL]=user%40example.com&" +
      "batch[0][FNAME]=A%20User&id=d40bbc3056&apikey=2491541245g978jkasf", 
      success ? "successful_subscribe" : "failed_subscribe")
  end
end
