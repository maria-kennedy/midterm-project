# Rules of Five Card Draw Poker
# 1. Each player is dealt five cards.
# 2. Players bet; they may fold, see the current bet, or raise.
# 3. In turn, each player can choose to discard up to three cards and is then dealt new cards from the deck to replace the discarded ones.
# 4. Players bet again.
# 5. If any players have not folded, they reveal their hands; the strongest hand wins the pot.

# Card
# Represents a single playing card, identifiable by its suit and value.
class Card
    attr_reader :suit, :value

    def initialize(suit, value)
        @suit = suit
        @value = value
    end
end

# Deck
# Represents a deck of cards; responsible for shuffling and dealing cards.

class Deck
    suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    # getters and setters
    attr_reader :deck
    # attributes
    def initialize
        @deck = []
        # @length = deck.length

        suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
        values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
        
        suits.each do |suit|
            values.each do |value|
                @deck << (Card.new(suit, value))
            end
        end
    end

    # methods
    def shuffle
        @deck.shuffle
    end

    def deal
        @deck.pop
    end
end



# Hand
# Contains the logic for determining the strength of a hand (pair, three-of-a-kind, two-pair, etc.), and for deciding which hand beats another.
class Hand
    # iterate through each card in a player's hand
    # determine which strength value from hash
    # store player name and value in a hash called compare
    # new method that finds greatest value and returns name
    # if tie, winners split
    attr_accessor :hand

    def initialize(hand)
        @hand = hand
    end
              
    # def show_hand
    #     @hand.each do |card|
    #         puts "#{card.value} of #{card.suit}"
    #     end
    # end
end


# Player
# Represents a player in the game, holding a hand and a pot. This class should include methods to:
# • Ask the player which cards they wish to discard.
# • Determine whether the player wishes to fold, see, or raise.
class Player
    attr_accessor :name, :hand, :pot
    def initialize(name)
        @name = name
        @hand = Hand.new([])
        @pot = 0
    end
end



# Game
# Manages the overall flow of the poker game, including:
# • Holding the deck of cards.
# • Keeping track of whose turn it is.
# • Managing the pot and bets placed by players.
class Game
    # getters and setters

    
    # attributes


    # methods
end