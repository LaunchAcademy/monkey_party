require 'spec_helper'

describe MonkeyParty do
  let(:new_api_key) { "an api key" }
  let(:new_data_center) { "us3" }
  it "allows for the setting of an api key" do
    old_key = MonkeyParty.api_key.dup
    
    MonkeyParty.api_key = new_api_key
    MonkeyParty.api_key.should eql(new_api_key)
    
    #revert api key
    MonkeyParty.api_key = old_key
  end
  
  it "allows for the setting of a datacenter" do
    old_center = MonkeyParty.data_center.dup
    
    MonkeyParty.data_center = new_data_center
    MonkeyParty.data_center.should eql(new_data_center)
    
    #revert data center
    MonkeyParty.data_center = old_center
  end
  
  it "defaults the data center to us1" do
    old_center = MonkeyParty.data_center.dup
    
    MonkeyParty.data_center = nil
    MonkeyParty.data_center.should eql("us1")
    
    #revert data center
    MonkeyParty.data_center = old_center
  end
end
