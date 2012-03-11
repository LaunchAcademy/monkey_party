module MonkeyParty
  class Error < Exception
    include HappyMapper

    tag 'MCAPI'
    element :message, String, :tag => "error"
    element :code, Integer

    def to_h
      {
        :message => message,
        :code    => code
      }
    end
  end
end

