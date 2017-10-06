class Room

attr_reader :name

  def initialize(name, guests, songs)
    @name = name
    @guests = guests
    @songs = songs
  end

  def number_of_guests()
    return @guests.length
  end

  def add_guest(guests)
    return @guests << guests
  end

  def remove_guest(guests)
    return @guests.delete(guests)
  end

  def number_of_songs()
    return @songs.length
  end

  def add_song(song)
    @songs << song
  end

  def remove_song(song)
    @songs.delete(song)
  end

end
