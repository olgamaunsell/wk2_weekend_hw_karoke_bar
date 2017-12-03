class GuestTab

  attr_reader :guest_name, :balance

  def initialize(guest_name, balance)
    @guest_name = guest_name
    @balance = balance
  end

  def increment_balance(amount)
    @balance += amount
  end

end
