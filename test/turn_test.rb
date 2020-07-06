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
    assert_instance_of Deck, @deck1
    assert_equal 4, @turn.player1.deck.cards.count

    assert_instance_of Deck, @deck2
    assert_equal 4, @turn.player2.deck.cards.count
  end

  def test_spoils_of_war_starts_as_empty_array
    assert_equal [], @turn.spoils_of_war
  end

  def test_basic_turn_type_if_top_cards_are_different_in_rank
    assert_equal :basic, @turn.type
  end

  def test_who_is_the_winner_of_the_basic_turn_type
    assert_equal :basic, @turn.type
    return @deck1.cards[0] && @deck2.cards[0]
    assert_equal @player1, @turn.winner
  end

  def test_pile_cards_into_the_spoils_pile_for_basic_turn_type
    player1_starting_card = @player1.deck.cards.first
    player2_starting_card = @player2.deck.cards.first
    @turn.pile_cards
    assert_equal 2, @turn.spoils_of_war.count
    assert_includes @turn.spoils_of_war, player1_starting_card
    assert_includes @turn.spoils_of_war, player2_starting_card
    refute_includes @player1.deck.cards, player1_starting_card
    refute_includes @player2.deck.cards, player2_starting_card
  end

  def test_award_spoils_to_winner_of_basic_turn
    @turn.pile_cards
    assert_equal 2, @turn.spoils_of_war.count
    @turn.award_spoils(@player1)
    assert_empty  @turn.spoils_of_war
    assert_equal 5, @player1.deck.cards.count
    assert_equal 3, @player2.deck.cards.count
  end

  def test_war_turn_type_if_top_cards_are_same_rank
    setup_war_turn

    assert_equal :war, @war_turn.type
  end

  def test_who_is_the_winner_of_the_war_turn_type
    setup_war_turn

    assert_equal :war, @war_turn.type
    assert_equal @war_player2, @war_turn.winner
  end

  def test_pile_cards_into_spoils_pile_war_turn_type
    setup_war_turn

    @war_turn.pile_cards

    assert_equal 6, @war_turn.spoils_of_war.count
    assert_equal 1, @war_turn.player1.deck.cards.count
    assert_equal 1, @war_turn.player2.deck.cards.count
  end

  def test_award_spoils_war_turn_type
    setup_war_turn

    @war_turn.pile_cards
    @war_turn.award_spoils(@war_player2)

    assert_empty @war_turn.spoils_of_war
    assert_equal 1, @war_turn.player1.deck.cards.count
    assert_equal 7, @war_turn.player2.deck.cards.count
  end

  def test_mad_turn_type_if_top_and_third_card_have_same_rank
    setup_mad_turn

    assert_equal :mad, @mad_turn.type
  end

  def test_who_is_the_winner_of_the_mad_turn_type
    setup_mad_turn

    assert_equal :mad, @mad_turn.type
    assert_equal "No Winner", @mad_turn.winner
  end

  def test_pile_cards_into_spoils_pile_mad
    setup_mad_turn

    @mad_turn.pile_cards

    assert_equal 0, @mad_turn.spoils_of_war.count
    assert_equal 1, @mad_turn.player1.deck.cards.count
    assert_equal 1, @mad_turn.player2.deck.cards.count
  end

  def test_award_spoils_returns_nothing_if_mad_turn_type
    setup_mad_turn

    @mad_turn.pile_cards
    @mad_turn.award_spoils("No Winner")
    
    assert_empty @mad_turn.spoils_of_war
    assert_equal 1, @mad_turn.player1.deck.cards.count
    assert_equal 1, @mad_turn.player2.deck.cards.count
  end

  def setup_war_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    @war_player1 = Player.new("Megan", deck1)
    @war_player2 = Player.new("Aurora", deck2)
    @war_turn = Turn.new(@war_player1, @war_player2)
  end

  def setup_mad_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    @mad_player1 = Player.new("Megan", deck1)
    @mad_player2 = Player.new("Aurora", deck2)
    @mad_turn = Turn.new(@mad_player1, @mad_player2)
  end

end
