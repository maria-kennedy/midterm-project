require_relative '../lib/5-card-draw'

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
            expect(d1.deck.length).to eq(52)
        end
    end

    describe '#shuffle' do
        it 'shuffles the deck' do
            d2 = Deck.new
            d3 = Deck.new
            expect(d2.deck).not_to eq(d3.deck)
        end
    end

    describe '#deal' do
        it 'deals a card from the deck' do          
            d4 = Deck.new
            c2 = d4.deal
            expect(d4.deck.length).to eq(51) # length should be 51 after dealing a card
            expect(c2).to be_a(Card)
        end
    end
end