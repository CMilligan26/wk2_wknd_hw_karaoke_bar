class Bar

  def initialize(drinks)
    @staff_member = "Tony"
    @total_cash = 0
    @drinks_list = drinks
  end

  def provide_staff_member_name
    @staff_member
  end

  def has_total_cash
    !@total_cash.nil?
  end

  def display_drinks_list
    @drinks_list.reduce("") { | list, drink |
      list + drink.provide_name + ": " + drink.provide_price.to_s + ", "
    }.slice!(0..-3)
  end

  def provide_drink(drink_to_provide)
    @drinks_list.each do | drink |
      return true if drink_to_provide == drink.provide_name
    end
  end

  def accept_cash(cash)
    starting_total_cash = @total_cash.clone
    @total_cash += cash
    @total_cash > starting_total_cash
  end

end
