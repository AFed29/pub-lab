require("minitest/autorun")
require_relative("../customer")
require_relative("../drink")
require_relative("../food")

class CustomerTest < MiniTest::Test

  def setup()
    @customer1 = Customer.new("Alex", 100.00, 26)
    @customer2 = Customer.new("David" , 50.00, 36)

    @beer = Drink.new("Deuchars IPA", 3.65, 2.1)

    @chips = Food.new("Chunky Chips", 3.50, 0.7)
  end

  def test_check_name_of_customer__1
    assert_equal("Alex", @customer1.name())
  end

  def test_check_name_of_customer__2
    assert_equal("David", @customer2.name())
  end


  def test_check_drinks_empty
    assert_equal(0, @customer1.drinks().count())
  end

  def test_remove_money_from_customer
    @customer1.remove_money(5.5)
    assert_equal(94.5, @customer1.wallet())
  end

  def test_add_drink_to_customer
    @customer1.add_drink(@beer)
    assert_equal(1, @customer1.drinks().count())
  end

  def test_can_customer_afford_drink__cannot_afford
    customer = Customer.new("Bert", 3.00, 21)
    result = customer.can_customer_afford_drink(@beer)
    assert_equal(false, result)
  end

  def test_can_customer_afford_drink__can_afford
    result = @customer1.can_customer_afford_drink(@beer)
    assert_equal(true, result)
  end

  def test_check_customer_age
    assert_equal(26, @customer1.age())
  end

  def test_is_customer_18_or_older__yes
    result = @customer1.is_customer_old_enough()
    assert_equal(true, result)
  end

  def test_is_customer_18_or_older__no
    customer = Customer.new("Peter", 1000.00, 13)
    result = customer.is_customer_old_enough()
    assert_equal(false, result)
  end

  def test_add_alcohol_level_to_drunkness
    @customer1.add_drink(@beer)
    assert_equal(2.1, @customer1.level_of_drunkness())
  end

  def test_add_food_to_customer
    @customer1.add_food(@chips)
    assert_equal(1, @customer1.food().count())
  end

  def test_food_rejuvenation
    @customer1.add_drink(@beer)
    @customer1.add_food(@chips)
    assert_equal(1.4, @customer1.level_of_drunkness())
  end
end
