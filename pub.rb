class Pub
  attr_reader(:name, :drinks, :till)

  def initialize(name, till, drinks = [], food = [])
    @name = name
    @till = till
    @drinks = drinks
    @food = food
  end

  def add_money_to_till(item)
    @till += item.price()
  end

  def find_drink_on_menu(drink_name)
    for drink in @drinks
      return drink if drink.name() == drink_name
    end
    return nil
  end

  def find_food_on_menu(food_name)
    for food in @food
      return food if food.name() == food_name
    end
    return nil
  end

  def sell_drink(customer, drink_name)
    drink = find_drink_on_menu(drink_name)
    if drink
      if customer.is_customer_old_enough()
        if customer.level_of_drunkness() < 10.0
          if customer.can_customer_afford_item(drink)
            customer.remove_money(drink)
            add_money_to_till(drink)
            customer.add_drink(drink)
          end
        end
      end
    end
  end

  def sell_food(customer, food_name)
    food = find_food_on_menu(food_name)
    if food
      if customer.can_customer_afford_item(food)
        customer.remove_money(food)
        add_money_to_till(food)
        customer.add_food(food)
      end
    end
  end

  end
