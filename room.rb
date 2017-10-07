require_relative("guest.rb")
require_relative("song.rb")
class Room

attr_reader :name, :songs

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

  # def add_guest(guests)
  #   if(!isFull() && canAfford(guests))
  #     @guests << guests
  #   end
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

  def isFavourite(guest)
    # for item in @songs
    #   if (item.title == guest.favourite_song)
    #     return true
    #   end
    # end

    return true if @songs.find_all {|item| item.title == guest.favourite_song}
  end

#   find = pets.find_all {|pet| pet[:breed] == "Dalmation"}
# puts false if find == []

# puts pets.find_all {|pet| pet[:breed] == "Husky"}

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
