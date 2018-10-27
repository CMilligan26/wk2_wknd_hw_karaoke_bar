class Room

  def initialize(name, karaoke_machine, bar, capacity)
    @name = name
    @karaoke_machine = karaoke_machine
    @bar = bar
    @capacity = capacity
    @current_guest_list = []
  end

  def provide_name
    @name
  end

  def show_karaoke_machine
    @karaoke_machine
  end

  def show_bar
    @bar
  end

  def give_capacity
    @capacity
  end

  def has_current_guest_list
    !@current_guest_list.nil?
  end

  def enter_guest(guest)
    return false if @current_guest_list.length >= give_capacity
    # return false if @current_guest_list.include?(guest) == true
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
