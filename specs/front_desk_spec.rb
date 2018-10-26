require('minitest/autorun')
require('minitest/rg')
require_relative('../front_desk')

class GuestTest < MiniTest::Test

  def setup
    @front_desk = FrontDesk.new
  end

  #CREATED

  def test_front_desk_is_created
    assert_equal(FrontDesk, @front_desk.class)
  end

  #STAFF MEMBER

  def test_front_desk_has_staff_member
    assert_equal("Zoe", @front_desk.provide_staff_member_name)
  end

  #ENTRY FEE

  def test_front_desk_has_entry_fee
    assert_equal(50, @front_desk.provide_entry_fee)
  end

  #TOTAL_CASH

  def test_front_desk_has_total_cash
    assert_equal(true, @front_desk.has_total_cash)
  end

  def test_front_desk_total_cash_can_accept_cash
    assert_equal(true, @front_desk.accept_cash(50))
  end

  #GUESTS CHECKED IN LIST

  def test_front_desk_has_guests_checked_in
    assert_equal(true, @front_desk.has_guests_checked_in)
  end

  def test_front_desk_check_guest_in
    assert_equal(true, @front_desk.check_in_guest("Test Guest"))
  end

  #GUESTS CHECKED OUT LIST

  def test_front_desk_has_guests_checked_out
    assert_equal(true, @front_desk.has_guests_checked_out)
  end

  def test_front_desk_check_out_guest
    @front_desk.check_in_guest("Test Guest")
    assert_equal(true, @front_desk.remove_from_checked_in_list("Test Guest"))
    assert_equal(true, @front_desk.add_to_checked_out_list("Test Guest"))
    assert_equal("Guest Checked Out", @front_desk.check_out_guest("Test Guest"))
  end

end
