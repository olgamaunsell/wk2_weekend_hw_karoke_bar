require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../room.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @no_songs = []
    @song1 = Song.new("I want to break free")
    @song2 = Song.new("Park Life")
    @songs = [@song1, @song2]
    @room1 = Room.new(3, @no_songs)
    @room2 = Room.new(3, @songs)
  end

  def test_get_room_number
    assert_equal(3, @room1.number)
  end

  def test_room_has__no_songs
    expected = 0
    actual = @room1.songs.count()
    assert_equal(0, actual)
  end

  def test_room_has__two_songs
    expected = 0
    actual = @room2.songs.count()
    assert_equal(2, actual)
  end

  def test_get_first_song_in_songs
    assert_equal("I want to break free", @room2.songs.first().name())
  end
end
