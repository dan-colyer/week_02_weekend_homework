require_relative("guest.rb")

class Room

attr_reader :name

  def initialize(name, guests, songs, price)
    @name = name
    @guests = guests
    @songs = songs
    @price = price
  end

  def number_of_guests()
    return @guests.length
  end

  # def add_guest(guests)
  #   return @guests << guests
  # end

  def add_guest(guests)
    if(!isFull() && canAfford(guests))
      @guests << guests
    end
  end

  def isFull()
    return @guests.length == 4
  end

  def canAfford(guest)
    return guest.cash >= @price
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
