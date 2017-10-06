require('minitest/autorun')
require('minitest/rg')
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

# Your program should be test driven and should be able to:
#
#     Create rooms, songs and guests
#     Check in guests to rooms/Check out guests from rooms
#     Add songs to rooms


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

# Test 1
  def test_room_has_name()
    assert_equal("Room 1", @room.name)
  end

# Test 2
  def test_check_how_many_guest()
    result = @room.number_of_guests()
    assert_equal(2, result)
  end

# Test 3
  def test_add_guest()
    guest_3 = Guest.new("Harold Bishop")
    @room.add_guest(guest_3)
    result = @room.number_of_guests()
    assert_equal(3, result)
  end

# Test 4
  def test_remove_guest()
    @room.remove_guest(@guest_2)
    result = @room.number_of_guests()
    assert_equal(1, result)
  end

end
