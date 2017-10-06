require('minitest/autorun')
require('minitest/rg')
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

class TestRoom < MiniTest::Test

  def setup
    @song_1 = Song.new("Down by the River", "Bruce Springsteen")
    @song_2 = Song.new("Big Eyed Fish", "Dave Matthews Band")
    songs = [@song_1, @song_2]

    @guest_1 = Guest.new("Eglantine Price")
    @guest_2 = Guest.new("Euphemia Doubtfire")
    guests = [@guest_1, @guest_2]

    @room = Room.new("Room 1", guests, songs)
  end

  def test_room_has_name()
    assert_equal("Room 1", @room.name)
  end

end
