require "rspec"
require "deck"

RSpec.describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "has 52 cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards).to all(be_a(Card))
    end
  end

  describe "shuffle" do
    let(:cards) { Deck.new.cards }

    it "shuffles the cards" do
      expect(deck.shuffle).not_to eq(cards)
    end

    it "mutates the cards array" do
      deck.shuffle
      expect(deck.cards).not_to eq(cards)
    end
  end

  describe "draw" do
    it "draws a card from the deck" do
      expect(deck.draw).to be_a(Card)
      expect(deck.cards.length).to eq(51)
    end
  end
end
