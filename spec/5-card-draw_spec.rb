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