require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup
    @song = Song.new("I want to break free")
  end

  def test_get_song_name
    assert_equal("I want to break free", @song.name)
  end

end
