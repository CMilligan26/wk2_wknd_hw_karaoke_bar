require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Chris", 100, "Baby Come Back")
  end

  #CREATED

  def test_guest_is_created
    assert_equal(Guest, @guest.class)
  end

  #NAME

  def test_guest_has_name
    assert_equal("Chris", @guest.provide_name)
  end

  #WALLET

  def test_guest_has_wallet
    assert_equal(true, @guest.has_wallet)
  end

  def test_guest_can_afford_price__true
    assert_equal(true, @guest.can_afford(30))
  end

  def test_guest_can_afford_price__false
    assert_equal(false, @guest.can_afford(150))
  end

  def test_guest_can_spend_money__true
    assert_equal(true, @guest.spend_money(60))
  end

  def test_guest_can_spend_money__false
    assert_equal(false, @guest.spend_money(150))
  end

  #FAVOURITE SONG

  def test_guest_has_favourite_song
    assert_equal(true, @guest.has_favourite_song)
  end

  def test_guest_woops_at_favourite_song
    assert_equal("Woop! I love this song!", @guest.woop_at_favourite_song("Baby Come Back") )
  end

  def test_guest_reacts_to_other_songs
    assert_equal("I'm singing Baby Got Back!", @guest.woop_at_favourite_song("Baby Got Back") )
  end

end
