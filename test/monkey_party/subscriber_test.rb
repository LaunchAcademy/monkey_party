require "test_helper"

class MonkeyParty::SubscriberTest < Test::Unit::TestCase
  context "A subscriber" do
    setup do
      @merge_vars = {:merge_var => "MERGE VAR 1"}
      @email = "user@example.com"
      @subscriber = MonkeyParty::Subscriber.new(@email, @merge_vars)
    end

    should "have an email" do
      assert_equal @email, @subscriber.email
    end

    should "have a list of merge fields" do
      assert_equal @merge_vars, @subscriber.merge_fields
    end

    should "have a hashed version of all the attributes" do
      intended_hash = {
        :email => @email
      }.merge(@merge_vars)

      assert_equal intended_hash, @subscriber.to_h
    end

    should "have a mailchimp style hash of all the attributes" do
      intended_hash = {}
      intended_hash["EMAIL"] = @email
      @merge_vars.each do |key, value|
        intended_hash[key.to_s.upcase] = value
      end

      assert_equal intended_hash, @subscriber.to_mailchimp_hash
    end
  end
end
