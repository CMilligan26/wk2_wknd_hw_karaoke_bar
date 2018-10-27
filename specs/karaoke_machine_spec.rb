require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_machine')

class KaraokeMachineTest < MiniTest::Test

  def setup
    @karaoke_machine = KaraokeMachine.new(["Song 1", "Song 2"])
  end

  #CREATED

  def test_karaoke_machine_is_created
    assert_equal(KaraokeMachine, @karaoke_machine.class)
  end

  #SONG LIST

  def test_karaoke_machine_display_song_list
    assert_equal("Songs: Song 1, Song 2", @karaoke_machine.display_song_list)
  end

  def test_provide_song_from_song_list
    assert_equal(true, @karaoke_machine.provide_song("Song 1"))
  end

end
