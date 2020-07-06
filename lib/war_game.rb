require './lib/turn'

class WarGame
  attr_reader :turn_count

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

    until game_over? do
      turn = Turn.new(@player1, @player2)
      p "Turn Type: #{turn.type}"

      turn.pile_cards
      turn.award_spoils(turn.winner)

      turn_count += 1
      print_turn_summary(turn)
    end
    print_game_summary(turn)
  end

  def print_turn_summary(turn)
    case turn.type
    when :basic
      p "Turn #{turn_count}: #{turn.winner.name} won 2 cards"
    when :war
      p "Turn #{turn_count}: WAR - #{turn.winner.name} won 6 cards"
    when :mad
      p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
    end
  end

  def game_over?
    @player1.has_lost? || @player2.has_lost? || turn_count == 1_000_000
  end

  def neither_player_won?
   !@player1.has_lost? && !@player2.has_lost?
  end

  def print_game_summary(turn)
    if neither_player_won?
      p "-----DRAW-----"
    else
      p "*** #{turn.winner.name} has won the game! ***"
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
