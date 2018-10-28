require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_machine')
require_relative('../song')

class KaraokeMachineTest < MiniTest::Test

  def setup
    @song_1 = Song.new("Player", "Baby Come Back")
    @song_2 = Song.new("Supertramp", "The Logical Song")
    @karaoke_machine = KaraokeMachine.new([@song_1, @song_2])
  end

  #CREATED

  def test_karaoke_machine_is_created
    assert_equal(KaraokeMachine, @karaoke_machine.class)
  end

  #SONG LIST

  def test_karaoke_machine_display_song_list
    assert_equal("Songs: Player - Baby Come Back, Supertramp - The Logical Song", @karaoke_machine.display_song_list)
  end

  def test_provide_song_from_song_list
    assert_equal(true, @karaoke_machine.provide_song("Baby Come Back"))
  end

end
