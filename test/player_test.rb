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
    assert_instance_of Deck, @player.deck
  end

  def test_it_has_lost
    refute @player.has_lost?
  end

  def test_has_lost_returns_true_when_no_cards_remain
    @player.deck.remove_card
    refute @player.has_lost?
    @player.deck.remove_card
    refute @player.has_lost?
    @player.deck.remove_card

    assert @player.has_lost?
  end
end














# player.deck
# #=> #<Deck:0x007f9cc396bdf8 @cards=[]>
