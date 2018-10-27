class Guest

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def provide_name
    @name
  end

  def has_wallet
    !@wallet.nil?
  end

  def how_much_in_wallet
    @wallet
  end

  def can_afford(price)
    @wallet >= price
  end

  def spend_money(price)
    return false if can_afford(price) == false
    @wallet -= price
    return true
  end

  def has_favourite_song
    !@favourite_song.nil?
  end

  def woop_at_favourite_song(song)
    return "Woop! I love this song!" if @favourite_song == song
    "I'm singing #{song}! I'm having fun!"
  end

end
