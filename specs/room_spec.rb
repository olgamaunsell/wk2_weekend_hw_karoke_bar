require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../room.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @songs = []
    @song1 = Song.new("I want to break free")

    @room = Room.new(3, @songs)
  end

  def test_get_room_number
    assert_equal(3, @room.number)
  end

  def test_room_has__no_songs
    expected = 0
    actual = @room.songs.count()
    assert_equal(0, actual)
  end
end
