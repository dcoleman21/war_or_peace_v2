require './lib/turn'

class WarGame
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    welcome_message
    play_game
  end

  def play_game
    turn_count = 1
    until (@player1.has_lost? || @player2.has_lost? || turn_count == 1_000_000) do
      turn = Turn.new(@player1, @player2)
      p "Turn Type: #{turn.type}"
      winner = turn.winner
      if turn.type == :basic
        turn.pile_cards
        turn.award_spoils(winner)
        p "Turn #{turn_count}: #{winner.name} won 2 cards"
      elsif turn.type == :war
        turn.pile_cards
        turn.award_spoils(winner)
        puts "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
      else
        turn.pile_cards
        p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
      end
      turn_count += 1
    end
    game_over
  end

  def game_over
    if @player1.deck.cards.count == 0
      p "*** #{@player2.name} has won the game! ***"
    elsif @player2.deck.cards.count == 0
      p "*** #{@player1.name} has won the game! ***"
    else
      p "--- DRAW ---"
    end
  end

  def welcome_message
    input = ""
    until input == "GO" do
      p "Welcome to War! (or Peace) This game will be played with 52 cards."
      p "The players today are Megan and Aurora."
      p "Type 'GO' to start the game!"
      p "_________________________________"
      input = gets.chomp
    end
  end
end
