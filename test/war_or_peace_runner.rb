# Inside of this file, write the code to do the following:
#
# Create 52 Cards (A standard deck)
# Put those card into two Decks (some randomness would be nice here!)
# Create two players with the Decks you created
# Start the game using a new method called start
# This method will need to be included in a class - it is up to you which class to include it in - either existing or ✨new ✨
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

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
@cards.shuffle

@deck1 = Deck.new(@cards.pop(26))
@deck2 = Deck.new(@cards)

@player1 = Player.new("Megan", @deck1)
@player2 = Player.new("Aurora",@deck2

@turn = Turn.new(@player1, @player2)

@turn.start
