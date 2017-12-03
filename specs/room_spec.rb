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
    @room1 = Room.new(1, @no_guests, @no_songs, 3)
    #setup to test guests in room
    @guest1 = Guest.new("Jimmy Carr",50, nil)
    @guest2 = Guest.new("Graham Norton",50, nil)
    @guests = [@guest1, @guest2]
    @room2 = Room.new(2, @guests, @no_songs, 3)
    #setup to test songs in room
    @song1 = Song.new("I want to break free")
    @song2 = Song.new("Park Life")
    @songs = [@song1, @song2]
    @room3 = Room.new(3, @no_guests, @songs, 3)
    #setup of room of 2 guests and 3 songs
    @song3 = Song.new("Bohemian Rhapsody")
    @songs_room4 = [@song1, @song2, @song3]
    @room4 = Room.new(4, @guests, @songs_room4, 3)
    #extra setup to check room capacity
    @guests_room5 = [@guest1, @guest2, @guest3]
    @room5 = Room.new(5, @guests_room5, @songs, 3)
    @fav_song = "I want to break free"
    @guest3 = Guest.new("Jonathan Ross",50, @fav_song)
    @guest4 = Guest.new("Graham Norton",50, @fav_song)
    #Guest with less money than default room person fee of $10
    @guest_not_enough_cash = Guest.new("Blondie", 8, nil)
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

  def test_song_match__true
    find_song = "I want to break free"
    #returns true if song found
    assert_equal(true, @room3.song_match?(find_song))
  end

  def test_song_match__false
    find_song = "We are the champions"
    #returns false if song not found
    assert_equal(false, @room3.song_match?(find_song))
  end

  def test_count_guests_in_room
    assert_equal(2, @room2.guest_count())
  end

  def test_add_guest_to_room
    #add guest1 to empty room
    @room1.add_guest(@guest1)
    expected = 1
    actual = @room1.guest_count()
    assert_equal(expected, actual)
  end

  def test_add_multiple_guests_to_room
    #add guest1 and guest2 to empty room
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    expected = 2
    actual = @room1.guest_count()
    assert_equal(expected, actual)
  end

  def test_count_songs_in_room
    assert_equal(0, @room2.song_count())
  end

  def test_add_songs_to_room
    #add 3 songs to room with 2 guests
    @room2.add_song(@song1)
    @room2.add_song(@song2)
    @room2.add_song(@song3)
    expected = 3
    actual = @room2.song_count()
    assert_equal(expected, actual)
  end

  def test_remove_guest_from_room
    #remove guest2 from room with 2 guests
    @room2.remove_guest(@guest2)
    expected = [@guest1]
    assert_equal(expected, @room2.guests)
  end

  def test_remove_song_from_room
    #remove song1 from room with 2 songs
    @room3.remove_song(@song1)
    expected = [@song2]
    assert_equal(expected, @room3.songs)
  end

  def test_room_vacated
    # Test to check method that removes all guests
    # and songs from room
    @room4.room_vacated()
    #check guests removed from room list
    expected = []
    assert_equal(expected,@room4.guests)
    #check songs removed from room list
    assert_equal(expected,@room4.songs)
  end

  def test_check_room_capacity__spaces_available
    # test method returns number of spaces available

    expected = 1
    actual = @room4.room_capacity()
    assert_equal(expected, actual)
  end

  def test_check_room_capacity__room_full
    # test method returns 0 spaces available
    expected = 0
    actual = @room5.room_capacity()
    assert_equal(expected, actual)
  end

  def test_check_add_guests__reached_capacity

    @room4.add_guest(@guest3)
    expected = 3
    actual = @room4.guest_count()
    assert_equal(expected, actual)
    #check guest4 can't be added as capacity reached
    @room4.add_guest(@guest4)
    expected = 3
    actual = @room4.guest_count()
    assert_equal(expected, actual)
  end

  def test_check_add_guest__insufficient_funds
    @room2.add_guest(@guest_not_enough_cash )
    expected = 2
    actual = @room2.guest_count()
    assert_equal(expected, actual)
    assert_equal(8, @guest_not_enough_cash.wallet)

  end


  # binding.pry
end
