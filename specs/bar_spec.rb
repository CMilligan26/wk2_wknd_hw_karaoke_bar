require('minitest/autorun')
require('minitest/rg')
require_relative('../bar')
require_relative('../drink')

class BarTest < MiniTest::Test

  def setup
    drink_1 = Drink.new("Coke", 1)
    drink_2 = Drink.new("Red Bull", 2)
    @bar = Bar.new([drink_1, drink_2])
  end

  #CREATED

  def test_bar_is_created
    assert_equal(Bar, @bar.class)
  end

  #STAFF MEMBER

  def test_bar_has_staff_member
    assert_equal("Tony", @bar.provide_staff_member_name)
  end

  #TOTAL_CASH

  def test_bar_has_total_cash
    assert_equal(true, @bar.has_total_cash)
  end

  def test_bar_total_cash_can_accept_cash
    assert_equal(true, @bar.accept_cash(50))
  end

  #DRINKS LIST

  def test_bar_display_drinks_list
    assert_equal("Coke: £1, Red Bull: £2", @bar.display_drinks_list)
  end

  def test_provide_drink_from_drinks_list
    assert_equal(true, @bar.provide_drink("Coke"))
  end

  def test_bar_can_provide_drink_price
    assert_equal(1, @bar.provide_drink_price("Coke"))
  end

end
