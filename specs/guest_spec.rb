require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Jimmy Choo", 50)
  end

  def test_get_guest_name
    assert_equal("Jimmy Choo", @guest.name)
  end

  def test_get_guest_wallet
    assert_equal(50, @guest.wallet)
  end

  def test_reduce_wallet_amount
    amount = 10
    wallet = @guest.reduce_wallet_amount(amount)
    expected = 40
    actual = @guest.wallet
    assert_equal(expected, actual)
  end
end
