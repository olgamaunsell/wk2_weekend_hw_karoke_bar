require('pry')

class Room

  attr_reader :number, :guests, :songs, :capacity, :price

  def initialize(number, guests, songs, capacity)
    @number = number
    @guests = guests
    @songs = songs
    @capacity = capacity
    #price is per guest
    @price = 10
  end

  def guest_count
    return @guests.count()
  end

  def add_guest(guest)
    return if room_capacity() == 0
    #call guest class to reduce wallet amount by room fee
    # if guest has sufficient funds
    return if !guest.pay_room_fee(self)
    # add guest to room list
    @guests.push(guest)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def song_count
    return @songs.count()
  end

  def song_match?(fav_song)
    #Create array of song names
    song_names = @songs.map { |song| song.name }
    #check if favourite song is included in list of room songs
    if song_names.include?(fav_song)
      return "woo hoo !"
    end
  end

  def add_song(song)
    @songs.push(song)
  end

  def remove_song(song)
    @songs.delete(song)
  end

  def room_vacated()
    # Room has been vacated of all guests.
    # Clear guest and song list
    @guests.clear()
    @songs.clear()
  end

  def room_capacity()
    guest_count = guest_count()
    return spaces = @capacity - guest_count
  end

  def serve_guest(guest_tab, menu_item)
    #Assume that each guest will have a bar tab
    #Future extension would provide option to pay as you go

    item_price = menu_item.price
    guest_tab.increment_balance(item_price)
  end
end
