module MonkeyParty
  class Subscriber
    attr_accessor :email, :merge_fields, :error

    def initialize(email, merge_fields = {})
      self.email = email
      self.merge_fields = merge_fields
      self.error = nil
    end

    def to_h
      {
        :email => self.email
      }.merge(self.merge_fields)
    end

    def to_mailchimp_hash
      chimp_hash = {}
      self.to_h.each do |key, value|
        chimp_hash[key.to_s.upcase] = value
      end

      chimp_hash
    end

    def valid?
      self.error.nil?
    end
  end
end
