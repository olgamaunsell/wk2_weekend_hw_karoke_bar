class Song

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_song_name
    return @name
  end
end
