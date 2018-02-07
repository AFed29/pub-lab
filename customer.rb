class Customer

attr_reader :name , :wallet, :drinks

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @drinks = []
  end



  def remove_money(amount)
    @wallet -= amount
  end

  def add_drink(drink)
    return @drinks.push(drink)

  end
end
