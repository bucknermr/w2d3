class TowersOfHanoi

  attr_reader :board

  def initialize(board = TowersOfHanoi.setup)
    @board = board
  end

  def self.setup
    [[3, 2, 1], [], []]
  end

  def move(from, to)
    raise 'empty pile!' if board[from].empty?
    unless board[to].empty? || board[from].last < board[to].last
      raise "can't move onto smaller disc!"
    end

    board[to].push(board[from].pop)
  end

  def won?
    return false unless board[0].empty?

    board[1].length == 3 || board[2].length == 3
  end


end
