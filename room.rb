class Room

  def initialize(karaoke_machine, bar, capacity)
    @karaoke_machine = karaoke_machine
    @bar = bar
    @capacity = capacity
    @current_guest_list = []
  end

  def show_karaoke_machine
    @karaoke_machine
  end

  def has_bar
    !@bar.nil?
  end

  def give_capacity
    @capacity
  end

  def has_current_guest_list
    !@current_guest_list.nil?
  end

  def enter_guest(guest)
    return false if @current_guest_list.length >= give_capacity
    starting_current_guest_list = @current_guest_list.length
    @current_guest_list << guest
    @current_guest_list.length > starting_current_guest_list
  end

  def remove_guest(guest)
    return false if @current_guest_list.length <= 0
    starting_current_guest_list = @current_guest_list.length
    @current_guest_list.delete(guest)
    @current_guest_list.length < starting_current_guest_list
  end

end
