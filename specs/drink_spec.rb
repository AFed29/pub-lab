require('minitest/autorun')
require_relative('../drink')

class DrinkTest < MiniTest::Test
  def setup
    @beer = Drink.new("Guinness", 3.85, 2.4)
    @rum_and_coke = Drink.new("Cuba Libre", 4.50, 1.5)
    @whisky = Drink.new("Oban", 4.75, 1.2)
  end

  def test_check_name_of_drink__beer
    assert_equal("Guinness", @beer.name())
  end

  def test_check_name_of_drink__rum_and_coke
    assert_equal("Cuba Libre", @rum_and_coke.name())
  end

  def test_check_name_of_drink__whisky
    assert_equal("Oban", @whisky.name())
  end

  def test_check_price_of_drink__beer
    assert_equal(3.85, @beer.price())
  end

  def test_check_price_of_drink__rum_and_coke
    assert_equal(4.50, @rum_and_coke.price())
  end

  def test_check_price_of_drink__whisky
    assert_equal(4.75, @whisky.price())
  end


end
