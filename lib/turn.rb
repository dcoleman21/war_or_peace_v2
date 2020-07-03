class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = type
  end

  def type
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mad
    elsif (player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0))
      :basic
    else
      :war
    end
  end

  def top_card_same_rank?
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end

  def third_card_same_rank?
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  end

  def top_card_different_rank?
    player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else type == :mad
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    elsif type == :mad
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    if winner.class == Player
      until @spoils_of_war.empty? do
        winner.deck.add_card(@spoils_of_war.shift)
      end
    end
  end
end
