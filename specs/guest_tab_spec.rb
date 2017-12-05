require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../guest_tab.rb")


class TestGuestTab < MiniTest::Test

  def setup
    @guest_tab = GuestTab.new("James Brown", 5)
  end

  def test_get_guest_name
    assert_equal("James Brown", @guest_tab.guest_name)
  end

  def test_get_guest_tab_balance
    assert_equal(5, @guest_tab.balance)
  end

  def test_increment_balance
    @guest_tab.increment_balance(6)
    assert_equal(11, @guest_tab.balance)
  end

end
