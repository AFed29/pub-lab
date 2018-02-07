require('minitest/autorun')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food')

class PubTest < MiniTest::Test

  def setup
    @beer = Drink.new("Innis & Gunn", 4.25, 2.3)
    @gin_and_tonic = Drink.new("Sipsmith and Fevertree", 6.85, 1.8)
    @whisky = Drink.new("Laphroig", 3.70, 1.2)

    drinks = [@beer, @gin_and_tonic, @whisky]

    @pasta = Food.new("Carbonara", 9.00, 2.5)
    @steak = Food.new("Rib Eye", 14.00, 1.8)
    @stew = Food.new("Lamb Hot Pot", 6.50, 2.0)

    food = [@pasta, @steak, @stew]

    @pub = Pub.new("The Black Bull", 200.00, drinks, food)

    @customer1 = Customer.new("Bob", 50.00, 21)
  end

  def test_check_pub_name
    assert_equal("The Black Bull", @pub.name())
  end

  def test_check_initial_till
    assert_equal(200.00, @pub.till())
  end

  def test_check_initial_number_of_drinks
    assert_equal(3, @pub.drinks().count())
  end

  def test_add_money_to_till
    @pub.add_money_to_till(5.50)
    assert_equal(205.50, @pub.till())
  end

  def test_find_drink_on_menu
    assert_equal(@beer, @pub.find_drink_on_menu("Innis & Gunn"))
  end

  def test_pub_selling_drink__can_afford
    @pub.sell_drink(@customer1, "Innis & Gunn")
    assert_equal(45.75, @customer1.wallet())
    assert_equal(204.25, @pub.till())
    assert_equal(1, @customer1.drinks().count())
  end

  def test_pub_selling_drink__cannot_afford
    customer = Customer.new("Amy", 5.00, 21)
    @pub.sell_drink(customer, "Sipsmith and Fevertree")
    assert_equal(5.00, customer.wallet())
    assert_equal(200.00, @pub.till())
    assert_equal(0, customer.drinks().count())
  end

  def test_pub_selling_drink__is_old_enough
    @pub.sell_drink(@customer1, "Sipsmith and Fevertree")
    assert_equal(43.15, @customer1.wallet())
    assert_equal(206.85, @pub.till())
    assert_equal(1, @customer1.drinks().count())
  end

  def test_pub_selling_drink__is_too_young
    customer = Customer.new("Natty", 50.00, 17)
    @pub.sell_drink(customer, "Sipsmith and Fevertree")
    assert_equal(50.00, customer.wallet())
    assert_equal(200.00, @pub.till())
    assert_equal(0, customer.drinks().count())
  end

  def test_pub_selling_drink__is_not_drunk
    @pub.sell_drink(@customer1, "Innis & Gunn")
    @pub.sell_drink(@customer1, "Innis & Gunn")
    @pub.sell_drink(@customer1, "Innis & Gunn")
    @pub.sell_drink(@customer1, "Innis & Gunn")
    assert_equal(33.00, @customer1.wallet())
    assert_equal(217.00, @pub.till())
    assert_equal(4, @customer1.drinks().count())
  end

  def test_pub_selling_drink__is_too_drunk
    @pub.sell_drink(@customer1, "Innis & Gunn")
    @pub.sell_drink(@customer1, "Innis & Gunn")
    @pub.sell_drink(@customer1, "Innis & Gunn")
    @pub.sell_drink(@customer1, "Innis & Gunn")
    @pub.sell_drink(@customer1, "Innis & Gunn")
    @pub.sell_drink(@customer1, "Innis & Gunn")
    assert_equal(28.75, @customer1.wallet())
    assert_equal(221.25, @pub.till())
    assert_equal(5, @customer1.drinks().count())
  end

  def test_sell_food__can_afford
    @pub.sell_food(@customer1, @steak)
    assert_equal(36.00, @customer1.wallet())
    assert_equal(214.00, @pub.till())
    assert_equal(1, @customer1.food().count())
  end

end
