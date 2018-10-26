require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../karaoke_machine')
require_relative('../bar')
require_relative('../drink')

class RoomTest < MiniTest::Test

  def setup
    @karaoke_machine = KaraokeMachine.new(["Not Too Soon", "Kissability"])
    drink_1 = Drink.new("Coke", 1)
    drink_2 = Drink.new("Red Bull", 2)
    bar = Bar.new([drink_1, drink_2])
    @room = Room.new(@karaoke_machine, bar, 2)
  end

  #CREATED

  def test_room_is_created
    assert_equal(Room, @room.class)
  end

  #KARAOKE MACHINE
  def test_room_can_show_karaoke_machine
    assert_equal(@karaoke_machine, @room.show_karaoke_machine)
  end

  #BAR
  def test_room_has_bar
    assert_equal(true, @room.has_bar)
  end

  #CAPACITY
  def test_room_give_capacity
    assert_equal(2, @room.give_capacity)
  end

  #GUESTS IN ROOM
  def test_room_has_guests_in_room_list
    assert_equal(true, @room.has_current_guest_list)
  end

  def test_room_add_to_guests_in_room_list
    assert_equal(true, @room.enter_guest("Test Guest"))
  end

  def test_room_add_to_guests_in_room_list__full_capacity
    @room.enter_guest("Test Guest")
    @room.enter_guest("Test Guest")
    assert_equal(false, @room.enter_guest("Test Guest"))
  end

  def test_room_remove_from_guests_in_room_list
    @room.enter_guest("Test Guest")
    assert_equal(true, @room.remove_guest("Test Guest"))
  end

  def test_room_remove_from_guests_in_room_list__empty_room
    assert_equal(false, @room.remove_guest("Test Guest"))
  end


end
