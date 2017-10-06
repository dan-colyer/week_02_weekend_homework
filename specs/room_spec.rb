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

# Test 1
  def test_room_has_name()
    assert_equal("Room 1", @room.name)
  end

# Test 2
  def test_check_how_many_guests()
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

# Test 5
  def test_check_how_many_songs()
    result = @room.number_of_songs()
    assert_equal(2, result)
  end

# Test 6
  def test_add_song()
    song_3 = Song.new("Fisherman's Blues", "The Waterboys")
    @room.add_song(song_3)
    result = @room.number_of_songs
    assert_equal(3, result)
  end

# Test 7
  def test_remove_song()
    @room.remove_song(@song_1)
    result = @room.number_of_songs
    assert_equal(1, result)
  end

# Test 8
  def test_room_full()
    guest_3 = Guest.new("Harold Bishop")
    guest_4 = Guest.new("Man Man")

    @room.add_guest(guest_3)
    @room.add_guest(guest_4)

    assert_equal(true, @room.isFull())
  end

  #test 9
    def test_room_does_not_go_over()
      guest_3 = Guest.new("Harold Bishop")
      guest_4 = Guest.new("Man Man")

      @room.add_guest(guest_3)
      @room.add_guest(guest_4)
      @room.add_guest(guest_4)
      @room.add_guest(guest_4)
      @room.add_guest(guest_4)
      @room.add_guest(guest_4)
      @room.add_guest(guest_4)
      @room.add_guest(guest_4)
      
      result = @room.number_of_guests()
      assert_equal(4, result)
    end
end

# Extensions
#
#     What happens if there are more guests trying to be checked in than there is free space in the room?
#     Karaoke venues usually have an entry fee - So the guests could have money so they can pay it.
