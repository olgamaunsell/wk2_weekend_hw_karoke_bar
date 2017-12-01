require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../room.rb")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(3)
  end

  def test_get_room_number
    assert_equal(3, @room.number)
  end

end
