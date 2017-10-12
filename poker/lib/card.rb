class Card
  attr_reader :suite, :value

  VALUES = {
    11 => 'J',
    12 => 'Q',
    13 => 'K',
    14 => 'A'
  }
  SUITES = {
    hearts: '♥',
    diamonds: '♦',
    clubs: '♣',
    spades: '♠'
  }

  def initialize(suite, value)
    @suite = suite
    @value = value
  end

  def to_s
    val = value < 11 ? value.to_s : VALUES[value]
    "#{SUITES[suite]}#{val}"
  end
end
