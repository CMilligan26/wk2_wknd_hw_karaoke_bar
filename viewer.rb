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
  puts "We have that song! We'll try and get you into a room with that song"
end

#INTERACT WITH FRONT DESK

def give_rate_for_room(price)
  puts "So, if you would like to join a room for karaoke the price is £#{price} for an hour, is that ok?"
  return price
end

def you_cannot_afford_this
  puts "**Sorry, you can't afford this, you leave the Karaoke Bar sad and alone**"
  exit
end

def you_can_afford_this
  puts "**You hand over the money from your wallet**"
end
end
