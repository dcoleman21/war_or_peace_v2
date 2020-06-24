require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class TurnTest < Minitest::Test

  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists_with_player_attributes
    assert_instance_of Turn, @turn
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_it_exists_with_deck_attributes  
    # all of these `deck1.cards` methods reference the deck class, 
    # which you've already tested well. So, no need to test so rigerously. 
    # I'm deleting them, and moving the tests so they don't reference
    # spoils of war
    
    assert_instance_of Deck, @deck1
    assert_equal 4, @turn.deck1.cards, @card1
  end
  
  def test_spoils_of_war_starts_as_empty_array
    assert_equal [], @turn.spoils_of_war
  end

  def test_basic_turn_type
    assert_equal :basic, @turn.type
  end
  
  def test_war_turn_type
    # figure out your "war type" setup
    assert_equal :war, @turn.type
  end
  
  def test_mad_turn_type
    # figure out your "mad type" setup
    assert_equal :mad, @turn.type
  end

  def test_basic_winner
    assert_equal @player1, @turn.winner
  end

  def test_pile_cards_into_spoils_pile_basic
    assert_equal [], @turn.spoils_of_war
    @turn.pile_cards
    assert_equal 2, @turn.spoils_of_war.count
    assert_includes @turn.deck1.cards, @card1
    assert_includes @turn.deck2.cards, @card3
  end

end
