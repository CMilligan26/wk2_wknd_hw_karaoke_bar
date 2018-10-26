require_relative('viewer')
require_relative('guest')
require_relative('front_desk')
require_relative('karaoke_machine')
require_relative('drink')
require_relative('bar')
require_relative('room')

#Initialise simulation
terminal_print = Viewer.new
terminal_front_desk = FrontDesk.new
terminal_karaoke_machine = KaraokeMachine.new(["Baby Come Back", "Baby Got Back"])
terminal_drink_1 = Drink.new("Coke", 1)
terminal_drink_2 = Drink.new("Red Bull", 2)
terminal_drink_3 = Drink.new("Beer", 5)
terminal_drink_4 = Drink.new("Wine", 6)
terminal_bar = Bar.new([terminal_drink_1, terminal_drink_2, terminal_drink_3, terminal_drink_4])
terminal_room = Room.new(terminal_karaoke_machine, terminal_bar, 3)
rooms = [terminal_room]



#Ask for Guests details

guest_wallet = terminal_print.ask_how_much_money_the_guest_has
guest_name = terminal_print.ask_for_guests_name(terminal_front_desk.provide_staff_member_name)
guest_favourite_song = terminal_print.ask_for_guests_favorite_song(guest_name)

terminal_guest = Guest.new(guest_name, guest_wallet, guest_favourite_song)
#Respond to favourite song

room_that_has_song = false
rooms.each { | room |
  room_that_has_song = room if room.show_karaoke_machine.provide_song(guest_favourite_song) == true
}

if room_that_has_song == false
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

#Checked and go to room
