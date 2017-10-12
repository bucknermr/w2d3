require 'rspec'
require 'towers'

RSpec.describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe '#initialize' do
    it "sets up the board with 3 piles" do
      expect(game.board.length).to eq(3)
    end

    it "starts with 3 discs in the first pile" do
      expect(game.board[0].length).to eq(3)
    end

    it "starts with 0 discs in the other piles" do
      expect(game.board[1]).to be_empty
      expect(game.board[2]).to be_empty
    end

    it "starts with discs stacked from largest to smallest" do
      stack = [3, 2, 1]

      expect(game.board[0]).to eq(stack)
    end
  end

  describe "#move" do
    context "user provides valid move piles" do
      before(:each) { game.move(0, 1) }

      it "pops a disc off the from pile" do
        expect(game.board[0]).to eq([3, 2])
      end

      it "pushes a disc onto the to pile" do
        expect(game.board[1]).to eq([1])
      end
    end

    context "from pile is empty" do
      it "raises an error for 'empty pile!'" do
        expect { game.move(2, 1) }.to raise_error("empty pile!")
      end
    end

    context "user tries to put disc onto smaller disc" do
      it "raises error for 'can't move onto smaller disc!'" do
        game.move(0, 1)

        expect { game.move(0, 1) }.to raise_error("can't move onto smaller disc!")
      end
    end
  end


  describe "#won?" do
    won_board = [[], [3, 2, 1], [3, 2, 1]]
    other_board = [[], [1], [3, 2]]

    subject(:won_game) { TowersOfHanoi.new(won_board) }
    subject(:other_game) { TowersOfHanoi.new(other_board) }

    context "when the board is not won" do
      it "returns false" do
        expect(game.won?).to be_falsey
        expect(other_game.won?).to be_falsey
      end
    end

    context "when the board is won" do
      it "returns true" do
        expect(won_game.won?).to be_truthy
      end
    end

    # expect(won_game.won?).to eq(true)
  end
end
