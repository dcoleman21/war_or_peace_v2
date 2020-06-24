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
    
    if top_card_same_rank?
      :basic
    # I moved the following line of code to it's own method. See how we can 
    # now call top_card_same_rank? or top_card_different_rank? 
    # elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
    #   :war
    end
  end
  
  def top_card_same_rank?
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end
  
  def top_card_different_rank?
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    end
  end

  def pile_cards
    if type == :basic
      # don't access cards directly from here. Use `deck.remove_card`.
      # remember how we already wrote that method?
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
    end 
  end

end
