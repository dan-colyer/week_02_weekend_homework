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


end
