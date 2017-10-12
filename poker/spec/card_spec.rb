require 'card'
require 'rspec'

RSpec.describe Card do
  subject(:card) { Card.new(:hearts, 10) }

  describe "#initialize" do
    it "takes in a suite and a value" do
      expect(card.suite).to eq(:hearts)
      expect(card.value).to eq(10)
    end
  end

  describe "#to_s" do
    it "returns the card suite and value as string" do
      expect(card.to_s).to eq("♥10")
    end
  end
end
