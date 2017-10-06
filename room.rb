class Room

attr_reader :name, :guests, :songs

  def initialize(name, guests, songs)
    @name = name
    @guests = guests
    @songs = songs
  end
end
