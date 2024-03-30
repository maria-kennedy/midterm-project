require_relative '../lib/5-card-draw'

# Game RSpec Test
# Manages the overall flow of the poker game, including: Holding the deck of cards. Keeping track of whose turn it is. Managing the pot and bets placed by players.
RSpec.describe Game do
    let(:game) {Game.new(1)}
    # want game to create a new deck
    context 'when a game is created' do
        it 'creates a game with a deck' do
            expect(game.deck).to be_a(Deck)
        end
    # want game to ask how many players
        it 'checks how many players are playing' do
            expect(game.num_players).to eq(1)
        end
    # want game to assign Player objects to players
        it 'creates a new Player object' do
            expect(game.players[0]).not_to eq(nil)
        end

        it 'deals a hand to each player' do
            expect(game.players[0].hand.cards.length).to eq(5)
        end
    end

    describe '#round' do
    let(:game) {Game.new(1)}
        context 'when a round is played' do
            it 'allows each player to discard' do
                allow(game.players[0].hand).to receive(:cards).and_return('y').and_return('1')
            end
        end
    end

    describe '#action' do
    # it 'updates pot and jackpot when a player sees' do
    #   game.instance_variable_set(:@jackpot, 0)
    #   game.action('see')
    #   expect(game.instance_variable_get(:@jackpot)).to eq(50)
    # end

    # it 'updates pot and jackpot when a player raises' do
    #   game.instance_variable_set(:@pot, 0)
    #   game.instance_variable_set(:@jackpot, 0)
    #   game.action('raise')
    #   expect(game.instance_variable_get(:@pot)).to eq(0)
    #   expect(game.instance_variable_get(:@jackpot)).to eq(50)
    # end

    it 'does not update pot and jackpot when a player folds' do
      game.instance_variable_set(:@pot, 0)
      game.instance_variable_set(:@jackpot, 0)
      game.action('fold')
      expect(game.instance_variable_get(:@pot)).to eq(0)
      expect(game.instance_variable_get(:@jackpot)).to eq(0)
    end
  end
end
 

# Card RSpec tests
# Represents a single playing card, identifiable by its suit and value.
RSpec.describe Card do
    describe '#initialize' do
        it 'creates a card with a suit and value' do
            c1 = Card.new('Hearts', 'Q')
            expect(c1.suit).to eq('Hearts')
            expect(c1.value).to eq('Q')
        end
    end
end


# Deck RSpec Test
# Represents a deck of cards; responsible for shuffling and dealing cards.
RSpec.describe Deck do
    describe '#initialize' do
        it 'creates a deck of 52 cards' do
            d1 = Deck.new
            expect(d1.the_deck.length).to eq(52)
        end
    end

    describe '#shuffle' do
        it 'shuffles the deck' do
            d2 = Deck.new
            d3 = Deck.new
            d2.shuffle!
            expect(d2.the_deck).not_to eq(d3.the_deck)
        end
    end

    describe '#deal' do
        it 'deals a card from the deck' do          
            d4 = Deck.new
            c2 = d4.deal
            expect(d4.the_deck.length).to eq(51) # length should be 51 after dealing a card
            expect(c2).to be_a(Card)
        end
    end
end

# Hand
# Contains the logic for determining the strength of a hand (pair, three-of-a-kind, two-pair, etc.), and for deciding which hand beats another.
RSpec.describe Hand do
    describe '#hand_score' do
        context 'when the hand contains four of a kind' do
            it 'returns a hand score of 8' do
                hand = Hand.new
                hand.cards = [Card.new('Spades', 'A'),Card.new('Hearts', 'A'),Card.new('Diamonds', 'A'),Card.new('Clubs', 'A')]
                expect(hand.hand_score).to eq(8)
            end
        end

        context 'when the hand contains three of a kind' do
            it 'returns a hand score of 7' do
                hand = Hand.new
                hand.cards = [Card.new('Spades', 'K'),Card.new('Hearts', 'K'), Card.new('Diamonds', 'K'), Card.new('Clubs', '2')]
                expect(hand.hand_score).to eq(7)
            end
        end

        context 'when the hand contains a pair' do
            it 'returns a hand score of 2' do
                hand = Hand.new
                hand.cards = [Card.new('Spades', 'Q'), Card.new('Hearts', 'Q'), Card.new('Diamonds', 'K'), Card.new('Clubs', 'J')]
                expect(hand.hand_score).to eq(2)
            end
        end

        context 'when the hand does not contain any matching values' do
            it 'returns a hand score of 1' do
                hand = Hand.new
                hand.cards = [Card.new('Spades', 'A'), Card.new('Hearts', '8'), Card.new('Diamonds', '7'), Card.new('Clubs', 'J')]
                expect(hand.hand_score).to eq(1)
            end
        end
    end
    # describe '#winner' do
    #     it 'determines the winner of the hand' do
    #     end
    # end
end

# Player
# Represents a player in the game, holding a hand and a pot. This class should include methods to:
# • Ask the player which cards they wish to discard.
# • Determine whether the player wishes to fold, see, or raise.
RSpec.describe Player do
    let(:a_player) {Player.new}
    let(:ghost_player) {Player.new}

    context 'when a player is created' do
        it 'creates a player with a random name and a pot with $500' do
            expect(a_player.name).not_to eq(nil)
            expect(a_player.pot).to eq(500)
        end
    end
    context 'when a player discards cards' do
        it 'swaps out the cards in the hand' do
            royal_flush = [Card.new('Spades', 'A'), Card.new('Spades', 'K'), Card.new('Spades', 'Q'), Card.new('Spades', 'J'), Card.new('Spades', '10')]
            ghost_player.hand.cards = royal_flush
            expect(ghost_player.hand.cards.length).to eq(5)
            allow(ghost_player.hand).to receive(:cards).and_return('y').and_return('1')
            expect(ghost_player.hand.cards).not_to eq(royal_flush)
            # expect(ghost_player.hand.cards.length).to eq(5)
        end
    end
    context 'when a player updates their pot' do
        it 'updates the player pot' do
            a_player.pot = 100
            expect(a_player.pot).to eq(100)
        end
    end
end