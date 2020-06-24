require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists_with_card_attribute
    assert_instance_of Deck, @deck
    assert_equal 3, @deck.cards.count
    assert_includes @deck.cards, @card1
    assert_includes @deck.cards, @card2
    assert_includes @deck.cards, @card3
  end

  def test_rank_of_card_at_returns_card_rank
    assert_equal 12, @deck.rank_of_card_at(0)
    assert_equal 14, @deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards_returns_high_rank_card
    assert_includes @deck.high_ranking_cards, @card1
    assert_includes @deck.high_ranking_cards, @card3
    assert_equal 2, @deck.high_ranking_cards.count
  end

  def test_high_ranking_cards_does_not_return_removed_card
    assert_includes @deck.high_ranking_cards, @card1
    @deck.remove_card

    refute_includes @deck.high_ranking_cards, @card1
  end

  def test_percent_high_ranking_returns_percent_as_float
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_percent_high_ranking_returns_new_percent
    assert_equal 66.67, @deck.percent_high_ranking
    @deck.remove_card
    assert_equal 50.0, @deck.percent_high_ranking
  end

  def test_remove_card_removes_card
    assert_equal 3, @deck.cards.count
    @deck.remove_card

    assert_equal 2, @deck.cards.count
    refute_includes @deck.cards, @card1
  end

  def test_add_card_adds_card
    assert_equal 3, @deck.cards.count
    new_card = Card.new(:club, '5', 5)
    refute_includes @deck.cards, new_card
    @deck.add_card(new_card)

    assert_includes @deck.cards, new_card
    assert_equal 4, @cards.count
  end

  def test_it_can_get_high_ranking_with_new_card_added
    new_card = Card.new(:club, '5', 5)
    @deck.add_card(new_card)
    assert_includes @deck.high_ranking_cards, @card3
  end

  def test_add_card_affects_percent_high_ranking
    assert_equal 66.67, @deck.percent_high_ranking
    new_card = Card.new(:club, '5', 5)
    @deck.add_card(new_card)

    assert_equal 50.0, @deck.percent_high_ranking
  end
end
