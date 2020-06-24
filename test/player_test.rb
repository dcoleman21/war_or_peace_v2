require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  def test_it_has_readable_attributes
    assert_instance_of Player, @player
    assert_equal 'Clarisa', @player.name
    assert_equal @deck, @player.deck
    # lets add an assert_instance_of here:
    # assert_instance_of Deck, @player.deck
  end

  def test_it_has_lost
    # instead of assert_equal false...
    # use `refute`
    assert_equal false, @player.has_lost?
  end

  def test_has_lost_can_return_true
    assert_equal @deck, @player.deck # we know this is a deck, no need to assert it again
    @player.deck.remove_card(@card1)
    assert_equal false, @player.has_lost?
    @player.deck.remove_card(@card2)
    assert_equal false, @player.has_lost?
    @player.deck.remove_card(@card3)
    assert_equal true, @player.has_lost?
    assert_equal @deck, @player.deck  # we know this is a deck, no need to assert it again
  end
end














# player.deck
# #=> #<Deck:0x007f9cc396bdf8 @cards=[]>
