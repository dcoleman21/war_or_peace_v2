class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = determine_turn_type
  end

  def determine_turn_type
    if top_card_different_rank?
      :basic
    elsif third_card_same_rank?
      :mad
    elsif top_card_same_rank?
      :war
    end
  end

  def top_card_different_rank?
    player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
  end

  def third_card_same_rank?
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  end

  def top_card_same_rank?
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      player2
    else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war
      @spoils_of_war.concat player1.deck.cards.shift(3)
      @spoils_of_war.concat player2.deck.cards.shift(3)
    else type == :mad
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    winner.deck.add_card(spoils_of_war)
    @spoils_of_war = []
  end

end
