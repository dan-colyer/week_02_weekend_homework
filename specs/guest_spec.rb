require('minitest/autorun')
require('minitest/rg')
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup()
    @guest = Guest.new("Eglantine Price")
  end

  def test_guest_has_name
    assert_equal("Eglantine Price", @guest.name)
  end

end
