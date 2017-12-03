require ("MiniTest/autorun")
require ("MiniTest/rg")
require_relative("../menu.rb")

class TestMenu < MiniTest::Test

  def setup
    @menu = Menu.new("Heineken", 5)
  end

  def test_get_item_name
    assert_equal("Heineken", @menu.item_name)
  end

  def test_get_item_price
    assert_equal(5, @menu.price)
  end
end
