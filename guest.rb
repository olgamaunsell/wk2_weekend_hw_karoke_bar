require('pry')
class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def get_guest_name
    return @name
  end

  def sufficient_funds?(item)
    return wallet >= item.price()
  end

  def pay_room_fee(room)
    if sufficient_funds?(room)
      @wallet -= room.price
    end
  end

  def favourite_song(room)
    if room.song_match?(@favourite_song.name)
      return "woo hoo"
    end
  end
end
