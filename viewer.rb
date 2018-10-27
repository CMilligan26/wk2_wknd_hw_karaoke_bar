class Viewer

  #SET UP GUEST

  def ask_how_much_money_the_guest_has
    puts "How much money do you have in your wallet?"
    return gets.chomp.to_i
  end

  def ask_for_guests_name (staff_member_name)
    puts "Welcome to Karaoke Bar, i'm #{staff_member_name}!"
    puts "Can I take your name please?"
    return gets.chomp
  end

  def ask_for_guests_favorite_song(name)
    puts "Hi #{name}! What is your favourite song?"
    return gets.chomp
  end

  def do_we_have_that_song(true_or_false)
    return puts "Sorry, we don't have that song!" if true_or_false == false
    puts "We have that song! We'll try and get you into a room with that song."
  end

  #INTERACT WITH FRONT DESK

  def give_rate_for_room(price)
    puts "So, if you would like to join a room for karaoke the price is £#{price} for an hour, is that ok?"
    return price
  end

  def you_cannot_afford_this
    puts "**Sorry, you can't afford this, you leave the Karaoke Bar sad and alone.**"
    exit
  end

  def you_can_afford_this
    puts "**You hand over the money from your wallet.**"
    puts "Thank you, I'm just going to check you in, just a moment please..."
  end

  def all_rooms_full
    puts "Sorry, all the rooms are full! Please come back later."
    exit
  end

  def go_to_room(room_name, staff_member_name)
    puts "Great, all check in! You'll be going to #{room_name}, please follow me."
    puts "**You follow #{staff_member_name} to the room and go inside.**"
  end

  #INTERACT WITH ROOM
  #BAR

  def go_to_bar(bar_staff_member_name)
    puts "Once inside you see a karaoke machine and a bar."
    puts "You decide to head to the bar."
    puts "Hi there, I'm #{bar_staff_member_name}, here's what we have on offer today."
  end

  def which_drink
    puts "Which drink would you like?"
    return gets.chomp
  end

  def cannot_afford_drink
    puts "**You see from your wallet that you actually can't afford this drink, you decide to ask for a water and hit the karaoke.**"
  end

  def serve_drink(drink)
    puts "**You hand over the money**"
    puts "Here you go."
    puts "**You pick up your #{drink} and head to the karaoke machine.**"
  end

  def order_drink_that_does_not_exist
    puts "erm... we don't serve that i'm afraid."
    puts "**Amazed that they don't serve that drink, you ask for a water instead and head to the karaoke machine.**"
  end

  #KARAOKE MACHINE

  def go_to_karaoke_machine
    puts "**You head to the karaoke machine and look at the songs available.**"
  end

  def which_song
    puts "Which song would you like?"
    return gets.chomp
  end

  def choose_song_that_does_not_exist
    puts "**You wish they had that song, but they don't, so you decide to choose a song they actually have.**"
  end

  #LEAVE ROOM

  def leave_room(player_name, front_desk_staff_member_name)
    puts "**You spend an hour singing karaoke and before you know, it's time to leave**"
    puts "Hi #{player_name}, I hope you had fun! Your hour is up i'm afraid."
    puts "**You follow #{front_desk_staff_member_name} to the front of the bar**"
  end

  #CHECK OUT
  def check_out
    puts "We hope you enjoyed your time today! I'm just going to check you out..."
  end

  #GOODBYE

  def goodbye (guest_money)
    puts "All done! We hope you come back again soon!"
    puts "**You leave the bar, your karaoke needs met, and you have £#{guest_money} left!**"
  end

end
