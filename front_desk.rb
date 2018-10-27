class FrontDesk

  def initialize
    @staff_member = "Zoe"
    @entry_fee = 50
    @total_cash = 0
    @guests_checked_in = []
    @guests_checked_out = []
  end

  def provide_staff_member_name
    @staff_member
  end

  def provide_entry_fee
    @entry_fee
  end

  def has_total_cash
    !@total_cash.nil?
  end

  def provide_total_cash
    @total_cash
  end

  def accept_cash(cash)
    starting_total_cash = @total_cash.clone
    @total_cash += cash
    @total_cash > starting_total_cash
  end

  def has_guests_checked_in
    !@guests_checked_in.nil?
  end

  def check_in_guest(guest)
    starting_guests_checked_in = @guests_checked_in.length
    @guests_checked_in << guest
    @guests_checked_in.length > starting_guests_checked_in
  end

  def has_guests_checked_out
    !@guests_checked_out.nil?
  end

  def remove_from_checked_in_list(guest)
    starting_guests_checked_in = @guests_checked_in.length
    @guests_checked_in.delete(guest)
    @guests_checked_in.length < starting_guests_checked_in
  end

  def add_to_checked_out_list(guest)
    starting_guests_checked_out = @guests_checked_out.length
    @guests_checked_out << guest
    @guests_checked_out.length > starting_guests_checked_out
  end

  def check_out_guest(guest)
    remove_from_checked_in_list(guest)
    add_to_checked_out_list(guest)
    return "Guest Checked Out"
  end

end
