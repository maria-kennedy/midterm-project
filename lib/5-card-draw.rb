# Rules of Five Card Draw Poker
# 1. Each player is dealt five cards.
# 2. Players bet; they may fold, see the current bet, or raise.
# 3. In turn, each player can choose to discard up to three cards and is then dealt new cards from the deck to replace the discarded ones.
# 4. Players bet again.
# 5. If any players have not folded, they reveal their hands; the strongest hand wins the pot.



# Card
# Represents a single playing card, identifiable by its suit and value.
class Card
    # getters and setters
    attr_reader :suit, :value

    
    # attributes
    def initialize(suit, value)
        @suit = suit
        @value = value
    end
    # methods
    
end

# Deck
# Represents a deck of cards; responsible for shuffling and dealing cards.

class Deck
    # getters and setters

    
    # attributes



    # methods
    
end



# Hand
# Contains the logic for determining the strength of a hand (pair, three-of-a-kind, two-pair, etc.), and for deciding which hand beats another.
class Hand
    # getters and setters

    
    # attributes


    # methods
end



# Player
# Represents a player in the game, holding a hand and a pot. This class should include methods to:
# • Ask the player which cards they wish to discard.
# • Determine whether the player wishes to fold, see, or raise.
class Player
    # getters and setters

    
    # attributes


    # methods
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