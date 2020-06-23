# 1. refactor to use setup method, per what I've used before.
# It'll feel like a pain in the ass right now, 
# but will serve you _very_ well down the road. Think of this as a ruby-exercises
# practice to flex some new skills.

# 2. Combine your tests, test _only one thing_ in a test, but from
# a few different angles.
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  # here's how I did the setup method
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    cards = [@card1, @card2, @card3]
    @deck = Deck.new(cards)
  end

  def test_it_exists_with_card_attribute
    # this test combines two of your tests
    assert_instance_of Deck, @deck
    assert_equal 3, @deck.cards.count
    assert_includes @deck.cards, @card1
    assert_includes @deck.cards, @card2
    assert_includes @deck.cards, @card3
    # assert_equal [@card1, @card2, @card3], @deck.cards
    # user assert_includes instead of specifying exactly what the array is,
    # unless it's critical that the array order be exactly what it is. 
  end

  def test_it_has_attributes
    # "attributes" is too general. 
    # assert_equal [@card1, @card2, @card3], @deck.cards
  end

  def test_it_can_get_rank_of_card
    assert_equal 12, @deck.rank_of_card_at(0)
    assert_equal 14, @deck.rank_of_card_at(2)
    # don't need this .cards assertion anymore; not related to the test you've written
    # assert_equal [@card1, @card2, @card3], @deck.cards
  end

  def test_it_can_get_high_ranking_cards
    # convert this to `assert_includes`, instead of `assert_equal`
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_it_can_get_percent_high_ranking
    # this is great!
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_can_remove_cards
    
    # assert the count before removing card:
    assert_equal 3, @deck.cards.count
    @deck.remove_card(@card1)
    assert_equal 2, @deck.cards.count
    refute_includes @deck.cards, @card1 # use #refute_includes to specify that you
    # want the collection to _not_ have this card
    assert_equal [@card2, @card3], @deck.cards
    assert_equal [@card3], @deck.high_ranking_cards # high_ranking_cards is not 
    # part of testing #remove_card, so don't use this method in this test
    # percent_high_ranking isn't necessary to test that it removes cards. 
    assert_equal 50.0, @deck.percent_high_ranking
  end

  def test_it_can_add_cards
    # refactor this test based on all prior feedback!
    new_card = Card.new(:club, '5', 5)
    @deck.add_card(new_card)
    assert_equal [@card1, @card2, @card3, new_card], @deck.cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
    assert_equal 50.0, @deck.percent_high_ranking
  end
end
