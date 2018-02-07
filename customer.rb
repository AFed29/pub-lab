class Customer

attr_reader :name , :wallet, :drinks, :age, :drunkness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @drinks = []
    @age = age
  end



  def remove_money(amount)
    @wallet -= amount
  end

  def add_drink(drink)
     @drinks.push(drink)
  end

  def can_customer_afford_drink(drink)
    return @wallet >= drink.price()
  end

  def is_customer_old_enough()
    return @age >= 18
  end

  def level_of_drunkness
    drunkness = 0 
    for drink in @drinks
      drunkness += drink.alcohol_level()
    end
    return drunkness
  end
end
