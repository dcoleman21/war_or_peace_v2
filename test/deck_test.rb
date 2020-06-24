require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
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

  def test_it_can_get_rank_of_card
    assert_equal 12, @deck.rank_of_card_at(0)
    assert_equal 14, @deck.rank_of_card_at(2)
  end

  def test_it_can_get_high_ranking_cards_from_original_deck #when I use assert_includes it gives me a failure
    # assert_equal [@card1, @card3], @deck.high_ranking_cards
    assert_includes @deck.high_ranking_cards, @card1
    assert_includes @deck.high_ranking_cards, @card3
  end

  def test_it_can_get_percent_high_ranking_from_original_deck
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_can_remove_cards
    assert_equal 3, @deck.cards.count
    @deck.remove_card(@card1)
    assert_equal 2, @deck.cards.count
    refute_includes @deck.cards, @card1
  end

  def test_it_can_get_high_ranking_cards_after_card_removed
    # lets add an assertion _before_ removing the card, too, like:
    assert_includes @deck.high_ranking_cards, @card1
    
    @deck.remove_card(@card1)
    
    refute_includes @deck.high_ranking_cards, @card1
  end

  def test_it_can_get_percent_high_ranking_after_card_removed
    # add the "setup" assertion:
    assert_equal 66.67, @deck.percent_high_ranking
    
    @deck.remove_card(@card1)
    
    assert_equal 50.0, @deck.percent_high_ranking
  end

  def test_it_can_add_cards
    @deck.remove_card(@card1)
    @card4 = Card.new(:club, '5', 5)
    @deck.add_card(@card4)
    assert_equal 3, @cards.count
  end

  def test_it_can_get_high_ranking_with_new_card_added
    @deck.remove_card(@card1)
    @deck.add_card(@card4)
    assert_equal [@card3], @deck.high_ranking_cards # convert to assert_includes
  end

  def test_it_can_get_percent_high_ranking_with_new_card_added
    # this test is a bit confusing to me. I'll propose a test naming convention:
    # test_add_card_affects_percent_high_ranking
    
    # converted to "english", here's how I would read this test name:
    
    # "test that the #add_card method affects #percent_high_ranking"
    
    # in other words, I'd recommend a format of `test_method_under_test_result`
  
    
    @deck.remove_card(@card1)
    @deck.add_card(@card4)
    assert_equal [@card2, @card3, @card4], @deck.cards
    assert_equal 33.33, @deck.percent_high_ranking
  end
end
