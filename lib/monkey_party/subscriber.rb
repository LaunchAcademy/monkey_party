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
        :email => self.email,
      }.merge(self.merge_fields).tap do |h|
        h[:error] = self.error.to_h if self.error
      end
    end

    def to_mailchimp_hash
      self.to_h.keys.inject({}) do |chimp_hash, key|
        chimp_hash[key.to_s.upcase[0..9]] = self.to_h[key] unless key == :error
        chimp_hash
      end
    end

    def valid?
      self.error.nil?
    end
  end
end

