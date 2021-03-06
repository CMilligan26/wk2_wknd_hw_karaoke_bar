require_relative('viewer')
require_relative('guest')
require_relative('front_desk')
require_relative('song')
require_relative('karaoke_machine')
require_relative('drink')
require_relative('bar')
require_relative('room')

#Initialise simulation
terminal_print = Viewer.new
terminal_front_desk = FrontDesk.new
terminal_song_1 = Song.new("Rick Astley", "Never Gonna Give You Up")
terminal_song_2 = Song.new("Foreigner", "I Want To Know What Love Is")
terminal_song_3 = Song.new("Toto", "Africa")
terminal_song_4 = Song.new("Boy Meets Girl", "Waiting For A Star To Fall")
terminal_karaoke_machine_1 = KaraokeMachine.new([terminal_song_1, terminal_song_2])
terminal_karaoke_machine_2 = KaraokeMachine.new([terminal_song_3, terminal_song_4])
terminal_drink_1 = Drink.new("Coke", 1)
terminal_drink_2 = Drink.new("Red Bull", 2)
terminal_drink_3 = Drink.new("Beer", 5)
terminal_drink_4 = Drink.new("Wine", 6)
terminal_bar_1 = Bar.new([terminal_drink_1, terminal_drink_2])
terminal_bar_2 = Bar.new([terminal_drink_3, terminal_drink_4])
terminal_room_1 = Room.new("Room 1", terminal_karaoke_machine_1, terminal_bar_1, 3)
terminal_room_2 = Room.new("Room 2", terminal_karaoke_machine_2, terminal_bar_2, 3)
rooms = [terminal_room_1, terminal_room_2]



#Ask for Guests details
guest_wallet = terminal_print.ask_how_much_money_the_guest_has
guest_name = terminal_print.ask_for_guests_name(terminal_front_desk.provide_staff_member_name)
guest_favourite_song = terminal_print.ask_for_guests_favorite_song(guest_name)

terminal_guest = Guest.new(guest_name, guest_wallet, guest_favourite_song)

#Respond to favourite song
room_that_has_song = nil
rooms.each { | room |
  room_that_has_song = room if room.show_karaoke_machine.provide_song(guest_favourite_song) == true
}

if room_that_has_song == nil
  terminal_print.do_we_have_that_song(false)
else
  terminal_print.do_we_have_that_song(true)
end

#Transaction
if terminal_guest.can_afford(terminal_print.give_rate_for_room(terminal_front_desk.provide_entry_fee)) == true
  terminal_print.you_can_afford_this
else
  terminal_print.you_cannot_afford_this
end

terminal_front_desk.accept_cash(terminal_front_desk.provide_entry_fee)
terminal_guest.spend_money(terminal_front_desk.provide_entry_fee)
terminal_front_desk.check_in_guest(terminal_guest.provide_name)

# Go to room
go_to_room = false

while go_to_room == false do
  if room_that_has_song == nil
    rooms.each { | room |
      if room.enter_guest(terminal_guest) == true
        room_that_has_song = room
      end
    }
    if room_that_has_song == nil
      terminal_print.all_rooms_full
    else
      terminal_print.go_to_room(room_that_has_song.provide_name, terminal_front_desk.provide_staff_member_name)
      go_to_room = true
    end
  elsif room_that_has_song != nil
    if room_that_has_song.enter_guest(terminal_guest) == false
      room_that_has_song == nil
    else
      terminal_print.go_to_room(room_that_has_song.provide_name, terminal_front_desk.provide_staff_member_name)
      go_to_room = true
    end
  end
end

#Inside room, go to bar
terminal_print.go_to_bar(room_that_has_song.show_bar.provide_staff_member_name)
puts room_that_has_song.show_bar.display_drinks_list

drink_ordered = terminal_print.which_drink
if room_that_has_song.show_bar.provide_drink(drink_ordered) == true
  if terminal_guest.spend_money(room_that_has_song.show_bar.provide_drink_price(drink_ordered)) == false
    terminal_print.cannot_afford_drink
  else
    room_that_has_song.show_bar.accept_cash(room_that_has_song.show_bar.provide_drink_price(drink_ordered))
    terminal_print.serve_drink(drink_ordered)
  end
else
  terminal_print.order_drink_that_does_not_exist
end

#Inside room, go to karaoke machine
terminal_print.go_to_karaoke_machine
puts room_that_has_song.show_karaoke_machine.display_song_list

use_karaoke_machine = false

while use_karaoke_machine == false do
  song_chosen = terminal_print.which_song
  if room_that_has_song.show_karaoke_machine.provide_song(song_chosen) == true
    puts terminal_guest.woop_at_favourite_song(song_chosen)
    use_karaoke_machine = true
  else
    terminal_print.choose_song_that_does_not_exist
  end
end

#Leave Room
terminal_print.leave_room(terminal_guest.provide_name, terminal_front_desk.provide_staff_member_name)
room_that_has_song.remove_guest(terminal_guest)

#Check Out
terminal_print.check_out
terminal_front_desk.check_out_guest(terminal_guest)

#Leave
terminal_print.goodbye(terminal_guest.how_much_in_wallet)

#FRONT DESK TALLYS UP THE MONEY TAKEN FROM THE GUEST
terminal_print.tally_up(terminal_front_desk.provide_staff_member_name, room_that_has_song.show_bar.provide_staff_member_name, terminal_guest.provide_name, terminal_front_desk.provide_total_cash, room_that_has_song.show_bar.provide_total_cash)
