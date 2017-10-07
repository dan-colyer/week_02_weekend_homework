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

    @guest_1 = Guest.new("Eglantine Price", 100, "any old song")
    @guest_2 = Guest.new("Euphemia Doubtfire", 100, "any old song")
    guests = [@guest_1, @guest_2]

    @room = Room.new("Room 1", guests, songs, 50)
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
    guest_3 = Guest.new("Harold Bishop", 100, "any old song")
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
    guest_3 = Guest.new("Harold Bishop", 100, "any old song")
    guest_4 = Guest.new("Man Man", 100, "any old song")

    @room.add_guest(guest_3)
    @room.add_guest(guest_4)

    assert_equal(true, @room.isFull())
  end

# Test 9
    def test_room_does_not_go_over()
      guest_3 = Guest.new("Harold Bishop", 100, "any old song")
      guest_4 = Guest.new("Man Man", 100, "any old song")

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

# Test 10
  def test_guest_has_enough_cash()
    result = @room.canAfford(@guest_1)
    assert_equal(true, result)
  end

# Test 11
  def test_add_guest__cant_afford
    guest_5 = Guest.new("Old Davey", 16, "any old song")
    @room.add_guest(guest_5)
    result = @room.number_of_guests()
    assert_equal(2, result)
  end

# Test 12
  def test_add_guest__can_afford
    guest_6 = Guest.new("Manko", 70, "any old song")
    @room.add_guest(guest_6)
    result = @room.number_of_guests()
    assert_equal(3, result)
  end

# Test 13
  def test_guest_match_favourite_song
    guest_7 = Guest.new("Crazy Harry", 70, "Down by the River")
    result = @room.isFavourite(guest_7)
    assert_equal(true, result)
  end

# Test 14
  def test_guest_match_favourite_song__non_match
    guest_8 = Guest.new("Crazy Harry", 70, "Summertime")
    result = @room.isFavourite(guest_8)
    assert_equal(false, result)
  end

# Test 15
  def test_add_guest_favourite_song_shoutout
    guest_7 = Guest.new("Crazy Harry", 70, "Down by the River")
    result = @room.add_guest(guest_7)
    assert_equal("YOUR SONG!", result)
  end
end

# Advanced extensions
#
#     Guests could have a favourite song, and if their favourite song is on the room's playlist, they can cheer loudly! (return a string like "Whoo!")
#     Rooms can keep track of the entry fees/spending of the guests - maybe add a bar tab/bar class?
#     Add anything extra you think would be good to have at a karaoke venue!
#     Write a Runner class, so that your Karaoke app can be run in Terminal.
