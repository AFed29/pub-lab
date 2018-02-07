require("minitest/autorun")
require_relative("../food")

class FoodTest < MiniTest::Test
  def setup
    @pie = Food.new("Steak and Ale Pie", 7.50, 1.8)
  end

  def test_check_food_name
    assert_equal("Steak and Ale Pie", @pie.name())
  end

  def test_check_food_price
    assert_equal(7.50, @pie.price())
  end

  def test_check_food_rejuvenation_level
    assert_equal(1.8, @pie.rejuvenation_level())
  end

end
