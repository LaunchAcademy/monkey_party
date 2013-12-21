require 'spec_helper'

describe MonkeyParty::List, :vcr do
  let(:list_name) { "Testing" }
  let(:list) { MonkeyParty::List.find_by_name(list_name) }
  let(:subscriber) do
    MonkeyParty::Subscriber.new("auser@launchware.com")
  end

  describe "subscribing" do
    let(:bad_subscriber) do
      MonkeyParty::Subscriber.new("badEmail")
    end

    it "subscribes someone successfully" do
      subs = list.create_subscribers([subscriber], :double_optin => false)
      expect(subs[0]).to be_valid

      #clean up after yourself
      list.destroy_subscribers([subs[0]], :delete_member => true)
    end

    it "handles errors gracefully" do
      subs = list.create_subscribers([bad_subscriber])
      expect(subs[0]).to_not be_valid
    end

  end

  describe "unsubscribing" do
    after(:each) do
      list.destroy_subscribers([subscriber], :delete_member => true)
    end

    it 'should have valid subscribers' do
      subs = list.create_subscribers([subscriber], :double_optin => false)
      expect(subs[0]).to be_valid
      subs = list.destroy_subscribers([subscriber])
      expect(subs[0]).to be_valid
    end
  end
end

