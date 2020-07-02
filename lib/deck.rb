class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    found_high = []
    cards.each do |card|
      if card.rank >= 11
        found_high << card
      end
    end
    found_high
  end

  def percent_high_ranking
    total_card_count = @cards.count
    high_cards_count = high_ranking_cards.count
    (high_cards_count.to_f / total_card_count * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
    # @cards.concat(new_card)
    # @cards = @cards.flatten
  end
end
