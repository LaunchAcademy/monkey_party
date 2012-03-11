mailchimp_matcher = lambda do |request_1, request_2|
  uri_1 = URI(request_1.uri)
  uri_2 = URI(request_2.uri)
  api_key_phrase = /apikey=[^\&]*/

  params_match = uri_1.query.gsub(api_key_phrase, "") == uri_2.query.gsub(api_key_phrase, "")
  hosts_match = uri_1.host.gsub(/^us\d\./, "") == uri_2.host.gsub(/^us\d\./, "")
  [
    params_match,
    hosts_match
  ]
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :fakeweb
  c.configure_rspec_metadata!
  c.register_request_matcher :mailchimp_matcher do |req1, req2|
    mailchimp_matcher.call(req1, req2)
  end 

  c.default_cassette_options = {
    :match_requests_on => [:method, :mailchimp_matcher],
    :record => :new_episodes 
  }
  c.filter_sensitive_data('<API KEY>') { MonkeyParty.api_key }
end

