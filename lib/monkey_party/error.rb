module MonkeyParty
  class Error < Exception
    include HappyMapper

    tag 'MCAPI'
    element :message, String, :tag => "error"
    element :code, Integer
  end
end

