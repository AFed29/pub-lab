class Customer

attr_reader(:name , :wallet, :drinks, :age, :drunkness, :food)

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @drinks = []
    @age = age
    @food = []
  end



  def remove_money(item)
    @wallet -= item.price()
  end

  def add_drink(drink)
     @drinks.push(drink)
  end

  def can_customer_afford_item(item)
    return @wallet >= item.price()
  end

  def is_customer_old_enough()
    return @age >= 18
  end

  def level_of_drunkness
    drunkness = 0
    rejuvenation = 0
    for drink in @drinks
      drunkness += drink.alcohol_level()
    end
    for food in @food
      rejuvenation += food.rejuvenation_level()
    end
    return (drunkness - rejuvenation).round(2)
  end

  def add_food(food)
    @food.push(food)
  end

end
