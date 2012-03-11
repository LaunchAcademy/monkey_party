require 'spec_helper'

describe MonkeyParty::Subscriber do
  let(:email) { "user@example.com" }
  let(:subscriber) { MonkeyParty::Subscriber.new(email) }

  it "serializes to a mailchimp hash" do
    subscriber.to_mailchimp_hash.keys.should include("EMAIL")
    subscriber.to_mailchimp_hash["EMAIL"].should eql(email)
  end
end

