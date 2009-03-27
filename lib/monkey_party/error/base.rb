module MonkeyParty
  module Error
    class Base < Exception
      include HappyMapper

      tag 'MCAPI'
      element :error, String
      element :code, Integer
    end
  end
end
