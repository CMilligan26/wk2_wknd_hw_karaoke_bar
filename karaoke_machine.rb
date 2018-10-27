class KaraokeMachine

  def initialize(song_list)
    @song_list = song_list
  end

  def display_song_list
    @song_list.reduce("Songs: ") { | list, song |
      list + song + ", "
    }.slice!(0..-3)
  end

  def provide_song(song)
    @song_list.include?(song)
  end

end
