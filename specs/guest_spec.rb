require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("I want to break free")
    @song2 = Song.new("Park Life")
    @guest = Guest.new("Jimmy Choo", 50, nil)
    @guest2 = Guest.new("James Brown", 8, @song1)
    @songs = [@song1, @song2]
    @room = Room.new(1, [], [], 3)
    @room2 = Room.new(2, [@guest2], @songs, 3)
  end

  def test_get_guest_name
    assert_equal("Jimmy Choo", @guest.name)
  end

  def test_get_guest_wallet
    assert_equal(50, @guest.wallet)
  end

  def test_pay_room_fee__sufficient_funds
      binding.pry
    @guest.pay_room_fee(@room)
      binding.pry
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

  # def test_favourite_song_in_room__match
  #
  #  binding.pry
  #   expected = "woo hoo"
  #   actual = @guest2.favourite_song(@room2)
  #
  #  binding.pry
  #   assert_equal(expected, actual)
  # end
end
