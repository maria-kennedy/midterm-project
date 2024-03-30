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
            5.times {player.hand.recieve(@deck.deal)}
        end
    end



    def round
        # each player:

            # asks player if they wish to discard (call discard method on hand)

            # asks player if they wish to fold, see, or raise

            # updates player's pot

        # after all players have acted, determine the winner (call winner method on hand)

        # award the pot to the winner

        # ask if players wish to play another round

        # if so, deal a new hand to each player
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

    def to_s
        "#{value} of #{suit}"
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
    attr_accessor :cards

    def initialize
        @cards = []
    end

    def recieve(card)
        @cards << card
    end

    def hand_score
        # check for 4 of a kind
        if @cards.any?{ |card| @cards.count{ |c| c.value == card.value } == 4 }
            return 8
        # check for 3 of a kind
        elsif @cards.any?{ |card| @cards.count{ |c| c.value == card.value } == 3 }
            return 7
        # check for a pair
        elsif @cards.any?{ |card| @cards.count{ |c| c.value == card.value } == 2 }
            return 2
        else
            return 1
        end
    end

    def winner()

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

    def discard
        puts 'Do you wish to discard any cards? (y/n)'
        response = gets.chomp.downcase
        if response == 'y'
            # remove requested number of cards from hand and return to deck, then deal new cards
            puts 'How many cards would you like to discard?'
            toss = gets.chomp.to_i
            
        end
        
    end
end

###################################
    # def hand_score
    #     # royal flush
    #     if @cards.all? { |card| %w(A K Q J 10).include?(card.value) } && @cards.map(&:suit).uniq.length == 1
    #         return 10
    #     # four of a kind
    #     elsif @cards.any? { |card| @cards.count { |c| c.value == card.value } == 4 }
    #         return 8
    #     # full house
    #     elsif @cards.map(&:value).uniq.length == 2 && @cards.any? { |card| @cards.count { |c| c.value == card.value } == 3 }
    #         return 7
    #     # flush
    #     elsif @cards.map(&:suit).uniq.length == 1
    #         return 6
    #     # three of a kind
    #     elsif @cards.any? { |card| @cards.count { |c| c.value == card.value } == 3 }
    #         return 4
    #     # two pair
    #     elsif @cards.map(&:value).uniq.length == 3
    #         return 3
    #     # pair
    #     elsif @cards.map(&:value).uniq.length == 4
    #         return 2
    #     # high card
    #     else
    #         return 1
    #     end
    # end