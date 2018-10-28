class KaraokeMachine

  def initialize(song_list)
    @song_list = song_list
  end

  def display_song_list
    @song_list.reduce("Songs: ") { | list, song |
      list + song.provide_artist + " - " + song.provide_song_title + ", "
    }.slice!(0..-3)
  end

  def provide_song(song_to_provide)
    @song_list.each{ | song | return true if song.provide_song_title == song_to_provide}
    return false
  end

end
