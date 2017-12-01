require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Jimmy Choo")
  end

  def test_get_guest_name
    assert_equal("Jimmy Choo", @guest.name)
  end

end
