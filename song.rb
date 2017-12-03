class Song

  attr_reader :name

  def initialize(name)
    @name = name
    # future functionality add artist to allow to search by
    # @artist
  end

  def get_song_name
    return @name
  end
end
