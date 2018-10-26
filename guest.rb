class Guest

  def initialize(name, favourite_song)
    @name = name
    @wallet = 100
    @favourite_song = favourite_song
  end

  def provide_name
    @name
  end

  def has_wallet
    !@wallet.nil?
  end

  def can_afford(price)
    @wallet > price
  end

  def spend_money(price)
    return 0 if can_afford(price) == false
    @wallet -= price
    return price
  end

  def has_favourite_song
    !@favourite_song.nil?
  end

  def woop_at_favourite_song(song)
    return "Woop! I love this song!" if @favourite_song == song
    "I'm singing #{song}!"
  end

end
