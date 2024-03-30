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
        @jackpot = 0
        @player = nil

        # player created from Player class
        @players = []
        num_players.times {@players << Player.new(@deck)}
        # initial hand delt to each player
        @players.each do |player|

            5.times {player.hand.recieve(@deck.deal)}
        end
        # puts "Welcome #{@players.each { |player| puts player.name }}!" # display player names
        puts 'Welcome! Player count: ' + num_players.to_s
    end

    def round
        # each player:
        @players.each do |player|
            puts "#{player.name}'s Turn!\nThis is your hand:\n#{player.hand.cards.join(', ')}"
            player.discard

            # asks player if they wish to fold, see, or raise
            puts 'Do you wish to fold, see, or raise (min bet is 50)?'
            input = gets.chomp.downcase
            action(input)
            if input == 'raise'
                puts 'How much would you like to raise?'
                raise_amount = gets.chomp.to_i
                player.pot -= raise_amount  # deduct raise amount from player's pot
                @jackpot += raise_amount        # add raise amount to jackpot
            end
        end

        # after all players have acted, determine the winner
        hand = Hand.new(@players)
        winner = hand.winner
        winner.pot += @jackpot
        puts "#{winner.name} wins the round! They have won #{@jackpot}!"

        # ask if players wish to play another round
        puts 'Would you like to play another round? (y/n)'
        again = gets.chomp.downcase
        if again == 'y'
        # if so, deal a new hand to each player
            @players.each do |player|
                player.hand = Hand.new  
                5.times {player.hand.recieve(@deck.deal)}
            end
            round
        else
            puts 'Thanks for playing!'
        end
    end


    def action(input)
        if input != 'fold'
            player.player.pot -= 50
            @jackpot += 50
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
        @the_deck.shuffle!
    end

    # methods
    def shuffle!
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

    def initialize(players = nil) 
        @cards = []
        @players = players 
    end

    def recieve(card)
        @cards << card
    end
    def remove(count=1)
        count.times { @cards.pop }
    end

    def to_s
        puts @cards
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

    def winner
        highest = 0
        winner = nil
        @players.each do |player|
            if player.hand.hand_score > highest
                highest = player.hand.hand_score
                winner = player
            end
        end
        return winner
    end

end


# Player
class Player
    attr_accessor :name, :hand, :pot, :score
    def initialize(deck = nil, pot = 500)
        @name = UNICORN_NAMES.sample
        @pot = pot
        @hand = Hand.new
        @score = @hand.hand_score
    end

    def discard
        puts 'Do you wish to discard any cards? (y/n)'
        response = gets.chomp.downcase

        if response == 'y'
            # remove requested number of cards from hand and return to deck, then deal new cards
            puts 'How many cards would you like to discard?'
            to_discard = gets.chomp.to_i
            to_discard.times do
                @hand.delete
                @hand.recieve(deck.deal)
            end
        else
            puts 'No cards discarded.'
        end
    end
end

