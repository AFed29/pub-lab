require('minitest/autorun')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class PubTest < MiniTest::Test

  def setup
    @beer = Drink.new("Innis & Gunn", 4.25)
    @gin_and_tonic = Drink.new("Sipsmith and Fevertree", 6.85)
    @whisky = Drink.new("Laphroig", 3.70)

    drinks = [@beer, @gin_and_tonic, @whisky]

    @pub = Pub.new("The Black Bull", 200.00, drinks)

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

  def test_pub_selling_drink__can_afford
    customer = Customer.new("Dan", 10.00)
    @pub.sell_drink(customer, @beer)
    assert_equal(5.75, customer.wallet())
    assert_equal(204.25, @pub.till())
    assert_equal(1, customer.drinks().count())
  end

  def test_pub_selling_drink__cannot_afford
    customer = Customer.new("Amy", 5.00)
    @pub.sell_drink(customer, @gin_and_tonic)
    assert_equal(5.00, customer.wallet())
    assert_equal(200.00, @pub.till())
    assert_equal(0, customer.drinks().count())
  end
end
