require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../karaoke_machine')
require_relative('../bar')
require_relative('../drink')

class RoomTest < MiniTest::Test

  def setup
    karaoke_machine = KaraokeMachine.new(["Not Too Soon", "Kissability"])
    drink_1 = Drink.new("Coke", 1)
    drink_2 = Drink.new("Red Bull", 2)
    bar = Bar.new([drink_1, drink_2])
    @room = Room.new(karaoke_machine, bar)
  end

  #CREATED

  def test_room_is_created
    assert_equal(Room, @room.class)
  end

end
