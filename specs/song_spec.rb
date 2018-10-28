require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("Player", "Baby Come Back")
  end

  #CREATED

  def test_song_is_created
    assert_equal(Song, @song.class)
  end

  #ARTIST

  def test_song_can_provide_artist
    assert_equal("Player", @song.provide_artist)
  end

  #SONG TITLE

  def test_song_can_provide_song_title
    assert_equal("Baby Come Back", @song.provide_song_title)
  end

end
