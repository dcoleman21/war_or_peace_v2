class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards[index].nil?
      0
    else
      cards[index].rank
    end
  end

  def high_ranking_cards
    cards.find_all do |card|
      card > 10
    end
  end

  def percent_high_ranking
    (high_cards_count.to_f / total_card_count * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end
end
