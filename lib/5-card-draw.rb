SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
UNICORN_NAMES = ['Rainbow Sparklehoof', 'Moonbeam Glittermane', 'Stardust Twinklehooves', 'Sunshine Rainbowmane', 'Crystal Sparkleshine', 'Starlight Shimmerhoof', 'Dreamy Stardusttail', 'Twilight Glitterhoof', 'Whispering Moonbeam', 'Mystical Sparklestride']


# Game
class Game
    # getters and setters
    attr_accessor :deck, :players, :num_players, :name
    # attributes
    def initialize(num_players = 0)
        @deck = Deck.new
        @num_players = num_players

        # player created from Player class
        @players = []
        num_players.times {@players << Player.new(@deck)}
        # initial hand delt to each player
        @players.each do |player|
            5.times {player.hand.reciever(@deck.deal)}
        end
    end
end

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
    attr_reader :the_deck

    def initialize
        @the_deck = []
        SUITS.each do |suit|
            VALUES.each do |value|
                @the_deck << (Card.new(suit, value))
            end
        end
    end

    # methods
    def shuffle
        @the_deck.shuffle!
    end

    def deal
        @the_deck.pop
    end
end



# Hand
# Contains the logic for determining the strength of a hand (pair, three-of-a-kind, two-pair, etc.), and for deciding which hand beats another.
class Hand 
    attr_reader :cards

    def initialize
        @cards = []
    end
    def reciever(card)
        @cards << card
    end

end


# Player
class Player
    attr_accessor :name, :hand, :pot
    def initialize(deck = nil)
        @name = UNICORN_NAMES.sample
        @pot = 0
        @hand = Hand.new
    end
end

