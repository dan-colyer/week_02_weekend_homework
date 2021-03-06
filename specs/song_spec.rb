require('minitest/autorun')
require('minitest/rg')
require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup
    @song_1 = Song.new("Down by the River", "Bruce Springsteen")
  end

# Test 1
  def test_song_name()
    assert_equal("Down by the River", @song_1.title)
  end

# Test 2
  def test_artist_name()
    assert_equal("Bruce Springsteen", @song_1.artist)
  end

end
