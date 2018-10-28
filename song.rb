class Song

  def initialize(artist, song_title)
    @artist = artist
    @song_title = song_title
  end

  def provide_artist
    @artist
  end

  def provide_song_title
    @song_title
  end

end
