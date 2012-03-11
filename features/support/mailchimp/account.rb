#load account settings from a yaml file

require "configatron"

configatron.mailchimp.configure_from_yaml(
  File.join(File.dirname(__FILE__), "account.yml"))

