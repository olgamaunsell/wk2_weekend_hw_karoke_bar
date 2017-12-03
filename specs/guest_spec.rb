require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../guest.rb")
require_relative("../room.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Jimmy Choo", 50, nil)
    @guest2 = Guest.new("Jimmy Choo", 8, nil)
    @room = Room.new(1, [], [], 3)
  end

  def test_get_guest_name
    assert_equal("Jimmy Choo", @guest.name)
  end

  def test_get_guest_wallet
    assert_equal(50, @guest.wallet)
  end

  def test_pay_room_fee__sufficient_funds
    @guest.pay_room_fee(@room)
    expected = 40
    actual = @guest.wallet
    assert_equal(expected, actual)
  end

  def test_pay_room_fee__insufficient_funds
    @guest2.pay_room_fee(@room)
    expected = 8
    actual = @guest2.wallet
    assert_equal(expected, actual)
  end

end
