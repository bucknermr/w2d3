require 'card'

class Deck
  attr_reader :cards

  def initialize(cards = Deck.setup)
    @cards = cards
  end

  def self.setup
    values = (2..14).to_a
    suites = [:hearts, :clubs, :diamonds, :spades]
    cards = []

    suites.each do |suite|
      values.each { |value| cards << Card.new(suite, value) }
    end

    cards
  end

  def shuffle
    # @cards.shuffle!
  end

  def draw
    @cards.pop
  end
end
