require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class TestRoom < MiniTest::Test

  def setup
    #setup to test zero guests and zero songs in room
    @no_guests = []
    @no_songs = []
    @room1 = Room.new(1, @no_guests, @no_songs)
    #setup to test guests in room
    @guest1 = Guest.new("Jimmy Carr")
    @guest2 = Guest.new("Graham Norton")
    @guests = [@guest1, @guest2]
    @room2 = Room.new(2, @guests, @no_songs)
    #setup to test songs in room
    @song1 = Song.new("I want to break free")
    @song2 = Song.new("Park Life")
    @songs = [@song1, @song2]
    @room3 = Room.new(3, @no_guests, @songs)
    #setup to add guest
    # @room4 = Room.new(4, 0, 0)
  end

  def test_get_room_number
    assert_equal(1, @room1.number)
  end

  def test_room_has__no_guests
    expected = 0
    actual = @room1.guests.count()
    assert_equal(expected, actual)
  end

  def test_room_has__no_songs
    expected = 0
    actual = @room1.songs.count()
    assert_equal(expected, actual)
  end

  def test_room_has__two_guests
    expected = 2
    actual = @room2.guests.count()
    assert_equal(expected, actual)
  end

  def test_room_has__two_songs
    expected = 2
    actual = @room3.songs.count()
    assert_equal(expected, actual)
  end

  def test_get_first_song_in_songs
    assert_equal("I want to break free", @room3.songs.first().name())
  end

  def test_count_guests_in_room
    assert_equal(2, @room2.guest_count())
  end

  def test_add_guest_to_room
    #add guest1 to empty room
    expected = 1
    @room1.add_guest(@guest1)
    actual = @room1.guest_count()
    assert_equal(expected, actual)
  end

  # def test_room_has_two_guests_and_two_songs
  #
  # end

end
