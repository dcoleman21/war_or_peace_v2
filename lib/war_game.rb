require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class WarGame
  # attr_reader :cards
  # SUITS = ["Hearts", "Clubs", "Spades", "Diamonds"]
  #
  #
  # def initialize
  #   generate_deck
  # end
  #
  # def generate_deck
  #   @cards = []
  #   SUITS.each do |suit|
  #     [1..13].each do |rank|
  #       @cards << Card.new(suit, rank)
  #     end
  #   end
  # end

  def start
  #   turn.start
  # end


    @cards = []
    @cards << Card.new(:heart, 'Jack', 11)
    @cards << Card.new(:heart, '10', 10)
    @cards << Card.new(:heart, '9', 9)
    @cards << Card.new(:diamond, 'Jack', 11)
    @cards << Card.new(:heart, '8', 8)
    @cards << Card.new(:diamond, 'Queen', 12)
    @cards << Card.new(:heart, '3', 3)
    @cards << Card.new(:diamond, '2', 2)
    @cards << Card.new(:spade, 'Ace', 1)
    @cards << Card.new(:club, '2', 2)
    @cards << Card.new(:spade, 'Queen', 12)
    @cards << Card.new(:heart, '4', 4)
    @cards << Card.new(:diamond, '3', 3)
    @cards << Card.new(:spade, 'King', 13)
    @cards << Card.new(:club, '7', 7)
    @cards << Card.new(:diamond, '4', 4)
    @cards << Card.new(:heart, '6', 6)
    @cards << Card.new(:club, '10', 10)
    @cards << Card.new(:spade, 'Jack', 11)
    @cards << Card.new(:club, '8', 8)
    @cards << Card.new(:spade, '4', 4)
    @cards << Card.new(:diamond, 'Ace', 1)
    @cards << Card.new(:heart, '5', 5)
    @cards << Card.new(:spade, '5', 5)
    @cards << Card.new(:club, '6', 6)
    @cards << Card.new(:spade, '6', 6)
    @cards << Card.new(:club, 'Jack', 11)
    @cards << Card.new(:heart, '7', 7)
    @cards << Card.new(:diamond, '5', 5)
    @cards << Card.new(:spade, '7', 7)
    @cards << Card.new(:club, 'Ace', 1)
    @cards << Card.new(:heart, 'King', 13)
    @cards << Card.new(:club, '9', 9)
    @cards << Card.new(:spade, '8', 8)
    @cards << Card.new(:diamond, '6', 6)
    @cards << Card.new(:club, '5', 5)
    @cards << Card.new(:heart, 'Queen', 12)
    @cards << Card.new(:club, '4', 4)
    @cards << Card.new(:diamond, '7', 7)
    @cards << Card.new(:spade, '3', 3)
    @cards << Card.new(:diamond, '8', 8)
    @cards << Card.new(:club, 'King', 13)
    @cards << Card.new(:heart, '2', 2)
    @cards << Card.new(:diamond, '9', 9)
    @cards << Card.new(:spade, '9', 9)
    @cards << Card.new(:club, 'Queen', 12)
    @cards << Card.new(:diamond, '10', 10)
    @cards << Card.new(:heart, 'Ace', 1)
    @cards << Card.new(:spade, '10', 10)
    @cards << Card.new(:club, '3', 3)
    @cards << Card.new(:spade, '2', 2)
    @cards << Card.new(:diamond, 'King', 13)
    @shuffled = @cards.shuffle

    @deck1 = Deck.new(@shuffled.pop(26))
    @deck2 = Deck.new(@shuffled)

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora",@deck2)

    # @turn = Turn.new(@player1, @player2)



    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    "------------------------------------------------------------------"

    input = gets.chomp.upcase

    if input == "GO"
      p "Let's Play!"
      turn_count = 0
      loop do
        turn = Turn.new(@player1, @player2)
        turn_count += 1

        turn.spoils_of_war
        turn.type
        turn.winner
        turn.pile_cards
        turn.spoils_of_war
        turn.award_spoils(winner)
        # require "pry"; binding.pry
        #array of two cards, type is :basic
        # results = turn.pile_cards
        # turn1.spoils_of_war
          #if @player1.has_lost? == true || @player2.has_lost? == true || turn_count == 1_000_000
          #break
          # else
            if turn.type == :basic
              turn.spoils_of_war
              # turn.type
              turn.winner
              turn.pile_cards
              turn.spoils_of_war
              turn.award_spoils(winner)
              # turn.pile_cards
              p "Turn #{turn_count}: #{winner.name} won 2 cards"
            elsif turn.type == :war
              turn.pile_cards
              p "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
            else
              p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
            end

          turn.spoils_of_war.clear
          # end
      end
      if @player1.deck.cards.count == 0
        p "*** #{@player2.name} has won the game! ***"
      elsif @player2.deck.cards.count == 0
        p "*** #{@player1.name} has won the game! ***"
      else
        p "--- DRAW ---"
      end
    end
  end

end
