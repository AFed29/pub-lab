class Pub
  attr_reader(:name, :drinks, :till)

  def initialize(name, till, drinks = [])
    @name = name
    @till = till
    @drinks = drinks
  end

  def add_money_to_till(amount)
    @till += amount
  end

  def sell_drink(customer, drink)
    if customer.is_customer_old_enough()
      if customer.level_of_drunkness() < 10.0
        if customer.can_customer_afford_drink(drink)
          customer.remove_money(drink.price())
          add_money_to_till(drink.price())
          customer.add_drink(drink)
        end
      end
    end
  end

end
