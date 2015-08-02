class EmailParser

  attr_reader :email

  def initialize(email)
    @email = email
  end

  def coupon?
    false
  end

end
