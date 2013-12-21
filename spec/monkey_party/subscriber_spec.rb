require 'spec_helper'

describe MonkeyParty::Subscriber do
  let(:email) { "user@example.com" }
  let(:subscriber) { MonkeyParty::Subscriber.new(email) }

  it "serializes to a mailchimp hash" do
    expect(subscriber.to_mailchimp_hash.keys).to include("EMAIL")
    expect(subscriber.to_mailchimp_hash["EMAIL"]).to eq(email)
  end
end

