#load account settings from a yaml file

require "configatron"
require "ruby-debug"

configatron.mailchimp.configure_from_yaml(
  File.join(File.dirname(__FILE__), "account.yml"))

