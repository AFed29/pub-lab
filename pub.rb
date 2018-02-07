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
  

end
