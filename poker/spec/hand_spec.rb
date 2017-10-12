require "rspec"
require "hand"
require "deck"
# require "card"

RSpec.describe Hand do
  subject(:hand) { Hand.new }
  let(:deck) { Deck.new }

  describe "#initialize" do
    it "draws 5 cards from the deck" do
      expect(hand.cards.length).to eq(5)
    end

    it "hand is comprised of card objects" do
      expect(hand.cards).to all(be_a(Card))
    end
  end

  describe "#discard" do
    let(:input) { [[:hearts, 3], [:hearts, 2], [:hearts, 5], [:hearts, 6]] }
    before(:each) { hand.discard(input) }

    it "discards the number of cards passed in" do
      expect(hand.cards.length).to eq(1)
    end

    it "discards cards corresponding to the input values" do
      expect(hand.cards[0].suite).to eq(:hearts)
      expect(hand.cards[0].value).to eq(4)
    end

    context "tries to discard more than 4 cards" do
      input = [[:hearts, 2], [:hearts, 3], [:hearts, 4], [:hearts, 5], [:hearts, 6]]
      it "raise an error" do
        expect { hand.discard(input) }.to raise_error("you can't discard more than 4 cards")
      end
    end
  end

  describe "#compare" do
    let(:deck) { Deck.new }

    it "compares the ranking to another hand"
  end

  describe "#evaluate" do
    it "returns the ranking of the hand (1 - 10)" do
      expect(hand.evaluate).to eq(9)
    end
  end

end
