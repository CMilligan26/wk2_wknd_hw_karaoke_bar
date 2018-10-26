require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("Test on the Beach", 5)
  end

  #CREATED

  def test_drink_is_created
    assert_equal(Drink, @drink.class)
  end

  #NAME

  def test_drink_has_name
    assert_equal("Test on the Beach", @drink.provide_name)
  end

  #PRICE

  def test_drink_has_price
    assert_equal(5, @drink.provide_price)
  end

end
